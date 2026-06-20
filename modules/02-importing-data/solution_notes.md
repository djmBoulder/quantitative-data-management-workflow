# 02 Importing and Inspecting Data Solution Notes

## Instructor Purpose

This module teaches careful import habits before students begin cleaning. Students should learn that import is not a neutral step: software guesses names, types, missingness, and labels. The core outcome is an inspection record and a working copy, not a fully cleaned dataset.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-02-stata-log.txt`, if Stata is available.
- An R log at `logs/module-02-r-log.txt`.
- A Stata working file at `data/working/synthetic_gss_like_person_2024_imported.dta`, if Stata is available.
- R working files at `data/working/synthetic_gss_like_person_2024_imported.rds` and `data/working/synthetic_gss_like_person_2024_imported.csv`.
- Inspection summaries in `data/output/`.
- A short import inspection memo.

Generated files in `data/working/`, `data/output/`, and `logs/` should generally remain uncommitted.

## Expected Conceptual Understanding

Strong submissions should explain that:

- CSV files are plain text and portable but do not preserve labels or formatting.
- Excel files may contain sheets, formatting, formulas, and notes that require careful import choices.
- Stata `.dta` files can preserve Stata labels, types, and notes.
- Fixed-width/plain-text files require layout documentation because variable positions matter.
- Raw files should not be edited manually.
- Working copies should be created by scripts.

## Expected Import Findings

Students may identify:

- Raw column names include spaces, punctuation, and mixed capitalization.
- Standardized names use lowercase snake case, including `year` instead of `Survey Year`.
- CSV and Excel import may make different guesses about types.
- `hours_worked`, `household_income`, `physical_activity_days`, and `survey_weight` can behave like strings because they include text or punctuation.
- `age` includes special values such as `-9` and `999`.
- `gender`, `region`, and `education` contain inconsistent capitalization and special codes.
- CSV and Excel imports do not provide full Stata-style value labels.

Students do not need to resolve all of these issues in this module.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: CSV and Excel files are imported or read and inspected.
- 20 percent: variable names are standardized and working copies are saved.
- 20 percent: memo accurately distinguishes file types and identifies import problems.
- 10 percent: raw files are protected and generated files are handled appropriately.

## Common Student Issues

- Running the labs from the wrong working directory.
- Missing the Excel file or missing the R `readxl` package.
- Editing raw files manually to make import easier.
- Treating special missing codes as cleaned missing values too early.
- Assuming the imported working file is analysis-ready.
- Putting instructor-style answers or expected values into student-facing files.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review the Excel dependency before teaching this module. The lab expects:

`data/synthetic/synthetic_gss_like_person_2024.xlsx`

The Excel file is generated from `person_2024` by `code/r/create-synthetic-data.R` using `openxlsx`. The R lab expects the `readxl` package for reading Excel files. The Stata lab expects a Stata version that supports `import excel` with `.xlsx` files.

## Instructor Check

The R lab can be checked from the repository root:

```r
source("modules/02-importing-data/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
do modules/02-importing-data/stata_lab.do
```
