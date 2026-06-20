# 06 Reshaping Data Solution Notes

## Instructor Purpose

This module teaches students to identify wide and long structures, reshape repeated-measures data, and validate that the reshaped result has the intended unit of observation. It uses a synthetic wide file with one row per respondent and repeated yearly measures stored in columns.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-06-stata-log.txt`, if Stata is available.
- An R log at `logs/module-06-r-log.txt`.
- Long working files in `data/working/`.
- Wide-again working files in `data/working/`.
- Reshape validation reports in `data/output/`.
- A restructuring memo.

Generated files in `data/working/`, `data/output/`, and `logs/` should generally remain uncommitted.

## Expected Reshape Understanding

Strong submissions should explain that:

- The original wide file has one row per respondent.
- The long file has one row per respondent-year.
- The wide key is `respondent_id`.
- The long key is `respondent_id` plus `year`.
- The time variable comes from suffixes in column names.
- The reshaped stubs are `health`, `activity_days`, and `hours_worked`.
- With 120 respondents and 3 years, the long file should have 360 rows.
- The wide-again file should return to 120 rows.
- Special missing codes in repeated measures are carried through the reshape in this module, not fully cleaned.
- Reshape evidence can be reused in the capstone as proof of row-count, key, and unit-of-observation checks.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: wide-to-long reshape is correct and validated.
- 20 percent: long-to-wide reshape is correct and validated.
- 20 percent: memo clearly explains unit of observation, keys, time variable, and stubs.
- 10 percent: validation report documents row counts and key checks.

## Common Student Issues

- Forgetting that `respondent_id` alone is not unique in the long file.
- Reshaping without checking duplicate IDs.
- Using the wrong variable stub.
- Treating `year` as a measure rather than a time variable.
- Failing to validate row counts.
- Assuming wide and long formats are interchangeable without documenting why one is needed.
- Trying to solve missing-data cleaning and reshaping at the same time without documenting each decision.
- Omitting reshape validation evidence from the memo even when the script ran correctly.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review the new synthetic file `data/synthetic/synthetic_gss_like_repeated_measures_wide.csv` before teaching. It is generated from synthetic respondent IDs and includes three years: 2022, 2023, and 2024.

The R lab depends on `dplyr` and `tidyr`. The Stata lab uses `reshape long`, `reshape wide`, `isid`, `duplicates report`, `bysort`, and `assert`, and should be tested in Stata before release.

The current repeated-measures structure is adequate for the course. It is intentionally separate from the person-level append and region-merge files used in Modules 07 and 10, because Module 06 is focused on structure rather than combining datasets. Instructors who want a more advanced capstone extension could ask students to reshape this long file and then merge selected person-level descriptors, but that is not required for the core badge evidence.

## Instructor Check

The R lab can be checked from the repository root:

```r
source("modules/06-reshaping-data/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
do modules/06-reshaping-data/stata_lab.do
```
