# 10 Capstone Data Management Portfolio R Lab
# Purpose: build one complete reproducible workflow from raw synthetic inputs
# to an analysis-ready dataset, codebook, QA report, workflow memo, and log.
# Beginner note:
# - Run this script from the repository root with source("modules/10-capstone/r_lab.R").
# - If running interactively, run this setup section first so paths and folders exist.
# - Generated files go only to data/working/, data/output/, or logs/.

# Load packages used in this capstone workflow.
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
person_2024_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
person_2025_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2025.csv")
region_csv <- file.path("data", "synthetic", "synthetic_gss_like_region_context.csv")

analysis_csv <- file.path("data", "output", "capstone_analysis_ready_r.csv")
analysis_rds <- file.path("data", "output", "capstone_analysis_ready_r.rds")
analysis_dta <- file.path("data", "output", "capstone_analysis_ready_r.dta")
codebook_csv <- file.path("data", "output", "capstone_codebook_r.csv")
qa_report_md <- file.path("data", "output", "capstone_qa_report_r.md")
workflow_memo_md <- file.path("data", "output", "capstone_workflow_memo_r.md")
log_file <- file.path("logs", "capstone_r_log.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Required input files must exist before the workflow begins.
stopifnot(file.exists(person_2024_csv))
stopifnot(file.exists(person_2025_csv))
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

read_person_file <- function(path, source_label) {
  out <- read.csv(path, check.names = FALSE, stringsAsFactors = FALSE)
  names(out) <- clean_names(names(out))
  out |>
    mutate(source_file = source_label)
}

# Start a text log for review.
sink(log_file, split = TRUE)

cat("Capstone R workflow log\n\n")

# ---------------------------------------------------------------------------
# 1. Import raw synthetic person-level files.
# ---------------------------------------------------------------------------

person_2024 <- read_person_file(person_2024_csv, "synthetic_gss_like_person_2024.csv")
person_2025 <- read_person_file(person_2025_csv, "synthetic_gss_like_person_2025.csv")

required_person_vars <- c(
  "respondent_id", "year", "age", "gender", "race_ethnicity",
  "education", "marital_status", "region", "employment_status",
  "hours_worked", "household_income", "self_rated_health",
  "smoking_status", "physical_activity_days", "survey_weight"
)
stopifnot(all(required_person_vars %in% names(person_2024)))
stopifnot(all(required_person_vars %in% names(person_2025)))

n_2024 <- nrow(person_2024)
n_2025 <- nrow(person_2025)

cat("Rows imported from 2024 person file:", n_2024, "\n")
cat("Rows imported from 2025 person file:", n_2025, "\n")

# ---------------------------------------------------------------------------
# 2. Append person-level files and verify row counts.
# ---------------------------------------------------------------------------

person_appended <- bind_rows(person_2024, person_2025)
n_appended <- nrow(person_appended)
stopifnot(n_appended == n_2024 + n_2025)

cat("Rows after append:", n_appended, "\n")

duplicate_person_year <- person_appended |>
  count(respondent_id, year, name = "n") |>
  filter(n > 1)

cat("\nDuplicate respondent-year keys:\n")
print(duplicate_person_year)

# ---------------------------------------------------------------------------
# 3. Clean, recode, and handle missing data.
# ---------------------------------------------------------------------------

person_clean <- person_appended |>
  group_by(respondent_id, year) |>
  mutate(
    duplicate_order = row_number(),
    duplicate_group_n = n()
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
      TRUE ~ NA_character_
    ),

    race_ethnicity_clean = str_squish(str_to_title(race_ethnicity)),
    race_ethnicity_clean = na_if(race_ethnicity_clean, "-9"),

    education_clean = str_squish(str_to_title(education)),
    education_clean = na_if(education_clean, "-9"),

    marital_status_clean = str_squish(str_to_title(marital_status)),
    marital_status_clean = na_if(marital_status_clean, "-9"),

    region_key = str_to_lower(str_trim(region)),
    region_key = na_if(region_key, "-9"),
    region_clean = str_squish(str_to_title(region_key)),

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
    survey_weight_num = as.numeric(weight_text)
  )

stopifnot(all(is.na(person_clean$age_clean) | (person_clean$age_clean >= 18 & person_clean$age_clean <= 89)))
stopifnot(all(is.na(person_clean$physical_activity_days_num) | (person_clean$physical_activity_days_num >= 0 & person_clean$physical_activity_days_num <= 7)))
stopifnot(all(is.na(person_clean$survey_weight_num) | person_clean$survey_weight_num > 0))

