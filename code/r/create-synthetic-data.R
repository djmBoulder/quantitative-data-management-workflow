# Create synthetic_gss_like teaching files.
# Run this script from the repository root.

if (!requireNamespace("openxlsx", quietly = TRUE)) {
  stop("The openxlsx package is required to write the Module 02 Excel teaching file.")
}

set.seed(20260615)

out_dir <- file.path("data", "synthetic")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

sample_values <- function(values, n, prob = NULL) {
  sample(values, size = n, replace = TRUE, prob = prob)
}

make_income <- function(n) {
  base_income <- round(runif(n, min = 18000, max = 185000) / 1000) * 1000
  income <- as.character(base_income)

  # Some values include currency formatting so students must clean before converting.
  formatted <- sample(seq_len(n), size = round(n * 0.20))
  income[formatted] <- paste0("$", format(base_income[formatted], big.mark = ",", scientific = FALSE))

  problem_values <- sample(seq_len(n), size = round(n * 0.10))
  income[problem_values] <- sample(c("-8", "999999", "Not asked", ""), length(problem_values), replace = TRUE)
  income
}

make_person_file <- function(n, year, id_start, duplicate_id = FALSE, include_unmatched_region = FALSE) {
  respondent_id <- seq(from = id_start, length.out = n)

  if (duplicate_id && n >= 25) {
    # Duplicate ID supports teaching checks with duplicates/isid in Stata and R.
    respondent_id[24] <- respondent_id[23]
  }

  age <- sample_values(c(18:89, -9, 999), n)

  gender <- sample_values(
    c("Female", "female", "FEMALE", "Male", "male", "MALE",
      "Nonbinary", "Prefer not to answer", "-9", ""),
    n,
    prob = c(0.18, 0.05, 0.02, 0.18, 0.05, 0.02, 0.04, 0.02, 0.02, 0.01)
  )

  race_ethnicity <- sample_values(
    c("White", "white", "Black", "BLACK", "Latina/o/x", "Asian",
      "Native American", "Multiracial", "Other", "-8", "-9", ""),
    n,
    prob = c(0.38, 0.05, 0.11, 0.02, 0.18, 0.08, 0.03, 0.07, 0.03, 0.02, 0.02, 0.01)
  )

  education <- sample_values(
    c("Less than HS", "High school", "Some college", "BA", "ba",
      "Graduate", "GRADUATE", "99", "-8"),
    n,
    prob = c(0.08, 0.24, 0.26, 0.18, 0.03, 0.15, 0.02, 0.02, 0.02)
  )

  marital_status <- sample_values(
    c("Never married", "Married", "married", "Separated", "Divorced",
      "Widowed", "Living with partner", "-9", ""),
    n,
    prob = c(0.27, 0.34, 0.04, 0.03, 0.11, 0.06, 0.10, 0.03, 0.02)
  )

  regions <- c("Northeast", "Midwest", "South", "West", "west", " SOUTH ", "-9")
  region_prob <- c(0.18, 0.22, 0.27, 0.20, 0.04, 0.04, 0.05)

  if (include_unmatched_region) {
    regions <- c(regions, "Mountain West")
    region_prob <- c(region_prob * 0.94, 0.06)
  }

  region <- sample_values(regions, n, prob = region_prob)

  employment_status <- sample_values(
    c("Employed full time", "employed full time", "Employed part time",
      "Unemployed", "Student", "Retired", "Not in labor force", "-8", "-9"),
    n,
    prob = c(0.38, 0.04, 0.14, 0.06, 0.10, 0.13, 0.10, 0.02, 0.03)
  )

  hours_worked <- sample_values(c(as.character(0:60), "-8", "-9", "N/A", "forty"), n)

  household_income <- make_income(n)

  self_rated_health <- sample_values(
    c("Excellent", "excellent", "Very good", "Good", "Fair", "Poor", "DK", "-9"),
    n,
    prob = c(0.15, 0.03, 0.31, 0.28, 0.14, 0.05, 0.02, 0.02)
  )

  smoking_status <- sample_values(
    c("Never", "Former", "Current", "current", "Occasional", "-9", ""),
    n,
    prob = c(0.49, 0.25, 0.13, 0.03, 0.05, 0.03, 0.02)
  )

  physical_activity_days <- sample_values(c(as.character(0:7), "-9", "Not asked", "eight"), n)

  survey_weight <- sprintf("%.2f", runif(n, min = 0.35, max = 2.75))
  weight_problem_rows <- sample(seq_len(n), size = round(n * 0.06))
  survey_weight[weight_problem_rows] <- sample(c("-9", "", "1,25"), length(weight_problem_rows), replace = TRUE)

  interview_mode <- sample_values(
    c("Web", "web", "Phone", "PHONE", "In person", "Mail", "-8"),
    n,
    prob = c(0.32, 0.06, 0.24, 0.04, 0.18, 0.13, 0.03)
  )

  data.frame(
    "Respondent ID" = respondent_id,
    "Survey Year" = year,
    "age" = age,
    "Gender" = gender,
    "Race / ethnicity" = race_ethnicity,
    "education" = education,
    "Marital Status" = marital_status,
    "region" = region,
    "employment status" = employment_status,
    "hours_worked" = hours_worked,
    "Household Income" = household_income,
    "Self Rated Health" = self_rated_health,
    "smoking_status" = smoking_status,
    "Physical Activity Days" = physical_activity_days,
    "survey weight" = survey_weight,
    "Interview Mode" = interview_mode,
    check.names = FALSE
  )
}

