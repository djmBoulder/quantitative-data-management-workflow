# Check R Dependencies
#
# Instructor/student setup helper for the IBS CU Boulder
# "Quantitative Data Management and Workflow for Social Scientists" microcredential.
#
# This script reports whether the R packages used by the course scripts are
# installed. It does not install anything automatically.
#
# Run from the repository root:
#   Rscript code/r/check-r-dependencies.R

required_packages <- c(
  "dplyr",
  "tidyr",
  "stringr",
  "readr",
  "readxl",
  "janitor",
  "skimr",
  "haven",
  "openxlsx"
)

package_purpose <- c(
  dplyr = "data cleaning, joins, summaries, validation",
  tidyr = "reshaping wide and long data",
  stringr = "string cleaning and capitalization",
  readr = "reading and writing CSV files",
  readxl = "reading Excel files for Module 02",
  janitor = "beginner-friendly frequency tables",
  skimr = "compact data summaries and documentation checks",
  haven = "labelled data examples and Stata .dta export",
  openxlsx = "reproducible Excel teaching-file generation"
)

finish <- function(status = 0) {
  if (!interactive()) {
    quit(status = status)
  }
  invisible(status)
}

check_one_package <- function(package) {
  installed <- requireNamespace(package, quietly = TRUE)
  version <- if (installed) {
    as.character(utils::packageVersion(package))
  } else {
    NA_character_
  }

  data.frame(
    package = package,
    installed = installed,
    version = version,
    purpose = unname(package_purpose[[package]]),
    stringsAsFactors = FALSE
  )
}

results <- do.call(rbind, lapply(required_packages, check_one_package))
missing_packages <- results$package[!results$installed]

cat("\nR dependency check\n")
cat("==================\n\n")
cat("Required packages were identified from code/r scripts and module R labs.\n")
cat("This script reports package status only; it does not install packages.\n\n")

print(results, row.names = FALSE)

if (length(missing_packages) == 0) {
  cat("\nAll required R packages are installed.\n")
} else {
  cat("\nMissing packages:\n")
  cat("  ", paste(missing_packages, collapse = ", "), "\n\n", sep = "")
  cat("To install missing packages, run this command in R:\n\n")
  cat("install.packages(c(")
  cat(paste(sprintf('"%s"', missing_packages), collapse = ", "))
  cat("))\n\n")
  cat("If you are using a campus-managed computer and installation fails, ask your instructor about the approved R environment.\n")
}

finish(if (length(missing_packages) == 0) 0 else 1)
