# 00 Orientation R Lab
# Purpose: confirm that R can see the course repository, read the synthetic
# teaching data, and write a small setup report.
# Beginner note:
# - Run this script from the repository root with source("modules/00-orientation/r_lab.R").
# - If running interactively, run this setup section first so paths and folders exist.
# - Generated files go only to data/working/, data/output/, or logs/.

# Store project-relative paths in objects.
synthetic_csv <- file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv")
log_file <- file.path("logs", "module-00-r-log.txt")
setup_report <- file.path("data", "output", "module-00-r-setup-check.txt")

# Create generated-output folders if they do not already exist.
dir.create("logs", showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "working"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("data", "output"), showWarnings = FALSE, recursive = TRUE)

# Start a plain-text log. Logs are generated files and are ignored by Git.
sink(log_file, split = TRUE)

cat("Module 00 R setup check\n")
cat("Current working directory:\n")
cat(getwd(), "\n\n")

# Confirm that the expected synthetic teaching file is available.
stopifnot(file.exists(synthetic_csv))
cat("Found synthetic data file:", synthetic_csv, "\n")

# Import the synthetic data only for a quick setup check.
# Do not edit the raw CSV file manually.
survey_setup <- read.csv(synthetic_csv, check.names = FALSE, stringsAsFactors = FALSE)

row_count <- nrow(survey_setup)
variable_count <- ncol(survey_setup)

cat("Rows imported:", row_count, "\n")
cat("Variables imported:", variable_count, "\n\n")

cat("Variable names:\n")
print(names(survey_setup))

cat("\nFirst three rows:\n")
print(head(survey_setup, 3))

# Write a short setup report to data/output.
setup_lines <- c(
  "Module 00 R setup check",
  paste("Synthetic file found:", synthetic_csv),
  paste("Rows imported:", row_count),
  paste("Variables imported:", variable_count),
  "This report confirms that R can read course data and write to data/output.",
  "Do not manually edit raw or synthetic data files."
)
writeLines(setup_lines, setup_report)

cat("\nSetup report saved to:", setup_report, "\n")
cat("Module 00 R setup check complete.\n")

# Close the log at the end of the setup check.
sink()
