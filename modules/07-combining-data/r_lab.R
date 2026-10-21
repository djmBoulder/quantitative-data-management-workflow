# 07 Combining Datasets with Append and Merge R Lab
# Purpose: append person files, diagnose keys and duplicates, attach region
# context, and document merge diagnostics.
# Beginner note:
# - Run this script from the repository root with source("modules/07-combining-data/r_lab.R").
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

# janitor standardizes variable names; no custom naming function is needed.
if (!requireNamespace("janitor", quietly = TRUE)) {
  stop("The janitor package is required for this lab.")
}

# Store project-relative paths in objects.
person_2024 <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
person_2025 <- file.path("data", "synthetic", "synthetic_gss_like_person_2025.csv")
region_csv <- file.path("data", "synthetic", "synthetic_gss_like_region_context.csv")
appended_rds <- file.path("data", "working", "synthetic_gss_like_person_appended.rds")
appended_csv <- file.path("data", "working", "synthetic_gss_like_person_appended.csv")
region_merged_rds <- file.path("data", "working", "synthetic_gss_like_person_region_merged.rds")
region_merged_csv <- file.path("data", "working", "synthetic_gss_like_person_region_merged.csv")
diagnostics_report <- file.path("data", "output", "module-07-r-combine-diagnostics.txt")
log_file <- file.path("logs", "module-07-r-log.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Confirm source files exist.
stopifnot(file.exists(person_2024))
stopifnot(file.exists(person_2025))
stopifnot(file.exists(region_csv))

# Start a text log for review.
sink(log_file, split = TRUE)

cat("Module 07 R combining data log\n\n")

# ---------------------------------------------------------------------------
# Append rows from compatible person files.
# ---------------------------------------------------------------------------

# Read the file, standardize its names, and record its source.
person24 <- read.csv(person_2024, check.names = FALSE, stringsAsFactors = FALSE)
person24 <- janitor::clean_names(person24)
person24 <- person24 |> rename(year = survey_year)
person24$source_file <- "person_2024"
# Read the file, standardize its names, and record its source.
person25 <- read.csv(person_2025, check.names = FALSE, stringsAsFactors = FALSE)
person25 <- janitor::clean_names(person25)
person25 <- person25 |> rename(year = survey_year)
person25$source_file <- "person_2025"

n_2024 <- nrow(person24)
n_2025 <- nrow(person25)

# bind_rows() appends observations, matching variables by name.
person_appended <- bind_rows(person24, person25)
person_appended$region_clean <- str_to_lower(person_appended$region)
person_appended$region_clean <- na_if(person_appended$region_clean, "-9")
n_appended <- nrow(person_appended)

cat("Rows in 2024 person file:", n_2024, "\n")
cat("Rows in 2025 person file:", n_2025, "\n")
cat("Rows after bind_rows append:", n_appended, "\n")
stopifnot(n_appended == n_2024 + n_2025)

# Diagnose duplicate person-year keys before merging.
duplicate_keys <- person_appended |>
  count(respondent_id, year, name = "n") |>
  filter(n > 1)

cat("\nDuplicate respondent_id + year keys:\n")
print(duplicate_keys)

cat("\nAny duplicated respondent_id + year key?:\n")
print(any(duplicated(person_appended[c("respondent_id", "year")])))

person_appended <- person_appended |>
  group_by(respondent_id, year) |>
  mutate(
    duplicate_person_year = n() > 1
  ) |>
  ungroup()

# Save the appended file with duplicate diagnostics retained.
saveRDS(person_appended, appended_rds)
write.csv(person_appended, appended_csv, row.names = FALSE)

# Set aside all records with unresolved duplicate respondent-year identifiers.
# Keeping the first record would choose between conflicting responses arbitrarily.
person_unique <- person_appended |>
  arrange(respondent_id, year, source_file) |>
  filter(!duplicate_person_year)

stopifnot(!any(duplicated(person_unique[c("respondent_id", "year")])))

# ---------------------------------------------------------------------------
# Prepare region context and check its unique identifier.
# ---------------------------------------------------------------------------

region_context <- read.csv(region_csv, check.names = FALSE, stringsAsFactors = FALSE)
# Standardize names to lowercase words separated by underscores.
region_context <- janitor::clean_names(region_context)
region_context <- region_context |>
  rename(region_clean = region_name) |>
  mutate(region_clean = str_to_lower(region_clean))

cat("\nRegion context key counts:\n")
print(region_context |> count(region_clean, name = "n"))
stopifnot(!any(duplicated(region_context$region_clean)))

# ---------------------------------------------------------------------------
# Merge 1:1: attach a person-year weight file.
# ---------------------------------------------------------------------------

weights_file <- person_unique |> select(respondent_id, year, survey_weight)
person_without_weight <- person_unique |> select(-survey_weight)

# Both files must have one observation per respondent and year, with no missing IDs.
stopifnot(!anyNA(person_unique[c("respondent_id", "year")]))
stopifnot(!any(duplicated(weights_file[c("respondent_id", "year")])))
weights_file$weight_record_present <- TRUE
person_1to1 <- merge(
  person_without_weight, weights_file,
  by = c("respondent_id", "year"), all.x = TRUE
)
stopifnot(nrow(person_1to1) == nrow(person_unique))
stopifnot(all(person_1to1$weight_record_present %in% TRUE))

# ---------------------------------------------------------------------------
# Merge m:1: attach regional information to each person.
# ---------------------------------------------------------------------------

# One region record may describe many people. Missing region identifiers in the
# context file are not allowed, so missing person regions cannot match them.
stopifnot(!anyNA(region_context$region_clean))
stopifnot(all(region_context$region_clean != ""))
stopifnot(!any(duplicated(region_context$region_clean)))

# Mark which file each observation came from, like Stata's _merge indicator.
person_unique$person_record_present <- TRUE
region_context$context_record_present <- TRUE
person_region_all <- merge(
  person_unique, region_context, by = "region_clean", all = TRUE
)
person_region_all$merge_status <- 3
person_region_all$merge_status[is.na(person_region_all$context_record_present)] <- 1
person_region_all$merge_status[is.na(person_region_all$person_record_present)] <- 2

cat("\nMerge status: 1 = person only; 2 = context only; 3 = matched\n")
print(table(person_region_all$merge_status))

# Inspect unmatched observations before deciding which to keep.
unmatched_person_regions <- person_region_all |>
  filter(merge_status == 1) |> distinct(region_clean)
context_only_regions <- person_region_all |>
  filter(merge_status == 2) |> distinct(region_clean)
print(unmatched_person_regions)
print(context_only_regions)

# Keep all person observations, including those without a region match.
person_region <- person_region_all |> filter(merge_status != 2)
stopifnot(nrow(person_region) == nrow(person_unique))

# Optional comparison: retaining matched cases only changes the sample.
person_region_matched <- person_region_all |> filter(merge_status == 3)
cat("\nRows retaining all people:", nrow(person_region), "\n")
cat("Rows retaining matched people only:", nrow(person_region_matched), "\n")
cat("Rows retaining observations from both files:", nrow(person_region_all), "\n")

# Optional 1:m example: start with regions and retain every region.
# The same region identifier is unique in the first file, repeated in the second.
region_person_onetomany <- merge(
  region_context,
  person_unique |> select(respondent_id, year, gender, region_clean),
  by = "region_clean", all.x = TRUE
)
cat("Rows in the region-first 1:m example:", nrow(region_person_onetomany), "\n")

# Save the person-level file with region context attached.
saveRDS(person_region, region_merged_rds)
write.csv(person_region, region_merged_csv, row.names = FALSE)

# Write diagnostics report.
diagnostic_lines <- c(
  "Module 07 R combine diagnostics",
  paste("2024 rows:", n_2024),
  paste("2025 rows:", n_2025),
  paste("Rows after append:", n_appended),
  "Append check: appended rows equal 2024 + 2025 rows.",
  paste("Duplicate person-year keys diagnosed:", nrow(duplicate_keys)),
  "1:1 merge key: respondent_id + year for person-year weight file.",
  "many-to-one merge key: region_clean from person rows to region context.",
  paste("Unmatched person region keys:", paste(unmatched_person_regions$region_clean, collapse = "; ")),
  paste("Context-only region keys:", paste(context_only_regions$region_clean, collapse = "; ")),
  paste("Rows retaining all people:", nrow(person_region)),
  paste("Rows retaining matched people only:", nrow(person_region_matched)),
  paste("Rows retaining observations from both files:", nrow(person_region_all)),
  paste("Rows after region-side one-to-many merge:", nrow(region_person_onetomany)),
  "Many-to-many merges were not used; duplicate keys should be investigated instead."
)
writeLines(diagnostic_lines, diagnostics_report)

cat("\nCombining workflow complete.\n")
cat("Appended R file saved to:", appended_rds, "\n")
cat("Region-merged R file saved to:", region_merged_rds, "\n")

# Close the log at the end of the scripted workflow.
sink()