missing_summary <- person_clean |>
  summarise(
    missing_age = sum(is.na(age_clean)),
    missing_gender = sum(is.na(gender_clean)),
    missing_income = sum(is.na(household_income_num)),
    missing_health = sum(is.na(self_rated_health_ord)),
    missing_weight = sum(is.na(survey_weight_num)),
    missing_region_key = sum(is.na(region_key))
  )

cat("\nMissing-data summary after recoding:\n")
print(missing_summary)

# ---------------------------------------------------------------------------
# 4. Import and merge region context.
# ---------------------------------------------------------------------------

region_context <- read.csv(region_csv, check.names = FALSE, stringsAsFactors = FALSE)
names(region_context) <- clean_names(names(region_context))
region_context <- region_context |>
  rename(region_key = region_name) |>
  mutate(
    region_key = str_to_lower(str_trim(region_key)),
    region_median_income = as.numeric(gsub("[$,]", "", region_median_income)),
    region_unemployment_rate = as.numeric(gsub("%", "", region_unemployment_rate)),
    urbanicity_index = as.numeric(urbanicity_index)
  )

stopifnot(!any(duplicated(region_context$region_key)))

pre_merge_rows <- nrow(person_clean)
person_merged <- left_join(
  person_clean,
  region_context,
  by = "region_key",
  relationship = "many-to-one"
) |>
  mutate(
    region_merge_status = if_else(is.na(region_median_income), "unmatched", "matched")
  )
post_merge_rows <- nrow(person_merged)
stopifnot(post_merge_rows == pre_merge_rows)

unmatched_region_keys <- anti_join(
  person_clean |> distinct(region_key),
  region_context |> distinct(region_key),
  by = "region_key"
)
context_only_keys <- anti_join(
  region_context |> distinct(region_key),
  person_clean |> distinct(region_key),
  by = "region_key"
)

cat("\nMerge status counts:\n")
print(person_merged |> count(region_merge_status, name = "n"))
cat("\nPerson region keys without context match:\n")
print(unmatched_region_keys)
cat("\nContext region keys without person rows:\n")
print(context_only_keys)

# ---------------------------------------------------------------------------
# 5. Create final sample flag and analysis-ready dataset.
# ---------------------------------------------------------------------------

