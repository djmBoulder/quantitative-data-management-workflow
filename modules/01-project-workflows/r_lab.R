# 01 Project Workflows and Reproducibility R Lab
# Purpose: create a simple reproducible workflow from raw CSV to working R data.
# Run this script from the repository root or from an RStudio project opened at the repository root.

# Store project-relative paths in objects so they are easy to reuse.
raw_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
working_rds <- file.path("data", "working", "synthetic_gss_like_person_2024_working.rds")
log_file <- file.path("logs", "module-01-r-log.txt")
inspection_file <- file.path("data", "output", "module-01-r-inspection.txt")

# Create output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Confirm that the raw CSV exists before trying to import it.
stopifnot(file.exists(raw_csv))

# Start a text log so the workflow output can be reviewed later.
sink(log_file, split = TRUE)

cat("Module 01 R workflow log\n")
cat("Raw data file:", raw_csv, "\n")
cat("Working data file:", working_rds, "\n\n")

# Import the raw CSV without editing it manually.
survey_raw <- read.csv(raw_csv, check.names = FALSE, stringsAsFactors = FALSE)

# Inspect the imported data structure.
cat("Column names:\n")
print(names(survey_raw))

cat("\nData structure:\n")
str(survey_raw)

cat("\nBasic summaries:\n")
print(summary(survey_raw))

# Store a simple descriptive result for the output file.
mean_age_raw <- mean(survey_raw[["age"]], na.rm = TRUE)

cat("\nSelected categorical variables:\n")
print(table(survey_raw[["Gender"]], useNA = "ifany"))
print(table(survey_raw[["region"]], useNA = "ifany"))
print(table(survey_raw[["education"]], useNA = "ifany"))

cat("\nFirst five rows:\n")
print(head(survey_raw, 5))

# Save a small inspection text file for the module output folder.
inspection_lines <- c(
  "Module 01 R inspection summary",
  paste("Raw file:", raw_csv),
  paste("Rows imported:", nrow(survey_raw)),
  paste("Variables imported:", ncol(survey_raw)),
  paste("Raw mean age before cleaning:", round(mean_age_raw, 2)),
  "Note: this output is for workflow practice and has not been cleaned yet.",
  paste("Working file saved to:", working_rds)
)
writeLines(inspection_lines, inspection_file)

# Save a working copy in R format. This does not change the raw CSV.
saveRDS(survey_raw, working_rds)

cat("\nWorkflow complete. Raw data were imported, inspected, and saved as a working copy.\n")

# Close the text log at the end of the scripted workflow.
sink()
