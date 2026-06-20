# 06 Reshaping and Restructuring Data R Lab
# Purpose: reshape synthetic repeated-measures data from wide to long and
# back to wide, with row-count and key validation.
# Run this script from the repository root or from an RStudio project at the repository root.

# Load packages used in this lab.
if (!requireNamespace("dplyr", quietly = TRUE)) {
  stop("The dplyr package is required for this lab.")
}
if (!requireNamespace("tidyr", quietly = TRUE)) {
  stop("The tidyr package is required for this lab.")
}

library(dplyr)
library(tidyr)

# Store project-relative paths in objects.
wide_csv <- file.path("data", "synthetic", "synthetic_gss_like_repeated_measures_wide.csv")
long_rds <- file.path("data", "working", "synthetic_gss_like_repeated_measures_long.rds")
long_csv <- file.path("data", "working", "synthetic_gss_like_repeated_measures_long.csv")
wide_again_rds <- file.path("data", "working", "synthetic_gss_like_repeated_measures_wide_again.rds")
wide_again_csv <- file.path("data", "working", "synthetic_gss_like_repeated_measures_wide_again.csv")
validation_report <- file.path("data", "output", "module-06-r-reshape-validation.txt")
log_file <- file.path("logs", "module-06-r-log.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Confirm the wide teaching file exists.
stopifnot(file.exists(wide_csv))

# Start a text log for review.
sink(log_file, split = TRUE)

cat("Module 06 R reshape log\n")
cat("Wide input file:", wide_csv, "\n\n")

# Read the wide repeated-measures file.
wide_data <- read.csv(wide_csv, stringsAsFactors = FALSE)

cat("Wide structure:\n")
str(wide_data)

cat("\nFirst five wide rows:\n")
print(head(wide_data, 5))

# Check the wide key before reshaping.
wide_rows <- nrow(wide_data)
duplicate_id_count <- sum(duplicated(wide_data$respondent_id))
cat("\nDuplicate respondent_id count in wide data:", duplicate_id_count, "\n")
stopifnot(duplicate_id_count == 0)

# A small one-measure preview uses names_to and values_to directly.
health_long_preview <- wide_data |>
  pivot_longer(
    cols = starts_with("health_"),
    names_to = "year_label",
    values_to = "health_value"
  )

cat("\nHealth-only long preview:\n")
print(head(health_long_preview[c("respondent_id", "year_label", "health_value")], 6))

# Reshape all repeated-measure stubs from wide to long.
long_data <- wide_data |>
  pivot_longer(
    cols = matches("^(health|activity_days|hours_worked)_\\d{4}$"),
    names_to = c(".value", "year"),
    names_pattern = "(health|activity_days|hours_worked)_(\\d{4})"
  ) |>
  mutate(year = as.integer(year)) |>
  arrange(respondent_id, year)

cat("\nLong structure:\n")
str(long_data)

cat("\nFirst nine long rows:\n")
print(head(long_data, 9))

# Validate the long person-year structure.
long_rows <- nrow(long_data)
expected_long_rows <- wide_rows * 3
stopifnot(long_rows == expected_long_rows)
stopifnot(nrow(distinct(long_data, respondent_id, year)) == long_rows)
stopifnot(all(long_data$year %in% c(2022, 2023, 2024)))

cat("\nRows by year after reshaping long:\n")
print(long_data |> count(year, name = "n"))

cat("\nRows per respondent after reshaping long:\n")
print(long_data |> count(respondent_id, name = "n") |> count(n, name = "respondents"))

# Reshape back to wide using explicit id_cols.
wide_again <- long_data |>
  pivot_wider(
    id_cols = c(respondent_id, gender, region),
    names_from = year,
    values_from = c(health, activity_days, hours_worked),
    names_glue = "{.value}_{year}"
  ) |>
  arrange(respondent_id)

wide_again_rows <- nrow(wide_again)
stopifnot(wide_again_rows == wide_rows)
stopifnot(!any(duplicated(wide_again$respondent_id)))

cat("\nWide-again structure:\n")
str(wide_again)

# Save working files. Raw data remain unchanged.
saveRDS(long_data, long_rds)
write.csv(long_data, long_csv, row.names = FALSE)
saveRDS(wide_again, wide_again_rds)
write.csv(wide_again, wide_again_csv, row.names = FALSE)

# Write a validation report.
validation_lines <- c(
  "Module 06 R reshape validation report",
  paste("Wide input rows:", wide_rows),
  paste("Long output rows:", long_rows),
  paste("Expected long rows:", expected_long_rows),
  paste("Wide-again rows:", wide_again_rows),
  "Wide key: respondent_id",
  "Long key: respondent_id + year",
  "Reshape stubs: health, activity_days, hours_worked",
  "Time variable: year with values 2022, 2023, and 2024",
  "Special missing codes are carried through reshaping and should be handled in a cleaning step."
)
writeLines(validation_lines, validation_report)

cat("\nReshape workflow complete.\n")
cat("Long R file saved to:", long_rds, "\n")
cat("Wide-again R file saved to:", wide_again_rds, "\n")

# Close the log at the end of the scripted workflow.
sink()
