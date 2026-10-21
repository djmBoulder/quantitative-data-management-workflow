# R Code

This folder holds setup helpers and optional course checks. The supplied teaching data are ready to use; students do not need to regenerate them or run all labs at once. A smoke test checks whether a script completes without an execution error. For student setup, use the [R setup guide](../../resources/student-r-setup.md).

## Synthetic Data Generator

Run `create-synthetic-data.R` from the repository root to regenerate the tracked synthetic teaching files in `data/synthetic/`.

The script uses base R for CSV output and `openxlsx` to write the Module 02 Excel teaching file:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2024.xlsx`
- `data/synthetic/synthetic_gss_like_person_2025.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/synthetic_gss_like_repeated_measures_wide.csv`

## Course QA Scripts

Run `check-course-files.R` to verify that each module folder contains the standard course files:

**macOS Terminal or Windows PowerShell:**

```sh
# Check the required course files from the repository root.
Rscript code/r/check-course-files.R
```

Run `run-r-lab-smoke-tests.R` first as a dry run:

**macOS Terminal or Windows PowerShell:**

```sh
# List the R labs that the smoke test will run.
Rscript code/r/run-r-lab-smoke-tests.R
```

The dry run verifies that all 11 expected module `r_lab.R` files are present.

Then run all R labs only when you are ready for generated files to be created in ignored folders:

**macOS Terminal or Windows PowerShell:**

```sh
# Run every R lab and write generated results to ignored folders.
Rscript code/r/run-r-lab-smoke-tests.R --run
```

To run one module:

**macOS Terminal or Windows PowerShell:**

```sh
# Run one selected R lab through the smoke-test runner.
Rscript code/r/run-r-lab-smoke-tests.R --run --module=03-data-documentation
```

Individual R module labs should also run from the repository root with R's `source()`, for example:

**R:**

```r
# R: Course QA Scripts.
source("modules/03-data-documentation/r_lab.R")
```
