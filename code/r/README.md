# R Code

This folder holds reusable R scripts and helper workflows for course examples.

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

```sh
Rscript code/r/check-course-files.R
```

Run `run-r-lab-smoke-tests.R` first as a dry run:

```sh
Rscript code/r/run-r-lab-smoke-tests.R
```

Then run all R labs only when you are ready for generated files to be created in ignored folders:

```sh
Rscript code/r/run-r-lab-smoke-tests.R --run
```

To run one module:

```sh
Rscript code/r/run-r-lab-smoke-tests.R --run --module=03-data-documentation
```
