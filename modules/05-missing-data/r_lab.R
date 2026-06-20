# 05 Missing Data and Analytic Sample Construction R Lab
# Purpose: identify, recode, document, and report missing data while creating
# transparent complete-case and analytic-sample flags.
# Run this script from the repository root or from an RStudio project at the repository root.

# Load packages used in this lab.
if (!requireNamespace("dplyr", quietly = TRUE)) {
  stop("The dplyr package is required for this lab.")
}
if (!requireNamespace("stringr", quietly = TRUE)) {
  stop("The stringr package is required for this lab.")
}
if (!requireNamespace("janitor", quietly = TRUE)) {
  stop("The janitor package is required for this lab.")
}

library(dplyr)
library(stringr)

# Store project-relative paths in objects.
raw_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
working_rds <- file.path("data", "working", "synthetic_gss_like_person_2024_missing_sample.rds")
working_csv <- file.path("data", "working", "synthetic_gss_like_person_2024_missing_sample.csv")
sample_report <- file.path("data", "output", "module-05-r-sample-construction.csv")
missing_report <- file.path("data", "output", "module-05-r-missing-summary.txt")
log_file <- file.path("logs", "module-05-r-log.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Confirm the raw teaching file exists.
stopifnot(file.exists(raw_csv))

# Helper function to standardize names into lowercase snake case.
clean_names <- function(x) {
  x <- str_trim(x)
  x <- str_to_lower(x)
  x <- gsub("[^a-z0-9]+", "_", x)
  x <- gsub("^_+|_+$", "", x)
  x <- gsub("_+", "_", x)
  x[x == "survey_year"] <- "year"
  x
}

# Start a text log for review.
sink(log_file, split = TRUE)

cat("Module 05 R missing data and analytic sample log\n")
cat("Raw data file:", raw_csv, "\n\n")

# Import the raw CSV without manual edits.
survey_raw <- read.csv(raw_csv, check.names = FALSE, stringsAsFactors = FALSE)
names(survey_raw) <- clean_names(names(survey_raw))

imported_n <- nrow(survey_raw)

cat("Raw missingness counted with is.na() before recoding special codes:\n")
print(colSums(is.na(survey_raw)))

cat("\nRaw gender values including special codes:\n")
print(table(survey_raw$gender, useNA = "ifany"))

cat("\nRaw self-rated health values including special codes:\n")
print(table(survey_raw$self_rated_health, useNA = "ifany"))

# Recode special missing codes and impossible values to R NA values.
survey_missing <- survey_raw |>
  mutate(
    age_clean = as.numeric(age),
    age_clean = if_else(age_clean %in% c(-9, 999), NA_real_, age_clean),

    gender_text = str_to_lower(str_trim(gender)),
    gender_text = na_if(gender_text, ""),
    gender_text = na_if(gender_text, "-9"),
    gender_text = na_if(gender_text, "prefer not to answer"),
    gender_clean = case_when(
      gender_text == "female" ~ "Female",
      gender_text == "male" ~ "Male",
      gender_text == "nonbinary" ~ "Nonbinary",
      TRUE ~ NA_character_
    ),

    health_text = str_to_lower(str_trim(self_rated_health)),
    health_text = na_if(health_text, ""),
    health_text = na_if(health_text, "-9"),
    health_text = na_if(health_text, "dk"),
    health_ord = case_when(
      health_text == "poor" ~ 1,
      health_text == "fair" ~ 2,
      health_text == "good" ~ 3,
      health_text == "very good" ~ 4,
      health_text == "excellent" ~ 5,
      TRUE ~ NA_real_
    ),

    hours_text = str_to_lower(str_trim(hours_worked)),
    hours_text = na_if(hours_text, "-8"),
    hours_text = na_if(hours_text, "-9"),
    hours_text = na_if(hours_text, "n/a"),
    hours_text = na_if(hours_text, "forty"),
    hours_worked_num = as.numeric(hours_text),

    income_text = str_to_lower(str_trim(household_income)),
    income_text = gsub("\\$", "", income_text),
    income_text = gsub(",", "", income_text),
    income_text = na_if(income_text, ""),
    income_text = na_if(income_text, "-8"),
    income_text = na_if(income_text, "999999"),
    income_text = na_if(income_text, "not asked"),
    household_income_num = as.numeric(income_text),

    activity_text = str_to_lower(str_trim(physical_activity_days)),
    activity_text = na_if(activity_text, "-9"),
    activity_text = na_if(activity_text, "not asked"),
    activity_text = na_if(activity_text, "eight"),
    physical_activity_days_num = as.numeric(activity_text),

    weight_text = str_trim(survey_weight),
    weight_text = gsub(",", ".", weight_text),
    weight_text = na_if(weight_text, ""),
    weight_text = na_if(weight_text, "-9"),
    survey_weight_num = as.numeric(weight_text)
  )

# Validate plausible ranges after recoding.
stopifnot(all(is.na(survey_missing$age_clean) | (survey_missing$age_clean >= 18 & survey_missing$age_clean <= 89)))
stopifnot(all(is.na(survey_missing$hours_worked_num) | (survey_missing$hours_worked_num >= 0 & survey_missing$hours_worked_num <= 60)))
stopifnot(all(is.na(survey_missing$physical_activity_days_num) | (survey_missing$physical_activity_days_num >= 0 & survey_missing$physical_activity_days_num <= 7)))
stopifnot(all(is.na(survey_missing$survey_weight_num) | survey_missing$survey_weight_num > 0))

core_vars <- c("age_clean", "gender_clean", "health_ord", "household_income_num", "survey_weight_num")
detail_vars <- c(core_vars, "hours_worked_num", "physical_activity_days_num")

# Variable-by-variable missingness.
missing_wide <- survey_missing |>
  summarise(across(all_of(detail_vars), ~ sum(is.na(.x)))) |>
  as.data.frame()

missing_by_variable <- data.frame(
  variable = names(missing_wide),
  missing_n = as.integer(unlist(missing_wide[1, ], use.names = FALSE)),
  total_n = nrow(survey_missing)
) |>
  mutate(missing_percent = round(100 * missing_n / total_n, 1))

cat("\nMissingness by variable after recoding special codes to NA:\n")
print(missing_by_variable)

cat("\nGender missingness check:\n")
print(janitor::tabyl(survey_missing$gender_clean))

cat("\nHealth missingness check:\n")
print(janitor::tabyl(survey_missing$health_ord))

# Row-wise missingness and complete-case indicators.
survey_missing <- survey_missing |>
  mutate(
    rowmiss_core = rowSums(is.na(across(all_of(core_vars)))),
    complete_case_core = complete.cases(across(all_of(core_vars))),
    analytic_sample_flag = complete_case_core &
      !is.na(age_clean) &
      age_clean >= 18 &
      age_clean <= 89 &
      !is.na(survey_weight_num) &
      survey_weight_num > 0
  )

cat("\nRow-wise missingness across core variables:\n")
print(survey_missing |> count(rowmiss_core, name = "n"))

cat("\nComplete-case indicator:\n")
print(survey_missing |> count(complete_case_core, name = "n"))

cat("\nAnalytic sample flag:\n")
print(survey_missing |> count(analytic_sample_flag, name = "n"))

# Track sample size changes across steps.
sample_construction <- data.frame(
  step = 1:5,
  n = c(
    imported_n,
    sum(!is.na(survey_missing$age_clean)),
    sum(survey_missing$complete_case_core),
    sum(survey_missing$complete_case_core & !is.na(survey_missing$survey_weight_num) & survey_missing$survey_weight_num > 0),
    sum(survey_missing$analytic_sample_flag)
  ),
  description = c(
    "Imported rows",
    "Rows with valid age after recoding -9 and 999",
    "Rows complete on age gender health income and survey weight",
    "Rows complete on core variables with positive survey weight",
    "Rows included in analytic_sample_flag"
  )
)

cat("\nSample construction table:\n")
print(sample_construction)

# Use filter() to inspect the analytic sample without removing excluded rows from the saved working file.
analytic_preview <- survey_missing |>
  filter(analytic_sample_flag)

cat("\nAnalytic sample preview summaries:\n")
print(summary(analytic_preview[c("age_clean", "household_income_num", "survey_weight_num")]))

# Save reports.
write.csv(sample_construction, sample_report, row.names = FALSE)

missing_lines <- c(
  "Module 05 R missing-data summary",
  paste("Source file:", raw_csv),
  "Special codes recoded to NA include -8, -9, 999, 999999, DK, N/A, Not asked, and impossible text values.",
  "complete_case_core requires nonmissing age_clean, gender_clean, health_ord, household_income_num, and survey_weight_num.",
  "analytic_sample_flag keeps all rows in the file and marks included observations instead of silently deleting cases.",
  "",
  "Variable-level missingness after recoding:",
  paste(missing_by_variable$variable, missing_by_variable$missing_n, sep = ": ")
)
writeLines(missing_lines, missing_report)

# Save working files with missing-data flags. The raw CSV remains unchanged.
saveRDS(survey_missing, working_rds)
write.csv(survey_missing, working_csv, row.names = FALSE)

cat("\nMissing-data workflow complete.\n")
cat("Working R file saved to:", working_rds, "\n")
cat("Sample construction report saved to:", sample_report, "\n")

# Close the log at the end of the scripted workflow.
sink()
