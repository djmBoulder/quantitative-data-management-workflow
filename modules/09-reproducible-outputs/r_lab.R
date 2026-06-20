# 09 Reproducible Outputs and Handoff Files R Lab
# Purpose: create an analysis-ready handoff package from synthetic survey data,
# including datasets, a summary table, a derived codebook, a workflow log,
# and a handoff memo.
# Run this script from the repository root or from an RStudio project at the repository root.

# Load packages used in this lab.
if (!requireNamespace("dplyr", quietly = TRUE)) {
  stop("The dplyr package is required for this lab.")
}
if (!requireNamespace("stringr", quietly = TRUE)) {
  stop("The stringr package is required for this lab.")
}
if (!requireNamespace("readr", quietly = TRUE)) {
  stop("The readr package is required for this lab.")
}
if (!requireNamespace("haven", quietly = TRUE)) {
  stop("The haven package is required for this lab.")
}

library(dplyr)
library(stringr)

# Store project-relative paths in objects.
source_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
analysis_csv <- file.path("data", "output", "synthetic_gss_like_analysis_ready_r.csv")
analysis_rds <- file.path("data", "output", "synthetic_gss_like_analysis_ready_r.rds")
analysis_dta <- file.path("data", "output", "synthetic_gss_like_analysis_ready_r.dta")
summary_csv <- file.path("data", "output", "module-09-r-region-summary.csv")
codebook_csv <- file.path("data", "output", "module-09-r-derived-codebook.csv")
handoff_memo <- file.path("data", "output", "module-09-r-handoff-memo.md")
log_file <- file.path("logs", "module-09-r-log.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Confirm the source file exists before doing any work.
stopifnot(file.exists(source_csv))

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

cat("Module 09 R reproducible outputs log\n")
cat("Source file:", source_csv, "\n\n")

# Import the raw teaching file. The raw CSV remains unchanged.
survey_raw <- read.csv(source_csv, check.names = FALSE, stringsAsFactors = FALSE)
names(survey_raw) <- clean_names(names(survey_raw))

cat("Imported rows:", nrow(survey_raw), "\n")
cat("Imported variables:", ncol(survey_raw), "\n")
cat("Imported variable names:\n")
print(names(survey_raw))

# Confirm required variables are present.
required_vars <- c(
  "respondent_id", "year", "age", "gender", "race_ethnicity",
  "education", "marital_status", "region", "employment_status",
  "hours_worked", "household_income", "self_rated_health",
  "smoking_status", "physical_activity_days", "survey_weight"
)
stopifnot(all(required_vars %in% names(survey_raw)))

# Clean and derive analysis variables. Keep source variables until the final
# select() so the transformation can be audited while the script runs.
survey_clean <- survey_raw |>
  group_by(respondent_id, year) |>
  mutate(
    duplicate_order = row_number(),
    duplicate_person_year = as.integer(n() > 1)
  ) |>
  ungroup() |>
  mutate(
    age_clean = as.numeric(age),
    age_clean = if_else(age_clean %in% c(-9, 999), NA_real_, age_clean),

    gender_text = str_to_lower(str_trim(gender)),
    gender_text = na_if(gender_text, ""),
    gender_text = na_if(gender_text, "-9"),
    gender_clean = case_when(
      gender_text == "female" ~ "Female",
      gender_text == "male" ~ "Male",
      gender_text == "nonbinary" ~ "Nonbinary",
      gender_text == "prefer not to answer" ~ NA_character_,
      TRUE ~ NA_character_
    ),

    race_ethnicity_clean = str_squish(str_to_title(race_ethnicity)),
    race_ethnicity_clean = na_if(race_ethnicity_clean, "-9"),

    education_clean = str_squish(str_to_title(education)),
    education_clean = na_if(education_clean, "-9"),

    marital_status_clean = str_squish(str_to_title(marital_status)),
    marital_status_clean = na_if(marital_status_clean, "-9"),

    region_clean = str_squish(str_to_title(region)),
    region_clean = na_if(region_clean, "-9"),

    employment_status_clean = str_squish(str_to_title(employment_status)),
    employment_status_clean = na_if(employment_status_clean, "-9"),

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

    health_text = str_to_lower(str_trim(self_rated_health)),
    health_text = na_if(health_text, ""),
    health_text = na_if(health_text, "-9"),
    health_text = na_if(health_text, "dk"),
    self_rated_health_ord = case_when(
      health_text == "poor" ~ 1,
      health_text == "fair" ~ 2,
      health_text == "good" ~ 3,
      health_text == "very good" ~ 4,
      health_text == "excellent" ~ 5,
      TRUE ~ NA_real_
    ),

    smoking_status_clean = str_squish(str_to_title(smoking_status)),
    smoking_status_clean = na_if(smoking_status_clean, ""),
    smoking_status_clean = na_if(smoking_status_clean, "-9"),

    activity_text = str_to_lower(str_trim(physical_activity_days)),
    activity_text = na_if(activity_text, "-9"),
    activity_text = na_if(activity_text, "not asked"),
    activity_text = na_if(activity_text, "eight"),
    physical_activity_days_num = as.numeric(activity_text),

    weight_text = str_trim(survey_weight),
    weight_text = gsub(",", ".", weight_text),
    weight_text = na_if(weight_text, ""),
    weight_text = na_if(weight_text, "-9"),
    survey_weight_num = as.numeric(weight_text),

    analytic_sample_flag = as.integer(
      duplicate_order == 1 &
        !is.na(age_clean) &
        age_clean >= 18 &
        age_clean <= 89 &
        !is.na(gender_clean) &
        !is.na(household_income_num) &
        !is.na(self_rated_health_ord) &
        !is.na(survey_weight_num) &
        survey_weight_num > 0
    )
  )

# Validate the cleaned values before export.
stopifnot(all(is.na(survey_clean$age_clean) | (survey_clean$age_clean >= 18 & survey_clean$age_clean <= 89)))
stopifnot(all(is.na(survey_clean$physical_activity_days_num) | (survey_clean$physical_activity_days_num >= 0 & survey_clean$physical_activity_days_num <= 7)))
stopifnot(all(is.na(survey_clean$survey_weight_num) | survey_clean$survey_weight_num > 0))

cat("\nAnalytic sample flag counts:\n")
print(survey_clean |> count(analytic_sample_flag, name = "n"))

cat("\nClean gender counts:\n")
print(survey_clean |> count(gender_clean, name = "n"))

# Create the analysis-ready handoff dataset. This file applies the analytic
# sample restriction, so the memo must document the restriction clearly.
analysis_ready <- survey_clean |>
  filter(analytic_sample_flag == 1) |>
  transmute(
    respondent_id,
    year,
    age = age_clean,
    gender = gender_clean,
    race_ethnicity = race_ethnicity_clean,
    education = education_clean,
    marital_status = marital_status_clean,
    region = region_clean,
    employment_status = employment_status_clean,
    hours_worked = hours_worked_num,
    household_income = household_income_num,
    self_rated_health = self_rated_health_ord,
    smoking_status = smoking_status_clean,
    physical_activity_days = physical_activity_days_num,
    survey_weight = survey_weight_num,
    source_file = "synthetic_gss_like_person_2024.csv"
  )

stopifnot(nrow(analysis_ready) > 0)
stopifnot(!any(duplicated(analysis_ready[c("respondent_id", "year")])))

cat("\nAnalysis-ready rows:", nrow(analysis_ready), "\n")
cat("Analysis-ready variables:", ncol(analysis_ready), "\n")
cat("\nAnalysis-ready numeric summaries:\n")
print(summary(analysis_ready[c("age", "hours_worked", "household_income", "self_rated_health", "physical_activity_days", "survey_weight")]))

# Create a simple descriptive output table.
region_summary <- analysis_ready |>
  group_by(region) |>
  summarise(
    n = n(),
    mean_age = round(mean(age, na.rm = TRUE), 1),
    mean_household_income = round(mean(household_income, na.rm = TRUE), 0),
    mean_survey_weight = round(mean(survey_weight, na.rm = TRUE), 2),
    .groups = "drop"
  ) |>
  arrange(region)

cat("\nRegion summary table:\n")
print(region_summary)

# Create a derived codebook for the handoff variables.
derived_codebook <- data.frame(
  variable = names(analysis_ready),
  description = c(
    "Synthetic respondent identifier.",
    "Survey year.",
    "Age in years after recoding special missing codes to missing.",
    "Cleaned gender category with capitalization standardized.",
    "Cleaned race and ethnicity category.",
    "Cleaned education category.",
    "Cleaned marital status category.",
    "Cleaned Census-style region category.",
    "Cleaned employment status category.",
    "Usual hours worked per week as numeric.",
    "Household income as numeric dollars.",
    "Self-rated health ordinal scale where 1 is Poor and 5 is Excellent.",
    "Cleaned smoking status category.",
    "Physical activity days per week as numeric.",
    "Positive survey weight as numeric.",
    "Source file used to create the handoff dataset."
  ),
  source = c(
    "Respondent ID", "Survey Year", "age", "Gender", "Race / ethnicity",
    "education", "Marital Status", "region", "employment status",
    "hours_worked", "Household Income", "Self Rated Health",
    "smoking_status", "Physical Activity Days", "survey weight",
    "Created by module 09 R lab"
  ),
  coding_notes = c(
    "Kept as identifier; duplicate respondent-year rows removed from analysis-ready output.",
    "Renamed from Survey Year during name cleaning.",
    "-9 and 999 treated as missing before analytic sample restriction.",
    "Inconsistent capitalization and whitespace standardized; nonresponse removed from analysis-ready output.",
    "Capitalization and whitespace standardized.",
    "Capitalization and whitespace standardized.",
    "Capitalization and whitespace standardized.",
    "Capitalization and whitespace standardized.",
    "Capitalization and whitespace standardized.",
    "-8, -9, N/A, and text value forty treated as missing.",
    "-8, 999999, Not asked, currency marks, and commas handled before numeric conversion.",
    "DK, -9, and blanks treated as missing.",
    "Blanks and -9 treated as missing.",
    "-9, Not asked, and text value eight treated as missing.",
    "Blank, -9, and comma decimal formats handled before numeric conversion.",
    "Constant value added for provenance."
  ),
  stringsAsFactors = FALSE
)

# Export handoff files. These are generated outputs and should be reproducible
# from this script, not edited by hand.
readr::write_csv(analysis_ready, analysis_csv)
saveRDS(analysis_ready, analysis_rds)
haven::write_dta(analysis_ready, analysis_dta)
readr::write_csv(region_summary, summary_csv)
readr::write_csv(derived_codebook, codebook_csv)

# Write a short handoff memo in Markdown.
memo_lines <- c(
  "# Module 09 R Handoff Memo",
  "",
  "## Purpose",
  "This handoff package contains analysis-ready synthetic survey data and companion documentation generated from a scripted R workflow.",
  "",
  "## File Provenance",
  paste0("- Source file: `", source_csv, "`."),
  "- Script: `modules/09-reproducible-outputs/r_lab.R`.",
  paste0("- Workflow log: `", log_file, "`."),
  "",
  "## Generated Outputs",
  paste0("- Analysis-ready CSV: `", analysis_csv, "`."),
  paste0("- Analysis-ready RDS: `", analysis_rds, "`."),
  paste0("- Analysis-ready Stata file: `", analysis_dta, "`."),
  paste0("- Region summary table: `", summary_csv, "`."),
  paste0("- Derived codebook: `", codebook_csv, "`."),
  "",
  "## Sample Construction",
  paste0("- Imported rows: ", nrow(survey_raw), "."),
  paste0("- Analysis-ready rows: ", nrow(analysis_ready), "."),
  "- Analysis-ready output keeps rows with valid age, gender, income, self-rated health, positive survey weight, and no duplicate respondent-year key.",
  "",
  "## Known Limitations",
  "- These data are synthetic and intended only for teaching.",
  "- Some raw records contain intentional teaching problems and are excluded from the analysis-ready output by the scripted sample flag.",
  "- CSV files do not preserve all metadata, so the derived codebook should travel with the dataset.",
  "",
  "## Reproducibility Note",
  "Do not manually edit the generated output files. Update the script and rerun it if the handoff package needs to change."
)
writeLines(memo_lines, handoff_memo)

cat("\nReproducible output workflow complete.\n")
cat("Analysis-ready CSV saved to:", analysis_csv, "\n")
cat("Analysis-ready DTA saved to:", analysis_dta, "\n")
cat("Derived codebook saved to:", codebook_csv, "\n")
cat("Handoff memo saved to:", handoff_memo, "\n")

# Close the log at the end of the scripted workflow.
sink()
