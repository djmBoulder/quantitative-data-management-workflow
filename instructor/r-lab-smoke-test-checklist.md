# R Lab Smoke-Test Checklist

Instructor-facing manual checklist for testing R labs before launch.

Run these tests from the repository root in a clean R session when possible.

## Test Environment

- [ ] R version recorded:
- [ ] RStudio, Positron, or editor recorded:
- [ ] Operating system recorded:
- [ ] Repository branch or commit recorded:
- [ ] Tester name/date recorded:
- [ ] Test run starts from the repository root.
- [ ] Existing generated files in `data/working/`, `data/output/`, and `logs/` are cleared or noted before testing.

## Package Setup

Before testing, run the dependency checker from the repository root:

```bash
Rscript code/r/check-r-dependencies.R
```

The script reports which packages are installed and prints an `install.packages()` command for any missing packages. It does not install packages automatically.

Required packages for module R lab smoke tests:

- [ ] `dplyr`
- [ ] `tidyr`
- [ ] `stringr`
- [ ] `readr`
- [ ] `readxl`
- [ ] `janitor`
- [ ] `skimr`
- [ ] `haven`

The broader dependency checker also reports `openxlsx`, which is needed only when regenerating the Module 02 Excel teaching file from `code/r/create-synthetic-data.R`.

Install missing course packages with:

```r
install.packages(c(
  "dplyr",
  "tidyr",
  "stringr",
  "readr",
  "readxl",
  "janitor",
  "skimr",
  "haven",
  "openxlsx"
))
```

The R lab smoke-test runner checks the module lab packages before a full run and verifies that all 11 expected module `r_lab.R` files are present.

## Individual Source Checks

Each R lab should also run from the repository root with `source()`:

```r
source("modules/00-orientation/r_lab.R")
source("modules/01-project-workflows/r_lab.R")
source("modules/02-importing-data/r_lab.R")
source("modules/03-data-documentation/r_lab.R")
source("modules/04-cleaning-and-recoding/r_lab.R")
source("modules/05-missing-data/r_lab.R")
source("modules/06-reshaping-data/r_lab.R")
source("modules/07-combining-data/r_lab.R")
source("modules/08-quality-assurance/r_lab.R")
source("modules/09-reproducible-outputs/r_lab.R")
source("modules/10-capstone/r_lab.R")
```

## Automated Smoke-Test Script

From the repository root, list the labs that would be tested:

```bash
Rscript code/r/run-r-lab-smoke-tests.R
```

The dry run should report 11 expected module R labs and 11 present module R labs.

Run one module:

```bash
Rscript code/r/run-r-lab-smoke-tests.R --run --module=03-data-documentation
```

Run all module R labs:

```bash
Rscript code/r/run-r-lab-smoke-tests.R --run
```

The script writes a detailed results file to `data/output/r-lab-smoke-test-results.csv`. Generated files in `data/working/`, `data/output/`, and `logs/` are ignored by Git.

## General Checks For Every `.R` File

For each lab:

- [ ] Restart R before running the script.
- [ ] Confirm `getwd()` is the repository root.
- [ ] Open the `.R` file.
- [ ] Confirm it uses relative paths.
- [ ] Confirm it does not write into `data/synthetic/`.
- [ ] Confirm it creates needed folders or assumes only tracked folders.
- [ ] Run the full script from top to bottom.
- [ ] Confirm the script finishes without unexpected fatal errors.
- [ ] Confirm expected log/report/output files are created.
- [ ] Confirm generated files are in ignored folders.
- [ ] Note expected warnings or intentional data issues.

## Module Checklist

| Module | R lab | Smoke-test checks |
| --- | --- | --- |
| 00 Orientation | `modules/00-orientation/r_lab.R` | Finds synthetic CSV; writes setup report and log. |
| 01 Project workflows | `modules/01-project-workflows/r_lab.R` | Imports 2024 CSV; inspects variables; saves working RDS; writes inspection output and log. |
| 02 Importing data | `modules/02-importing-data/r_lab.R` | Reads CSV and Excel files; standardizes names; saves imported working copies; writes import inspection. |
| 03 Data documentation | `modules/03-data-documentation/r_lab.R` | Creates labelled/factor documentation examples; exports dictionary files; saves documented working file. |
| 04 Cleaning and recoding | `modules/04-cleaning-and-recoding/r_lab.R` | Cleans strings/types; creates derived variables; validates recodes; writes cleaning decisions. |
| 05 Missing data | `modules/05-missing-data/r_lab.R` | Recodes special missing values; creates row-missing and sample flags; writes sample/missing summaries. |
| 06 Reshaping data | `modules/06-reshaping-data/r_lab.R` | Reads repeated-measures wide file; pivots long and wide; validates row counts and keys. |
| 07 Combining data | `modules/07-combining-data/r_lab.R` | Binds person files; checks duplicate person-year keys; joins region context; writes diagnostics. |
| 08 Quality assurance | `modules/08-quality-assurance/r_lab.R` | Runs fatal and warning-level QA checks; validates join; writes QA report. |
| 09 Reproducible outputs | `modules/09-reproducible-outputs/r_lab.R` | Creates analysis-ready output, summary table, codebook/metadata, workflow log, and memo. |
| 10 Capstone | `modules/10-capstone/r_lab.R` | Runs full capstone-style workflow; generates analysis-ready data, codebook, QA report, log, and memo. |

## Common R Smoke-Test Failures

- Script run from the wrong working directory.
- Package not installed.
- Student runs only selected lines, causing object-not-found errors.
- `readxl` cannot find the Excel teaching file.
- Objects from a previous run hide a script problem.
- Generated folders are missing.
- Join outputs have unexpected rows because duplicate keys are intentional teaching issues.

## Smoke-Test Record

Use this section during launch prep:

| Module | Pass/fail | Notes | Follow-up needed |
| --- | --- | --- | --- |
| 00 |  |  |  |
| 01 |  |  |  |
| 02 |  |  |  |
| 03 |  |  |  |
| 04 |  |  |  |
| 05 |  |  |  |
| 06 |  |  |  |
| 07 |  |  |  |
| 08 |  |  |  |
| 09 |  |  |  |
| 10 |  |  |  |