person_final <- person_merged |>
  mutate(
    analytic_sample_flag = as.integer(
      duplicate_order == 1 &
        region_merge_status == "matched" &
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

sample_summary <- person_final |>
  count(analytic_sample_flag, name = "n")

cat("\nAnalytic sample flag counts:\n")
print(sample_summary)

analysis_ready <- person_final |>
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
    census_division,
    region_median_income,
    region_unemployment_rate,
    urbanicity_index,
    employment_status = employment_status_clean,
    hours_worked = hours_worked_num,
    household_income = household_income_num,
    self_rated_health = self_rated_health_ord,
    smoking_status = smoking_status_clean,
    physical_activity_days = physical_activity_days_num,
    survey_weight = survey_weight_num,
    source_file
  )

stopifnot(nrow(analysis_ready) > 0)
stopifnot(!any(duplicated(analysis_ready[c("respondent_id", "year")])))

cat("\nFinal analysis-ready rows:", nrow(analysis_ready), "\n")
cat("Final analysis-ready variables:", ncol(analysis_ready), "\n")

# ---------------------------------------------------------------------------
# 6. Write capstone outputs.
# ---------------------------------------------------------------------------

codebook <- data.frame(
  variable = names(analysis_ready),
  description = c(
    "Synthetic respondent identifier.",
    "Survey year.",
    "Age in years after special missing codes were recoded.",
    "Cleaned gender category.",
    "Cleaned race and ethnicity category.",
    "Cleaned education category.",
    "Cleaned marital status category.",
    "Cleaned person-level region category.",
    "Contextual Census division from region file.",
    "Contextual region median income from region file.",
    "Contextual region unemployment rate from region file.",
    "Contextual urbanicity index from region file.",
    "Cleaned employment status category.",
    "Usual hours worked per week as numeric.",
    "Household income as numeric dollars.",
    "Self-rated health ordinal scale where 1 is Poor and 5 is Excellent.",
    "Cleaned smoking status category.",
    "Physical activity days per week as numeric.",
    "Positive survey weight as numeric.",
    "Synthetic source file used for the row."
  ),
  source_or_derivation = c(
    "Person files",
    "Person files",
    "age; -9 and 999 set to missing",
    "Gender; capitalization and nonresponse cleaned",
    "Race / ethnicity; capitalization cleaned",
    "education; capitalization cleaned",
    "Marital Status; capitalization cleaned",
    "region; cleaned and used for region merge",
    "Region context file",
    "Region context file",
    "Region context file",
    "Region context file",
    "employment status; capitalization cleaned",
    "hours_worked; special codes and text values set to missing",
    "Household Income; currency marks, commas, special codes, and text values cleaned",
    "Self Rated Health; DK and special codes set to missing before ordinal coding",
    "smoking_status; blanks and special codes set to missing",
    "Physical Activity Days; special codes and text values set to missing",
    "survey weight; comma decimals, blanks, and special codes cleaned",
    "Created during import for provenance"
  ),
  stringsAsFactors = FALSE
)

qa_lines <- c(
  "# Capstone R QA Report",
  "",
  "## Append Checks",
  paste0("- 2024 input rows: ", n_2024, "."),
  paste0("- 2025 input rows: ", n_2025, "."),
  paste0("- Appended rows: ", n_appended, "."),
  "- Appended rows were checked against the sum of input rows.",
  paste0("- Duplicate respondent-year keys diagnosed: ", nrow(duplicate_person_year), "."),
  "",
  "## Missing Data And Coding Checks",
  paste0("- Missing age after recoding: ", missing_summary$missing_age, "."),
  paste0("- Missing gender after recoding: ", missing_summary$missing_gender, "."),
  paste0("- Missing income after recoding: ", missing_summary$missing_income, "."),
  paste0("- Missing health after recoding: ", missing_summary$missing_health, "."),
  paste0("- Missing survey weight after recoding: ", missing_summary$missing_weight, "."),
  "- Range checks passed for age, physical activity days, and survey weight.",
  "",
  "## Merge Checks",
  paste0("- Person rows before region merge: ", pre_merge_rows, "."),
  paste0("- Person rows after region merge: ", post_merge_rows, "."),
  paste0("- Person region keys without context match: ", paste(unmatched_region_keys$region_key, collapse = "; "), "."),
  paste0("- Context-only region keys: ", paste(context_only_keys$region_key, collapse = "; "), "."),
  "",
  "## Final Sample",
  paste0("- Final analysis-ready rows: ", nrow(analysis_ready), "."),
  paste0("- Final analysis-ready variables: ", ncol(analysis_ready), "."),
  "- Final respondent-year keys were checked for duplicates."
)

memo_lines <- c(
  "# Capstone R Workflow Memo",
  "",
  "## Purpose",
  "This portfolio uses synthetic survey-style data to demonstrate a reproducible data management workflow from raw inputs to an analysis-ready dataset.",
  "",
  "## Raw Inputs",
  paste0("- `", person_2024_csv, "`"),
  paste0("- `", person_2025_csv, "`"),
  paste0("- `", region_csv, "`"),
  "",
  "## Script And Log",
  "- Script: `modules/10-capstone/r_lab.R`.",
  paste0("- Log: `", log_file, "`."),
  "",
  "## Major Decisions",
  "- Person-level files were appended after row counts were checked.",
  "- Special missing codes and text placeholders were converted to missing values in derived variables.",
  "- Region context was merged with a many-to-one join after checking key uniqueness.",
  "- The final analytic sample keeps nonduplicate respondent-year rows with matched region context and valid core variables.",
  "",
  "## Final Outputs",
  paste0("- Analysis-ready CSV: `", analysis_csv, "`."),
  paste0("- Analysis-ready RDS: `", analysis_rds, "`."),
  paste0("- Analysis-ready Stata file: `", analysis_dta, "`."),
  paste0("- Codebook: `", codebook_csv, "`."),
  paste0("- QA report: `", qa_report_md, "`."),
  "",
  "## Limitations",
  "- The data are synthetic and intended only for teaching.",
  "- Some observations are excluded because the raw files intentionally contain duplicate keys, special missing codes, or unmatched region keys.",
  "- The workflow should be rerun from the project root whenever outputs need to change."
)

readr::write_csv(analysis_ready, analysis_csv)
saveRDS(analysis_ready, analysis_rds)
haven::write_dta(analysis_ready, analysis_dta)
readr::write_csv(codebook, codebook_csv)
writeLines(qa_lines, qa_report_md)
writeLines(memo_lines, workflow_memo_md)

cat("\nCapstone R workflow complete.\n")
cat("Analysis-ready CSV saved to:", analysis_csv, "\n")
cat("Codebook saved to:", codebook_csv, "\n")
cat("QA report saved to:", qa_report_md, "\n")
cat("Workflow memo saved to:", workflow_memo_md, "\n")

# Close the log at the end of the scripted workflow.
sink()
