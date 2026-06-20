# 03 Data Documentation, Metadata, and Codebooks R Lab
# Purpose: document synthetic_gss_like with clear names, labels, factors,
# derived-variable notes, and a small data dictionary.
# Run this script from the repository root or from an RStudio project at the repository root.

# Load packages used in this lab.
if (!requireNamespace("dplyr", quietly = TRUE)) {
  stop("The dplyr package is required for this lab.")
}
if (!requireNamespace("haven", quietly = TRUE)) {
  stop("The haven package is required for this lab.")
}
if (!requireNamespace("skimr", quietly = TRUE)) {
  stop("The skimr package is required for this lab.")
}

library(dplyr)

# Store project-relative paths in objects.
raw_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
working_rds <- file.path("data", "working", "synthetic_gss_like_person_2024_documented.rds")
working_csv <- file.path("data", "working", "synthetic_gss_like_person_2024_documented.csv")
dictionary_csv <- file.path("data", "output", "module-03-r-data-dictionary.csv")
dictionary_md <- file.path("data", "output", "module-03-r-data-dictionary.md")
log_file <- file.path("logs", "module-03-r-log.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Confirm the raw teaching file exists.
stopifnot(file.exists(raw_csv))

# Helper function to standardize names into lowercase snake case.
clean_names <- function(x) {
  x <- trimws(x)
  x <- tolower(x)
  x <- gsub("[^a-z0-9]+", "_", x)
  x <- gsub("^_+|_+$", "", x)
  x <- gsub("_+", "_", x)
  x
}

# Helper function for short variable labels stored as R attributes.
set_var_label <- function(x, label) {
  attr(x, "label") <- label
  x
}

# Start a simple text log for the documentation workflow.
sink(log_file, split = TRUE)

cat("Module 03 R documentation log\n")
cat("Raw data file:", raw_csv, "\n\n")

# Import the raw CSV without editing it manually.
survey_raw <- read.csv(raw_csv, check.names = FALSE, stringsAsFactors = FALSE)

cat("Raw names before documentation:\n")
print(names(survey_raw))

cat("\nRaw structure before documentation:\n")
dplyr::glimpse(survey_raw)

cat("\nRaw summary before documentation:\n")
print(summary(survey_raw))

# Standardize variable names to the course convention.
survey_doc <- survey_raw
names(survey_doc) <- clean_names(names(survey_doc))
survey_doc <- survey_doc |>
  rename(year = survey_year)

# Create documented derived variables with explicit coding decisions.
survey_doc <- survey_doc |>
  mutate(
    gender_doc = case_when(
      tolower(trimws(gender)) == "female" ~ 1,
      tolower(trimws(gender)) == "male" ~ 2,
      tolower(trimws(gender)) == "nonbinary" ~ 3,
      tolower(trimws(gender)) %in% c("prefer not to answer", "-9", "") ~ 9,
      TRUE ~ NA_real_
    ),
    health_doc = case_when(
      tolower(trimws(self_rated_health)) == "excellent" ~ 5,
      tolower(trimws(self_rated_health)) == "very good" ~ 4,
      tolower(trimws(self_rated_health)) == "good" ~ 3,
      tolower(trimws(self_rated_health)) == "fair" ~ 2,
      tolower(trimws(self_rated_health)) == "poor" ~ 1,
      tolower(trimws(self_rated_health)) %in% c("dk", "-9", "") ~ 9,
      TRUE ~ NA_real_
    ),
    analytic_sample_demo = age >= 18 & age <= 89 & gender_doc %in% c(1, 2, 3),
    gender_doc = factor(
      gender_doc,
      levels = c(1, 2, 3, 9),
      labels = c("Female", "Male", "Nonbinary", "Missing or not reported")
    ),
    health_doc = factor(
      health_doc,
      levels = c(1, 2, 3, 4, 5, 9),
      labels = c("Poor", "Fair", "Good", "Very good", "Excellent", "Missing or not reported"),
      ordered = TRUE
    ),
    analytic_sample_demo = factor(
      analytic_sample_demo,
      levels = c(FALSE, TRUE),
      labels = c("Excluded from demonstration sample", "Included in demonstration sample")
    )
  )

# Add short variable labels as attributes. These labels help, but the external
# data dictionary remains the main human-readable documentation.
survey_doc$respondent_id <- set_var_label(survey_doc$respondent_id, "Synthetic respondent identifier")
survey_doc$year <- set_var_label(survey_doc$year, "Survey year")
survey_doc$age <- set_var_label(survey_doc$age, "Respondent age in years")
survey_doc$gender <- set_var_label(survey_doc$gender, "Raw self-reported gender text")
survey_doc$gender_doc <- set_var_label(survey_doc$gender_doc, "Documented gender category derived from raw gender text")
survey_doc$self_rated_health <- set_var_label(survey_doc$self_rated_health, "Raw self-rated general health")
survey_doc$health_doc <- set_var_label(survey_doc$health_doc, "Documented ordered self-rated health category")
survey_doc$analytic_sample_demo <- set_var_label(survey_doc$analytic_sample_demo, "Demonstration analytic sample indicator")

# Demonstrate a haven-style labelled vector for documentation discussion.
# This object is not used for analysis here; factors are easier for beginners.
gender_labelled_example <- haven::labelled(
  c(1, 2, 3, 9),
  labels = c(Female = 1, Male = 2, Nonbinary = 3, `Missing or not reported` = 9)
)

cat("\nStandardized names after documentation:\n")
print(names(survey_doc))

cat("\nDocumented structure:\n")
dplyr::glimpse(survey_doc)

cat("\nDocumented summary:\n")
print(summary(survey_doc[c("age", "gender_doc", "health_doc", "analytic_sample_demo")]))

cat("\nSkim summary for documented data:\n")
print(skimr::skim(survey_doc))

cat("\nHaven labelled example for gender coding:\n")
print(gender_labelled_example)

# Create a simple data dictionary as a data frame.
data_dictionary <- data.frame(
  variable_name = c(
    "respondent_id",
    "year",
    "age",
    "gender",
    "gender_doc",
    "self_rated_health",
    "health_doc",
    "analytic_sample_demo"
  ),
  description = c(
    "Synthetic respondent identifier",
    "Survey year",
    "Respondent age in years",
    "Raw self-reported gender text",
    "Documented gender category",
    "Raw self-rated general health",
    "Documented ordered self-rated health category",
    "Demonstration analytic sample indicator"
  ),
  source_or_derivation = c(
    "Raw imported variable",
    "Renamed from Survey Year",
    "Raw imported variable",
    "Raw imported variable",
    "Derived from gender",
    "Raw imported variable",
    "Derived from self_rated_health",
    "Derived from age and gender_doc"
  ),
  coding_or_notes = c(
    "Person-level identifier; duplicate checks happen in later modules",
    "All records in this file are 2024",
    "Special codes -9 and 999 require later missing-data decisions",
    "Includes inconsistent capitalization and not-reported values",
    "Female; Male; Nonbinary; Missing or not reported",
    "Includes DK and special missing codes",
    "Ordered from Poor to Excellent, plus Missing or not reported",
    "Includes ages 18-89 with documented gender values"
  )
)

# Save the data dictionary as CSV and Markdown so it can be read outside R.
write.csv(data_dictionary, dictionary_csv, row.names = FALSE)

markdown_lines <- c(
  "# Module 03 R Data Dictionary",
  "",
  "| variable_name | description | source_or_derivation | coding_or_notes |",
  "| --- | --- | --- | --- |",
  apply(data_dictionary, 1, function(row) {
    paste0("| ", paste(row, collapse = " | "), " |")
  })
)
writeLines(markdown_lines, dictionary_md)

# Save documented working copies. The raw CSV remains unchanged.
saveRDS(survey_doc, working_rds)
write.csv(survey_doc, working_csv, row.names = FALSE)

cat("\nDocumentation workflow complete.\n")
cat("Documented R file saved to:", working_rds, "\n")
cat("Data dictionary saved to:", dictionary_csv, "and", dictionary_md, "\n")

# Close the log at the end of the scripted workflow.
sink()
