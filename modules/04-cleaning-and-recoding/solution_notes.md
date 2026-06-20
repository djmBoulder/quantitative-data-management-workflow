# 04 Cleaning and Recoding Solution Notes

## Instructor Purpose

This module teaches students to clean variables without losing the meaning of source data. It emphasizes preserving original variables, creating transparent derived variables, documenting recode decisions, and validating results in parallel Stata and R workflows.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-04-stata-log.txt`, if Stata is available.
- An R log at `logs/module-04-r-log.txt`.
- A cleaned Stata file at `data/working/synthetic_gss_like_person_2024_cleaned.dta`, if Stata is available.
- Cleaned R files at `data/working/synthetic_gss_like_person_2024_cleaned.rds` and `.csv`.
- Cleaning decision logs in `data/output/`.
- A cleaning memo.

Generated files in `data/working/`, `data/output/`, and `logs/` should generally remain uncommitted.

## Expected Cleaning Decisions

Strong submissions should identify that:

- `age_clean` preserves `age` and sets `-9` and `999` to missing.
- `age_group` recodes `age_clean` into 18-29, 30-44, 45-64, and 65+.
- `gender_clean` standardizes `gender` capitalization and not-reported values.
- `region_text_clean` trims and lowercases raw region text.
- `hours_worked_num` converts numeric-looking text after setting `N/A`, `forty`, `-8`, and `-9` to missing.
- `household_income_num` removes `$` and commas and handles special missing codes.
- `physical_activity_days_num` handles nonnumeric activity-day values.
- `survey_weight_num` handles comma decimal values such as `1,25`.
- `employed_flag` creates a binary employment indicator.
- `health_ord` creates an ordered health category.

Students do not need to justify these as final research decisions. They should understand them as transparent teaching examples.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: source variables are preserved and derived variables are clearly named.
- 20 percent: type conversions and recodes are documented.
- 20 percent: validation checks and tabulations are used to inspect results.
- 10 percent: memo clearly identifies decisions needing future discussion.

## Common Student Issues

- Overwriting source variables.
- Forgetting to handle special missing codes before type conversion.
- Treating `999` or `-9` as meaningful numeric values.
- Creating categories without checking raw values first.
- Making Stata and R recodes inconsistent.
- Assuming the cleaned file is final analysis-ready data.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review whether the age-group cut points, employment binary, and handling of special codes match your preferred teaching examples. They are intentionally simple and should not be treated as final analytic decisions.

The R lab depends on `dplyr`, `stringr`, and `janitor`. The Stata lab uses `destring`, `encode`, `decode`, `tostring`, `egen`, `recode`, labels, and assertions, and should be tested in Stata before release.

## Instructor Check

The R lab can be checked from the repository root:

```r
source("modules/04-cleaning-and-recoding/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
do modules/04-cleaning-and-recoding/stata_lab.do
```
