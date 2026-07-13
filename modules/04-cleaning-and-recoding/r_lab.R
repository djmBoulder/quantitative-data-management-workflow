# 04 Cleaning, Typing, Labeling, and Recoding Variables R Lab
# Purpose: clean selected synthetic_gss_like variables while preserving the
# original source variables and documenting recode decisions.
# Beginner note:
# - Run this script from the repository root with source("modules/04-cleaning-and-recoding/r_lab.R").
# - If running interactively, run this setup section first so paths and folders exist.
# - Generated files go only to data/working/, data/output/, or logs/.

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
working_rds <- file.path("data", "working", "synthetic_gss_like_person_2024_cleaned.rds")
working_csv <- file.path("data", "working", "synthetic_gss_like_person_2024_cleaned.csv")
decision_log <- file.path("data", "output", "module-04-r-cleaning-decisions.txt")
log_file <- file.path("logs", "module-04-r-log.txt")

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

cat("Module 04 R cleaning and recoding log\n")
cat("Raw data file:", raw_csv, "\n\n")

# Import the raw CSV without manual edits.
survey_raw <- read.csv(raw_csv, check.names = FALSE, stringsAsFactors = FALSE)
names(survey_raw) <- clean_names(names(survey_raw))

cat("Raw structure before cleaning:\n")
str(survey_raw[c("age", "gender", "region", "employment_status", "hours_worked",
                 "household_income", "self_rated_health", "physical_activity_days",
                 "survey_weight")])

cat("\nRaw gender values:\n")
print(table(survey_raw$gender, useNA = "ifany"))

cat("\nRaw employment values:\n")
print(table(survey_raw$employment_status, useNA = "ifany"))

# Clean selected variables while preserving original source variables.
survey_clean <- survey_raw |>
  mutate(
    # Numeric cleaning: preserve age, create age_clean.
    age_clean = if_else(age %in% c(-9, 999), NA_real_, as.numeric(age)),

    # Recode continuous age into transparent categories.
    age_group_num = case_when(
      age_clean >= 18 & age_clean <= 29 ~ 1,
      age_clean >= 30 & age_clean <= 44 ~ 2,
      age_clean >= 45 & age_clean <= 64 ~ 3,
      age_clean >= 65 ~ 4,
      TRUE ~ NA_real_
    ),
    age_group = factor(
      age_group_num,
      levels = c(1, 2, 3, 4),
      labels = c("18-29", "30-44", "45-64", "65+")
    ),

    # String cleaning: trim whitespace and standardize capitalization.
    gender_text_clean = str_to_lower(str_trim(gender)),
    gender_text_clean = recode(
      gender_text_clean,
      "-9" = NA_character_,
      "prefer not to answer" = NA_character_
    ),
    gender_text_clean = na_if(gender_text_clean, ""),
    gender_clean = case_when(
      gender_text_clean == "female" ~ 1,
      gender_text_clean == "male" ~ 2,
      gender_text_clean == "nonbinary" ~ 3,
      TRUE ~ NA_real_
    ),
    gender_clean = factor(
      gender_clean,
      levels = c(1, 2, 3),
      labels = c("Female", "Male", "Nonbinary")
    ),

    # Demonstrate uppercase text for checking standardization.
    region_text_clean = str_to_lower(str_trim(region)),
    region_text_clean = if_else(region_text_clean == "-9", NA_character_, region_text_clean),
    region_upper_check = str_to_upper(region_text_clean),
    region_code = factor(region_text_clean),
    region_from_code = as.character(region_code),

    # Convert respondent ID to character for systems that require text IDs.
    respondent_id_text = as.character(respondent_id),

    # Clean numeric-looking strings before conversion.
    hours_worked_text = str_to_lower(str_trim(hours_worked)),
    hours_worked_text = if_else(
      hours_worked_text %in% c("-8", "-9", "n/a", "forty"),
      NA_character_,
      hours_worked_text
    ),
    hours_worked_num = as.numeric(hours_worked_text),

    household_income_text = str_to_lower(str_trim(household_income)),
    household_income_text = gsub("\\$", "", household_income_text),
    household_income_text = gsub(",", "", household_income_text),
    household_income_text = if_else(
      household_income_text %in% c("-8", "999999", "not asked", ""),
      NA_character_,
      household_income_text
    ),
    household_income_num = as.numeric(household_income_text),

    physical_activity_text = str_to_lower(str_trim(physical_activity_days)),
    physical_activity_text = if_else(
      physical_activity_text %in% c("-9", "not asked", "eight"),
      NA_character_,
      physical_activity_text
    ),
    physical_activity_days_num = as.numeric(physical_activity_text),

    survey_weight_text = str_trim(survey_weight),
    survey_weight_text = gsub(",", ".", survey_weight_text),
    survey_weight_text = if_else(survey_weight_text == "-9", NA_character_, survey_weight_text),
    survey_weight_num = as.numeric(survey_weight_text),

    # Binary variable from employment status.
    employment_text_clean = str_to_lower(str_trim(employment_status)),
    employment_text_clean = recode(
      employment_text_clean,
      "-8" = NA_character_,
      "-9" = NA_character_
    ),
    employment_text_clean = na_if(employment_text_clean, ""),
    employed_flag = case_when(
      employment_text_clean %in% c("employed full time", "employed part time") ~ 1,
      employment_text_clean %in% c("unemployed", "student", "retired", "not in labor force") ~ 0,
      TRUE ~ NA_real_
    ),
    employed_flag = factor(
      employed_flag,
      levels = c(0, 1),
      labels = c("Not employed", "Employed")
    ),

    # Ordinal self-rated health variable.
    health_text_clean = str_to_lower(str_trim(self_rated_health)),
    health_text_clean = recode(
      health_text_clean,
      "-9" = NA_character_,
      "dk" = NA_character_
    ),
    health_text_clean = na_if(health_text_clean, ""),
    health_ord_num = case_when(
      health_text_clean == "poor" ~ 1,
      health_text_clean == "fair" ~ 2,
      health_text_clean == "good" ~ 3,
      health_text_clean == "very good" ~ 4,
      health_text_clean == "excellent" ~ 5,
      TRUE ~ NA_real_
    ),
    health_ord = factor(
      health_ord_num,
      levels = c(1, 2, 3, 4, 5),
      labels = c("Poor", "Fair", "Good", "Very good", "Excellent"),
      ordered = TRUE
    )
  ) |>
  group_by(gender_clean) |>
  mutate(mean_hours_by_gender = mean(hours_worked_num, na.rm = TRUE)) |>
  ungroup()

