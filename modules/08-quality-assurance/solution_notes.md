# 08 Quality Assurance Solution Notes

## Instructor Purpose

This module teaches students to build QA checks into data management workflows. It separates fatal structural checks from warning-level issues in intentionally messy synthetic data, and it asks students to document unresolved concerns.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-08-stata-log.txt`, if Stata is available.
- An R log at `logs/module-08-r-log.txt`.
- QA reports in `data/output/`.
- A QA memo explaining fatal checks, warnings, merge validation, and unresolved issues.

Generated files in `data/output/` and `logs/` should generally remain uncommitted.

## Expected QA Findings

Strong submissions should identify that:

- Required input files and required variables are fatal checks.
- The expected 240 rows in the 2024 person file is a fatal structural check for this lab.
- The region context key should be unique.
- The raw 2024 file intentionally contains a duplicate respondent ID.
- `age` includes values outside the expected adult range because of special codes.
- `gender` includes blanks, special codes, and capitalization differences.
- `survey_weight` includes missing-like values.
- Region keys include unmatched values such as missing/special keys and `mountain west`.
- `territories` appears in the context file without person rows.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: fatal checks and warning-level checks are distinguished correctly.
- 20 percent: duplicate, range, category, and missingness checks are reported.
- 20 percent: merge validation is documented clearly.
- 10 percent: unresolved issues are documented rather than hidden.

## Common Student Issues

- Turning every warning into a fatal assertion.
- Treating warnings as unimportant because the script completed.
- Forgetting to validate region context key uniqueness before merging.
- Reporting only row counts and skipping category or missingness checks.
- Fixing data problems without documenting the change.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review which warning-level issues you want to emphasize in class. The current labs intentionally report duplicate respondent IDs, age special codes, category inconsistencies, missing-like survey weights, logical consistency warnings, and unmatched region keys.

The R lab depends on `dplyr` and `stringr`. The Stata lab uses `assert`, `confirm variable`, `isid`, `duplicates report`, `misstable summarize`, `log using`, and merge validation, and should be tested in Stata before release.

## Instructor Check

The R lab can be checked from the repository root:

```r
source("modules/08-quality-assurance/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
do modules/08-quality-assurance/stata_lab.do
```
