# 07 Combining Datasets with Append, Joins, and Merges R Lab
# Purpose: append person files, diagnose keys and duplicates, attach region
# context, and document join diagnostics.
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

read_person <- function(path, source_label) {
  out <- read.csv(path, check.names = FALSE, stringsAsFactors = FALSE)
  names(out) <- clean_names(names(out))
  out |>
    mutate(
      source_file = source_label,
      region_clean = str_to_lower(str_trim(region)),
      region_clean = if_else(region_clean == "-9", NA_character_, region_clean)
    )
}

# Start a text log for review.
sink(log_file, split = TRUE)

cat("Module 07 R combining data log\n\n")

# ---------------------------------------------------------------------------
# Append rows from compatible person files.
# ---------------------------------------------------------------------------

person24 <- read_person(person_2024, "person_2024")
person25 <- read_person(person_2025, "person_2025")

n_2024 <- nrow(person24)
n_2025 <- nrow(person25)

person_appended <- bind_rows(person24, person25)
n_appended <- nrow(person_appended)

cat("Rows in 2024 person file:", n_2024, "\n")
cat("Rows in 2025 person file:", n_2025, "\n")
cat("Rows after bind_rows append:", n_appended, "\n")
stopifnot(n_appended == n_2024 + n_2025)

# Diagnose duplicate person-year keys before joining.
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
    duplicate_person_year = n() > 1,
    duplicate_order = row_number()
  ) |>
  ungroup()

# Save the appended file with duplicate diagnostics retained.
saveRDS(person_appended, appended_rds)
write.csv(person_appended, appended_csv, row.names = FALSE)

# Create a de-duplicated teaching file for join demonstrations.
person_unique <- person_appended |>
  arrange(respondent_id, year, source_file) |>
  filter(duplicate_order == 1)

stopifnot(!any(duplicated(person_unique[c("respondent_id", "year")])))

# ---------------------------------------------------------------------------
# Prepare region context and check its primary key.
# ---------------------------------------------------------------------------

region_context <- read.csv(region_csv, check.names = FALSE, stringsAsFactors = FALSE)
names(region_context) <- clean_names(names(region_context))
region_context <- region_context |>
  rename(region_clean = region_name) |>
  mutate(region_clean = str_to_lower(str_trim(region_clean)))

cat("\nRegion context key counts:\n")
print(region_context |> count(region_clean, name = "n"))
stopifnot(!any(duplicated(region_context$region_clean)))

# ---------------------------------------------------------------------------
# Demonstrate a one-to-one join using a person-year weight lookup.
# ---------------------------------------------------------------------------

weights_lookup <- person_unique |>
  distinct(respondent_id, year, survey_weight)

person_without_weight <- person_unique |>
  select(-survey_weight)

person_1to1 <- left_join(
  person_without_weight,
  weights_lookup,
  by = c("respondent_id", "year"),
  relationship = "one-to-one"
)

stopifnot(nrow(person_1to1) == nrow(person_unique))
stopifnot(!any(is.na(person_1to1$survey_weight)))

# ---------------------------------------------------------------------------
# Demonstrate a many-to-one join: many person rows to one region row.
# ---------------------------------------------------------------------------

person_region_left <- left_join(
  person_unique,
  region_context,
  by = "region_clean",
  relationship = "many-to-one"
)

stopifnot(nrow(person_region_left) == nrow(person_unique))

unmatched_person_regions <- anti_join(
  person_unique |> distinct(region_clean),
  region_context |> distinct(region_clean),
  by = "region_clean"
)

context_only_regions <- anti_join(
  region_context |> distinct(region_clean),
  person_unique |> distinct(region_clean),
  by = "region_clean"
)

matched_person_rows <- semi_join(person_unique, region_context, by = "region_clean")

cat("\nPerson region keys without context match:\n")
print(unmatched_person_regions)

cat("\nContext region keys without person rows:\n")
print(context_only_regions)

cat("\nMatched person rows after region key check:", nrow(matched_person_rows), "\n")

# Demonstrate inner and full joins for diagnostics, not as default outputs.
person_region_inner <- inner_join(
  person_unique,
  region_context,
  by = "region_clean",
  relationship = "many-to-one"
)

person_region_full <- full_join(
  person_unique,
  region_context,
  by = "region_clean",
  relationship = "many-to-one"
)

cat("\nRows after left_join:", nrow(person_region_left), "\n")
cat("Rows after inner_join:", nrow(person_region_inner), "\n")
cat("Rows after full_join:", nrow(person_region_full), "\n")

# Demonstrate the one-to-many relationship from the region side.
region_person_onetomany <- left_join(
  region_context,
  person_unique |> select(respondent_id, year, gender, region_clean),
  by = "region_clean",
  relationship = "one-to-many"
)

cat("\nRows after region-side one-to-many join:", nrow(region_person_onetomany), "\n")

# Save the person-level file with region context attached.
saveRDS(person_region_left, region_merged_rds)
write.csv(person_region_left, region_merged_csv, row.names = FALSE)

# Write diagnostics report.
diagnostic_lines <- c(
  "Module 07 R combine diagnostics",
  paste("2024 rows:", n_2024),
  paste("2025 rows:", n_2025),
  paste("Rows after append:", n_appended),
  "Append check: appended rows equal 2024 + 2025 rows.",
  paste("Duplicate person-year keys diagnosed:", nrow(duplicate_keys)),
  "1:1 join key: respondent_id + year for person-year weight lookup.",
  "many-to-one join key: region_clean from person rows to region context.",
  paste("Unmatched person region keys:", paste(unmatched_person_regions$region_clean, collapse = "; ")),
  paste("Context-only region keys:", paste(context_only_regions$region_clean, collapse = "; ")),
  paste("Rows after left_join:", nrow(person_region_left)),
  paste("Rows after inner_join:", nrow(person_region_inner)),
  paste("Rows after full_join:", nrow(person_region_full)),
  paste("Rows after region-side one-to-many join:", nrow(region_person_onetomany)),
  "Many-to-many joins were not used; duplicate keys should be investigated instead."
)
writeLines(diagnostic_lines, diagnostics_report)

cat("\nCombining workflow complete.\n")
cat("Appended R file saved to:", appended_rds, "\n")
cat("Region-merged R file saved to:", region_merged_rds, "\n")

# Close the log at the end of the scripted workflow.
sink()