# Review raw and cleaned variables.
cat("\nGender recode check:\n")
print(table(survey_clean$gender, survey_clean$gender_clean, useNA = "ifany"))

cat("\nGender counts from dplyr::count():\n")
print(survey_clean |> count(gender_clean, name = "n"))

cat("\nAge group check:\n")
print(table(survey_clean$age_group, useNA = "ifany"))

cat("\nEmployment flag check:\n")
print(janitor::tabyl(survey_clean$employed_flag))

cat("\nHealth ordinal check:\n")
print(table(survey_clean$health_ord, useNA = "ifany"))

cat("\nCleaned numeric summaries:\n")
print(summary(survey_clean[c("age_clean", "hours_worked_num", "household_income_num",
                             "physical_activity_days_num", "survey_weight_num")]))

# Simple validation checks. These stop the script if a cleaned value falls outside the expected range.
stopifnot(all(is.na(survey_clean$age_clean) | (survey_clean$age_clean >= 18 & survey_clean$age_clean <= 89)))
stopifnot(all(is.na(survey_clean$hours_worked_num) | (survey_clean$hours_worked_num >= 0 & survey_clean$hours_worked_num <= 60)))
stopifnot(all(is.na(survey_clean$physical_activity_days_num) | (survey_clean$physical_activity_days_num >= 0 & survey_clean$physical_activity_days_num <= 7)))
stopifnot(all(is.na(survey_clean$survey_weight_num) | survey_clean$survey_weight_num > 0))

# Save a simple cleaning decision log.
decision_lines <- c(
  "Module 04 R cleaning decision log",
  paste("Source file:", raw_csv),
  "age_clean: age with -9 and 999 set to missing.",
  "age_group: age_clean recoded into 18-29, 30-44, 45-64, and 65+.",
  "gender_clean: raw gender trimmed, lowercased, and recoded into factor levels.",
  "region_text_clean and region_code: raw region trimmed/lowercased and converted to factor for category practice.",
  "hours_worked_num: text codes -8, -9, N/A, and forty set to missing before as.numeric().",
  "household_income_num: dollar signs and commas removed; -8, 999999, and Not asked set to missing.",
  "employed_flag: full-time and part-time employment coded Employed; other known statuses coded Not employed.",
  "health_ord: self-rated health recoded from Poor to Excellent as an ordered factor.",
  "Original source variables were preserved."
)
writeLines(decision_lines, decision_log)

# Save cleaned working copies. The raw CSV remains unchanged.
saveRDS(survey_clean, working_rds)
write.csv(survey_clean, working_csv, row.names = FALSE)

cat("\nCleaning workflow complete.\n")
cat("Cleaned R file saved to:", working_rds, "\n")
cat("Cleaning decision log saved to:", decision_log, "\n")

# Close the log at the end of the scripted workflow.
sink()
