# synthetic_gss_like Teaching Data

This folder contains the plan for `synthetic_gss_like`, a small synthetic survey-style dataset for the IBS CU Boulder microcredential **Quantitative Data Management and Workflow for Social Scientists**. The data are designed to resemble a general social survey structure without using any real respondent records.

## Purpose

The dataset supports beginner-friendly practice with common social science data management tasks:

- importing CSV files into Stata and R,
- preserving raw data,
- cleaning variable names,
- diagnosing string and numeric typing problems,
- labeling variables and coded values,
- recoding categorical variables,
- handling special missing-value codes,
- appending person-level files across years,
- merging person-level records with region-level context,
- reshaping repeated-measures data between wide and long formats,
- checking duplicates, unmatched keys, and row counts,
- producing basic descriptive outputs.

## Generated Files

The R generation script creates these tracked synthetic teaching files:

- `synthetic_gss_like_person_2024.csv`: individual-level survey-style file for the first teaching year, with about 240 rows.
- `synthetic_gss_like_person_2024.xlsx`: Excel version of the 2024 person-level file for Module 02 import practice. It contains the same synthetic records as the CSV file on the first worksheet.
- `synthetic_gss_like_person_2025.csv`: individual-level survey-style file for a second teaching year, with about 180 rows. Students can append this to the 2024 file.
- `synthetic_gss_like_region_context.csv`: region-level contextual file. Students can merge this onto the person-level files by region after cleaning the region keys.
- `synthetic_gss_like_repeated_measures_wide.csv`: wide-format repeated-measures file with one row per respondent and yearly measures in separate columns. Students can reshape this file between wide and long formats without needing to append or merge first.

The R script uses base R for CSV files and `openxlsx` for the Excel file.

## Stata `.dta` Policy

The tracked synthetic teaching inputs are the CSV files and the reproducible Excel file listed above. These are the source files students use directly for importing practice.

The Stata script can import the CSV files and save generated `.dta` versions in `data/synthetic/stata/`. Those `.dta` files are not tracked in Git because they can be recreated from the tracked CSV files and `code/stata/create-synthetic-data.do`. The `data/synthetic/stata/` folder is ignored by `.gitignore`.

Use generated `.dta` files only as local convenience files for Stata-based setup, testing, or instruction. Do not commit them unless IBS later decides that a specific `.dta` file is required as a teaching input and documents that exception.

## Intentional Teaching Problems

The generated files intentionally include realistic data issues:

- inconsistent capitalization in categorical values,
- special missing codes such as `-8`, `-9`, `99`, and `999`,
- string values mixed into fields students may expect to be numeric,
- duplicate respondent IDs in the 2024 person-level file,
- unmatched region keys across person and context files,
- extra spaces in some string values,
- CSV and Excel column names with spaces, punctuation, and inconsistent capitalization,
- repeated-measures columns with special missing codes that should be carried through reshaping before later cleaning decisions.

These problems are intentional. Students should learn to identify, document, clean, and validate them rather than assuming imported data are analysis-ready.

## Data Safety

All records are synthetic. Do not replace these files with restricted, confidential, licensed, private, or student data.

## How to Create the Files

From the repository root, run:

```r
source("code/r/create-synthetic-data.R")
```

The R script requires the `openxlsx` package to regenerate `synthetic_gss_like_person_2024.xlsx`.

Then, in Stata, run:

```stata
do code/stata/create-synthetic-data.do
```

The Stata script creates `data/synthetic/stata/` if needed and writes regenerated `.dta` files there. The scripts use relative paths so they can be run from the repository root.
