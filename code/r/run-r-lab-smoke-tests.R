# Run R Lab Smoke Tests
#
# Instructor-facing QA script for the IBS CU Boulder
# "Quantitative Data Management and Workflow for Social Scientists" microcredential.
#
# By default, this script does a DRY RUN. It discovers module R labs, lists
# what would be run, checks package availability, and explains how to run labs
# one by one or all at once.
#
# Dry run:
#   Rscript code/r/run-r-lab-smoke-tests.R
#
# Run all R labs:
#   Rscript code/r/run-r-lab-smoke-tests.R --run
#
# Run one module:
#   Rscript code/r/run-r-lab-smoke-tests.R --run --module=03-data-documentation
#
# Smoke tests may create files in data/working/, data/output/, and logs/.
# Those folders are ignored by Git in this repository.

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

args <- commandArgs(trailingOnly = TRUE)
run_tests <- "--run" %in% args

module_arg <- grep("^--module=", args, value = TRUE)
selected_module <- if (length(module_arg) == 1) {
  sub("^--module=", "", module_arg)
} else {
  NA_character_
}

repo_root <- find_repo_root()
setwd(repo_root)

discover_labs <- function() {
  lab_paths <- list.files(
    "modules",
    pattern = "^r_lab[.]R$",
    recursive = TRUE,
    full.names = TRUE
  )

  lab_paths <- lab_paths[grepl("^modules/[^/]+/r_lab[.]R$", lab_paths)]
  lab_paths <- sort(lab_paths)

  data.frame(
    module = basename(dirname(lab_paths)),
    path = lab_paths,
    exists = file.exists(lab_paths),
    stringsAsFactors = FALSE
  )
}

check_required_packages <- function(packages) {
  installed <- vapply(packages, requireNamespace, quietly = TRUE, FUN.VALUE = logical(1))
  data.frame(
    package = packages,
    installed = unname(installed),
    stringsAsFactors = FALSE
  )
}

labs <- discover_labs()

if (nrow(labs) == 0) {
  stop(
    "No module R labs found. Expected files like modules/00-orientation/r_lab.R.",
    call. = FALSE
  )
}

if (!is.na(selected_module)) {
  if (!selected_module %in% labs$module) {
    stop(
      "Unknown module: ", selected_module, "\n",
      "Use one of: ", paste(labs$module, collapse = ", "),
      call. = FALSE
    )
  }
  labs <- labs[labs$module == selected_module, , drop = FALSE]
}

cat("\nR lab smoke-test runner\n")
cat("=======================\n\n")
cat("Repository root:", repo_root, "\n")
cat("Mode:", if (run_tests) "RUN" else "DRY RUN", "\n")
cat("Labs selected:", nrow(labs), "\n\n")

package_results <- check_required_packages(required_packages)
missing_packages <- package_results$package[!package_results$installed]

cat("Required package check:\n")
print(package_results, row.names = FALSE)

if (length(missing_packages) > 0) {
  cat("\nMissing packages detected:\n")
  cat("  ", paste(missing_packages, collapse = ", "), "\n\n", sep = "")
  cat("Install missing packages in R with:\n")
  cat("install.packages(c(")
  cat(paste(sprintf('\"%s\"', missing_packages), collapse = ", "))
  cat("))\n\n")

  if (run_tests) {
    cat("Stopping before full smoke tests because required packages are missing.\n")
    quit(status = 1)
  }
} else {
  cat("\nAll required packages are installed.\n\n")
}

missing_labs <- labs[!labs$exists, ]
if (nrow(missing_labs) > 0) {
  cat("Missing R lab files:\n")
  print(missing_labs, row.names = FALSE)
  quit(status = 1)
}

if (!run_tests) {
  cat("Dry run only. No labs were executed.\n\n")
  cat("Labs that would be run:\n")
  print(labs[, c("module", "path")], row.names = FALSE)
  cat("\nTo run all labs, use:\n")
  cat("  Rscript code/r/run-r-lab-smoke-tests.R --run\n\n")
  cat("To run one lab, use for example:\n")
  cat("  Rscript code/r/run-r-lab-smoke-tests.R --run --module=03-data-documentation\n\n")
  cat("Before running, consider clearing or noting generated files in:\n")
  cat("  data/working/\n")
  cat("  data/output/\n")
  cat("  logs/\n")
  quit(status = 0)
}

ensure_output_dirs <- function() {
  for (dir_name in c("data/working", "data/output", "logs")) {
    if (!dir.exists(dir_name)) {
      dir.create(dir_name, recursive = TRUE, showWarnings = FALSE)
    }
  }
}

close_open_sinks <- function() {
  while (sink.number(type = "output") > 0) {
    sink(type = "output")
  }
}

run_one_lab <- function(module, path) {
  cat("\nRunning", module, "...\n")
  start_time <- Sys.time()
  status <- "PASS"
  message <- ""
  warnings_seen <- character()

  tryCatch(
    {
      setwd(repo_root)
      ensure_output_dirs()
      withCallingHandlers(
        {
          sys.source(path, envir = new.env(parent = globalenv()), chdir = FALSE)
        },
        warning = function(w) {
          warnings_seen <<- c(warnings_seen, conditionMessage(w))
          invokeRestart("muffleWarning")
        }
      )
    },
    error = function(e) {
      status <<- "FAIL"
      message <<- conditionMessage(e)
    },
    finally = {
      close_open_sinks()
      setwd(repo_root)
    }
  )

  end_time <- Sys.time()

  data.frame(
    module = module,
    path = path,
    status = status,
    message = message,
    warnings = paste(unique(warnings_seen), collapse = " | "),
    started_at = format(start_time, "%Y-%m-%d %H:%M:%S"),
    ended_at = format(end_time, "%Y-%m-%d %H:%M:%S"),
    seconds = round(as.numeric(difftime(end_time, start_time, units = "secs")), 2),
    stringsAsFactors = FALSE
  )
}

results <- do.call(
  rbind,
  Map(run_one_lab, labs$module, labs$path)
)

cat("\nSmoke-test summary\n")
cat("==================\n\n")
print(results[, c("module", "status", "seconds", "message")], row.names = FALSE)

output_file <- file.path(repo_root, "data", "output", "r-lab-smoke-test-results.csv")
write.csv(results, output_file, row.names = FALSE)
cat("\nWrote detailed results to:", output_file, "\n")

if (any(results$status != "PASS")) {
  quit(status = 1)
}
