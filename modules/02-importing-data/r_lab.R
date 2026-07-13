# 02 Importing and Inspecting Data R Lab
# Purpose: read CSV and Excel versions of synthetic_gss_like, inspect them,
# standardize variable names, and save clean working copies.
# Beginner note:
# - Run this script from the repository root with source("modules/02-importing-data/r_lab.R").
# - If running interactively, run this setup section first so paths and folders exist.
# - Generated files go only to data/working/, data/output/, or logs/.

# Store project-relative paths in objects.
csv_file <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
excel_file <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.xlsx")
working_rds <- file.path("data", "working", "synthetic_gss_like_person_2024_imported.rds")
working_csv <- file.path("data", "working", "synthetic_gss_like_person_2024_imported.csv")
log_file <- file.path("logs", "module-02-r-log.txt")
inspection_file <- file.path("data", "output", "module-02-r-import-inspection.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Confirm that both raw teaching files exist.
stopifnot(file.exists(csv_file))
stopifnot(file.exists(excel_file))

# The readxl package reads Excel files without requiring Excel to be installed.
if (!requireNamespace("readxl", quietly = TRUE)) {
  stop("The readxl package is required for the Excel portion of this lab.")
}

# Helper function to standardize names into lowercase snake case.
clean_names <- function(x) {
  x <- trimws(x)
  x <- tolower(x)
  x <- gsub("[^a-z0-9]+", "_", x)
  x <- gsub("^_+|_+$", "", x)
  x <- gsub("_+", "_", x)
  x[x == "survey_year"] <- "year"
  x
}

# Start a simple text log for the import workflow.
sink(log_file, split = TRUE)

cat("Module 02 R import log\n")
cat("CSV file:", csv_file, "\n")
cat("Excel file:", excel_file, "\n\n")

# ---------------------------------------------------------------------------
# Part 1: Read and inspect the CSV file.
# ---------------------------------------------------------------------------

# Read the CSV without letting R change raw column names automatically.
survey_csv_raw <- read.csv(csv_file, check.names = FALSE, stringsAsFactors = FALSE)

cat("CSV import: raw column names\n")
print(names(survey_csv_raw))

cat("\nCSV import: structure\n")
str(survey_csv_raw)

cat("\nCSV import: selected summaries\n")
print(summary(survey_csv_raw[c("age", "Gender", "region", "education")]))
print(table(survey_csv_raw[["Gender"]], useNA = "ifany"))
print(table(survey_csv_raw[["region"]], useNA = "ifany"))

cat("\nCSV import: missing values counted by column\n")
print(colSums(is.na(survey_csv_raw)))

cat("\nCSV import: first five rows\n")
print(head(survey_csv_raw, 5))

# Standardize variable names after inspecting the raw names.
survey_csv <- survey_csv_raw
names(survey_csv) <- clean_names(names(survey_csv))

cat("\nCSV import: standardized names\n")
print(names(survey_csv))

# ---------------------------------------------------------------------------
# Part 2: Read and inspect the Excel file.
# ---------------------------------------------------------------------------

# Read the first worksheet of the Excel file.
survey_excel_raw <- readxl::read_excel(excel_file)

cat("\nExcel import: raw column names\n")
print(names(survey_excel_raw))

cat("\nExcel import: structure\n")
str(survey_excel_raw)

cat("\nExcel import: selected summaries\n")
print(summary(survey_excel_raw[c("age", "Gender", "region", "education")]))
print(table(survey_excel_raw[["Gender"]], useNA = "ifany"))
print(table(survey_excel_raw[["region"]], useNA = "ifany"))

cat("\nExcel import: missing values counted by column\n")
print(colSums(is.na(survey_excel_raw)))

cat("\nExcel import: first five rows\n")
print(head(survey_excel_raw, 5))

# Standardize variable names with the same helper function.
survey_excel <- as.data.frame(survey_excel_raw, stringsAsFactors = FALSE)
names(survey_excel) <- clean_names(names(survey_excel))

cat("\nExcel import: standardized names\n")
print(names(survey_excel))

# Save the standardized CSV import as the main R working copy.
# The raw CSV and Excel files remain unchanged.
saveRDS(survey_csv, working_rds)
write.csv(survey_csv, working_csv, row.names = FALSE)

# Write a short import inspection summary for review.
inspection_lines <- c(
  "Module 02 R import inspection summary",
  paste("CSV rows imported:", nrow(survey_csv_raw)),
  paste("CSV variables imported after renaming:", ncol(survey_csv)),
  paste("Excel rows imported:", nrow(survey_excel_raw)),
  paste("Excel variables imported after renaming:", ncol(survey_excel)),
  paste("R working RDS saved to:", working_rds),
  paste("R working CSV saved to:", working_csv),
  "Known issues to inspect later: special missing codes, inconsistent capitalization, and string/numeric typing problems."
)
writeLines(inspection_lines, inspection_file)

cat("\nWorkflow complete. CSV and Excel files were read and inspected.\n")
cat("The CSV import was saved as the R working copy.\n")

# Close the log at the end of the scripted workflow.
sink()
