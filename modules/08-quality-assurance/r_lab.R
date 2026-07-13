# 08 Quality Assurance and Validation Checks R Lab
# Purpose: build QA checks into the synthetic_gss_like workflow and report
# fatal checks, warnings, merge diagnostics, and unresolved issues.
# Beginner note:
# - Run this script from the repository root with source("modules/08-quality-assurance/r_lab.R").
# - If running interactively, run this setup section first so paths and folders exist.
# - Generated files go only to data/working/, data/output/, or logs/.

# Load packages used in this lab.
if (!requireNamespace("dplyr", quietly = TRUE)) {
  stop("The dplyr package is required for this lab.")
}
if (!requireNamespace("stringr", quietly = TRUE)) {
  stop("The stringr package is required for this lab.")
}

library(dplyr)
library(stringr)

# Store project-relative paths in objects.
person_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
region_csv <- file.path("data", "synthetic", "synthetic_gss_like_region_context.csv")
qa_report <- file.path("data", "output", "module-08-r-qa-report.md")
log_file <- file.path("logs", "module-08-r-log.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Fatal checks: required files must exist.
stopifnot(file.exists(person_csv))
stopifnot(file.exists(region_csv))

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

cat("Module 08 R quality assurance log\n\n")

# Import person data and check basic structure.
person <- read.csv(person_csv, check.names = FALSE, stringsAsFactors = FALSE)
names(person) <- clean_names(names(person))

required_vars <- c(
  "respondent_id", "year", "age", "gender", "region",
  "household_income", "self_rated_health", "physical_activity_days", "survey_weight"
)

# Fatal checks: required variables and expected raw structure.
stopifnot(all(required_vars %in% names(person)))
person_rows <- nrow(person)
person_vars <- ncol(person)
stopifnot(person_rows == 240)
stopifnot(person_vars >= 16)

cat("Person rows:", person_rows, "\n")
cat("Person variables:", person_vars, "\n")
cat("Person variable names:\n")
print(names(person))

cat("\nSummary of selected variables:\n")
print(summary(person[c("age", "gender", "region", "household_income", "self_rated_health", "survey_weight")]))

# Duplicate ID checks. These are warnings in raw data, not fatal errors.
duplicate_id_count <- sum(duplicated(person$respondent_id))
duplicate_id_rows <- person |>
  count(respondent_id, name = "n") |>
  filter(n > 1)

cat("\nDuplicate respondent_id rows:\n")
print(duplicate_id_rows)

# Range checks and special-code checks.
age_range_warnings <- sum(person$age < 18 | person$age > 89, na.rm = TRUE)
age_special_codes <- sum(person$age %in% c(-9, 999), na.rm = TRUE)

gender_clean_check <- str_to_lower(str_trim(person$gender))
valid_gender_values <- c("female", "male", "nonbinary", "prefer not to answer", "-9", "")
invalid_gender_categories <- sum(!gender_clean_check %in% valid_gender_values)
blank_gender <- sum(str_trim(person$gender) == "")

survey_weight_missing_like <- sum(str_trim(person$survey_weight) %in% c("", "-9"))

person <- person |>
  mutate(
    gender_clean_check = str_to_lower(str_trim(gender)),
    region_clean = str_to_lower(str_trim(region)),
    region_clean = if_else(region_clean == "-9", NA_character_, region_clean),
    employment_clean = str_to_lower(str_trim(employment_status)),
    hours_text = str_to_lower(str_trim(hours_worked)),
    hours_text = if_else(hours_text %in% c("-8", "-9", "n/a", "forty"), NA_character_, hours_text),
    hours_worked_num = as.numeric(hours_text)
  )

employment_hours_warnings <- person |>
  filter(
    employment_clean %in% c("unemployed", "retired", "not in labor force"),
    !is.na(hours_worked_num),
    hours_worked_num > 40
  ) |>
  nrow()

cat("\nGender categories after standardizing case and whitespace:\n")
print(person |> count(gender_clean_check, name = "n"))

cat("\nanyNA() check on imported person data:\n")
print(anyNA(person))

cat("\nColumn-level NA counts after creating QA helper variables:\n")
print(colSums(is.na(person)))

# Confirm expected variables are still distinct after helper creation.
stopifnot(nrow(distinct(person, respondent_id, year)) <= nrow(person))

# Prepare and validate region context before joining.
region_context <- read.csv(region_csv, check.names = FALSE, stringsAsFactors = FALSE)
names(region_context) <- clean_names(names(region_context))
region_context <- region_context |>
  rename(region_clean = region_name) |>
  mutate(region_clean = str_to_lower(str_trim(region_clean)))

region_rows <- nrow(region_context)
stopifnot(!any(duplicated(region_context$region_clean)))

cat("\nRegion context rows:", region_rows, "\n")
cat("Region context names:\n")
print(names(region_context))
cat("\nRegion context key counts:\n")
print(region_context |> count(region_clean, name = "n"))

# Merge validation: many person rows to one region context row.
pre_merge_rows <- nrow(person)
person_region <- left_join(person, region_context, by = "region_clean", relationship = "many-to-one")
post_merge_rows <- nrow(person_region)
stopifnot(post_merge_rows == pre_merge_rows)

unmatched_region_keys <- anti_join(
  person |> distinct(region_clean),
  region_context |> distinct(region_clean),
  by = "region_clean"
)
context_only_keys <- anti_join(
  region_context |> distinct(region_clean),
  person |> distinct(region_clean),
  by = "region_clean"
)
matched_rows <- semi_join(person, region_context, by = "region_clean") |> nrow()

cat("\nMerge validation:\n")
cat("Rows before merge:", pre_merge_rows, "\n")
cat("Rows after merge:", post_merge_rows, "\n")
cat("Matched person rows:", matched_rows, "\n")
cat("Person region keys without context match:\n")
print(unmatched_region_keys)
cat("Context-only keys:\n")
print(context_only_keys)

# Write a QA report with fatal checks, warnings, and unresolved issues.
qa_lines <- c(
  "# Module 08 R QA Report",
  "",
  "## Fatal Checks Passed",
  "- Required input files were found.",
  "- Required person-level variables were confirmed.",
  "- Person rows matched the expected 240 rows.",
  "- Region context key region_clean was unique.",
  "",
  "## Warning-Level Issues",
  paste0("- Duplicate respondent_id values after first occurrence: ", duplicate_id_count, "."),
  paste0("- Duplicate respondent_id rows requiring review: ", nrow(duplicate_id_rows), "."),
  paste0("- Age values outside 18-89 before cleaning: ", age_range_warnings, "."),
  paste0("- Age special codes -9 or 999 before cleaning: ", age_special_codes, "."),
  paste0("- Invalid standardized gender categories: ", invalid_gender_categories, "."),
  paste0("- Blank gender values: ", blank_gender, "."),
  paste0("- Survey weight blank or -9 values: ", survey_weight_missing_like, "."),
  paste0("- Logical warning, non-employed categories with hours_worked_num greater than 40: ", employment_hours_warnings, "."),
  "",
  "## Merge Validation",
  paste0("- Person rows before merge: ", pre_merge_rows, "."),
  paste0("- Rows after merge: ", post_merge_rows, "."),
  paste0("- Matched person rows: ", matched_rows, "."),
  paste0("- Person region keys without context match: ", paste(unmatched_region_keys$region_clean, collapse = "; "), "."),
  paste0("- Context-only region keys: ", paste(context_only_keys$region_clean, collapse = "; "), "."),
  "",
  "## Unresolved Issues",
  "- Duplicate respondent IDs require review before respondent-level analysis.",
  "- Special missing codes and inconsistent category capitalization require cleaning before analysis.",
  "- Unmatched region keys require documentation or key cleaning before region-level analysis."
)
writeLines(qa_lines, qa_report)

cat("\nQA workflow complete.\n")
cat("QA report saved to:", qa_report, "\n")

# Close the log at the end of the scripted workflow.
sink()
