# Check Course Module Files
#
# Instructor-facing QA script for the IBS CU Boulder
# "Quantitative Data Management and Workflow for Social Scientists" microcredential.
#
# Run from anywhere with:
#   Rscript code/r/check-course-files.R
#
# The script checks that each module folder contains the standard files
# required by AGENTS.md and the course repository conventions.

find_repo_root <- function(start = getwd()) {
  current <- normalizePath(start, winslash = "/", mustWork = TRUE)

  repeat {
    has_markers <- file.exists(file.path(current, "AGENTS.md")) &&
      dir.exists(file.path(current, "modules"))

    if (has_markers) {
      return(current)
    }

    parent <- dirname(current)
    if (identical(parent, current)) {
      stop(
        "Could not find the repository root. ",
        "Run this script from inside the course repository.",
        call. = FALSE
      )
    }

    current <- parent
  }
}

repo_root <- find_repo_root()
setwd(repo_root)

module_dirs <- c(
  "00-orientation",
  "01-project-workflows",
  "02-importing-data",
  "03-data-documentation",
  "04-cleaning-and-recoding",
  "05-missing-data",
  "06-reshaping-data",
  "07-combining-data",
  "08-quality-assurance",
  "09-reproducible-outputs",
  "10-capstone"
)

required_files <- c(
  "README.md",
  "lesson.md",
  "stata_lab.do",
  "r_lab.R",
  "assignment.md",
  "solution_notes.md",
  "checklist.md"
)

results <- do.call(
  rbind,
  lapply(module_dirs, function(module_dir) {
    module_path <- file.path("modules", module_dir)

    do.call(
      rbind,
      lapply(required_files, function(required_file) {
        file_path <- file.path(module_path, required_file)
        data.frame(
          module = module_dir,
          required_file = required_file,
          path = file_path,
          exists = file.exists(file_path),
          stringsAsFactors = FALSE
        )
      })
    )
  })
)

missing_results <- results[!results$exists, ]

cat("\nCourse file structure check\n")
cat("===========================\n\n")
cat("Repository root:", repo_root, "\n")
cat("Modules checked:", length(module_dirs), "\n")
cat("Required files per module:", length(required_files), "\n")
cat("Total file checks:", nrow(results), "\n")
cat("Missing files:", nrow(missing_results), "\n\n")

if (nrow(missing_results) == 0) {
  cat("PASS: All required module files are present.\n")
} else {
  cat("FAIL: Some required module files are missing.\n\n")
  print(missing_results[, c("module", "required_file", "path")], row.names = FALSE)
}

output_dir <- file.path(repo_root, "data", "output")
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
}

output_file <- file.path(output_dir, "course-file-check-results.csv")
write.csv(results, output_file, row.names = FALSE)
cat("\nWrote detailed results to:", output_file, "\n")

if (nrow(missing_results) > 0) {
  quit(status = 1)
}