person_2024 <- make_person_file(
  n = 240,
  year = 2024,
  id_start = 10001,
  duplicate_id = TRUE,
  include_unmatched_region = TRUE
)

person_2025 <- make_person_file(
  n = 180,
  year = 2025,
  id_start = 20001,
  duplicate_id = FALSE,
  include_unmatched_region = TRUE
)

region_context <- data.frame(
  "Region Name" = c("Northeast", "Midwest", "South", "West", "Territories"),
  "Region Median Income" = c("$78,000", "$69,000", "$64,000", "$82,000", "$58,000"),
  "Region Unemployment Rate" = c("4.1%", "4.4%", "4.8%", "4.2%", "6.5%"),
  "Urbanicity Index" = c(82, 61, 58, 76, 45),
  "Census Division" = c("Northeast", "Midwest", "South", "West", "Context only"),
  check.names = FALSE
)

repeated_ids <- unique(person_2024[["Respondent ID"]])[1:120]
repeated_base <- person_2024[match(repeated_ids, person_2024[["Respondent ID"]]), ]

# Wide repeated-measures file for reshaping practice.
# Each row is one respondent, and repeated yearly measures are stored in columns.
repeated_wide <- data.frame(
  respondent_id = repeated_base[["Respondent ID"]],
  gender = repeated_base[["Gender"]],
  region = repeated_base[["region"]],
  health_2022 = sample(c(1:5, -9), length(repeated_ids), replace = TRUE, prob = c(rep(0.18, 5), 0.10)),
  health_2023 = sample(c(1:5, -9), length(repeated_ids), replace = TRUE, prob = c(rep(0.18, 5), 0.10)),
  health_2024 = sample(c(1:5, -9), length(repeated_ids), replace = TRUE, prob = c(rep(0.18, 5), 0.10)),
  activity_days_2022 = sample(c(0:7, -9), length(repeated_ids), replace = TRUE),
  activity_days_2023 = sample(c(0:7, -9), length(repeated_ids), replace = TRUE),
  activity_days_2024 = sample(c(0:7, -9), length(repeated_ids), replace = TRUE),
  hours_worked_2022 = sample(c(0:60, -8, -9), length(repeated_ids), replace = TRUE),
  hours_worked_2023 = sample(c(0:60, -8, -9), length(repeated_ids), replace = TRUE),
  hours_worked_2024 = sample(c(0:60, -8, -9), length(repeated_ids), replace = TRUE),
  check.names = FALSE
)

write.csv(
  person_2024,
  file = file.path(out_dir, "synthetic_gss_like_person_2024.csv"),
  row.names = FALSE,
  na = ""
)

openxlsx::write.xlsx(
  person_2024,
  file = file.path(out_dir, "synthetic_gss_like_person_2024.xlsx"),
  sheetName = "person_2024",
  overwrite = TRUE
)

write.csv(
  person_2025,
  file = file.path(out_dir, "synthetic_gss_like_person_2025.csv"),
  row.names = FALSE,
  na = ""
)

write.csv(
  region_context,
  file = file.path(out_dir, "synthetic_gss_like_region_context.csv"),
  row.names = FALSE,
  na = ""
)

write.csv(
  repeated_wide,
  file = file.path(out_dir, "synthetic_gss_like_repeated_measures_wide.csv"),
  row.names = FALSE,
  na = ""
)

message("Created synthetic_gss_like CSV and Excel teaching files in ", out_dir)
