# 05 Missing Data Solution Notes

## Instructor Purpose

This module teaches students that missing-data decisions should be explicit, documented, and reproducible. The labs create system missing values from special codes, summarize missingness, create row-wise missing counts, build complete-case and analytic-sample flags, and track sample size changes.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-05-stata-log.txt`, if Stata is available.
- An R log at `logs/module-05-r-log.txt`.
- Stata and R working files with missing-data flags.
- Sample construction tables in `data/output/`.
- Missing-data summary text files in `data/output/`.
- An analytic sample memo.

Generated files in `data/working/`, `data/output/`, and `logs/` should generally remain uncommitted.

## Expected Missing-Data Decisions

Strong submissions should identify that:

- `age_clean` treats `-9` and `999` as missing.
- `gender_clean` treats `-9`, blanks, and prefer-not-to-answer responses as missing.
- `health_ord` treats `DK`, `-9`, and blanks as missing.
- `hours_worked_num` treats `-8`, `-9`, `N/A`, and `forty` as missing.
- `household_income_num` treats `-8`, `999999`, blanks, and `Not asked` as missing.
- `physical_activity_days_num` treats `-9`, `Not asked`, and `eight` as missing.
- `survey_weight_num` treats `-9` and blanks as missing and converts comma decimal values.
- `complete_case_core` is based on age, gender, health, income, and survey weight.
- `analytic_sample_flag` marks included cases without dropping excluded cases from the saved working file.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: special missing codes are recoded and documented.
- 20 percent: variable-level and row-wise missingness are reported.
- 20 percent: complete-case and analytic-sample flags are constructed and explained.
- 10 percent: sample-size changes are tracked and silent case deletion is avoided.

## Common Student Issues

- Using `== NA` in R instead of `is.na()`.
- Forgetting to recode special codes before summarizing missingness.
- Treating `999` as a real age.
- Dropping rows before creating an analytic sample flag.
- Reporting only final sample size.
- Making different inclusion criteria in Stata and R.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review the definition of `complete_case_core` and `analytic_sample_flag` before teaching. They are intentionally simple examples based on age, gender, health, income, and survey weight. They should not be presented as the only valid analytic sample for a real research question.

The R lab depends on `dplyr`, `stringr`, and `janitor`. The Stata lab uses `mvdecode`, `misstable summarize`, `egen rowmiss()`, `preserve`, and `restore`, and should be tested in Stata before release.

## Instructor Check

The R lab can be checked from the repository root:

```r
source("modules/05-missing-data/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
do modules/05-missing-data/stata_lab.do
```
