# 03 Data Documentation Solution Notes

## Instructor Purpose

This module teaches students that documentation is part of data preparation, not an optional add-on. Students practice labels, value labels, notes, derived-variable documentation, a small data dictionary, and a demonstration inclusion/exclusion indicator using `synthetic_gss_like`.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-03-stata-log.txt`, if Stata is available.
- An R log at `logs/module-03-r-log.txt`.
- A documented Stata file at `data/working/synthetic_gss_like_person_2024_documented.dta`, if Stata is available.
- Documented R files at `data/working/synthetic_gss_like_person_2024_documented.rds` and `.csv`.
- Data dictionaries in `data/output/`.
- A documentation memo.

Generated files in `data/working/`, `data/output/`, and `logs/` should generally remain uncommitted.

## Expected Conceptual Understanding

Strong submissions should explain that:

- Documentation makes data reusable and reviewable.
- Data dictionaries describe variables and coding notes.
- Codebooks often include broader summaries, frequencies, missingness, and dataset context.
- README files explain how to understand and run the project.
- Variable labels are short descriptions, not complete documentation.
- Value labels explain coded categories.
- Derived variables need source variables, coding rules, and purpose notes.
- Known limitations should be documented rather than hidden.

## Expected Documentation Decisions

Students may describe:

- `gender_doc` is derived from raw `gender` text by trimming and standardizing capitalization.
- `gender_doc` groups not-reported or special missing responses into a documented category for practice.
- `health_doc` is derived from `self_rated_health` and ordered from poor to excellent.
- `analytic_sample_demo` includes ages 18-89 with documented gender values.
- The analytic sample indicator is a documentation exercise, not the final analytic sample for the course.
- Special missing values such as `-9`, `999`, `DK`, and blanks still require later decisions.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: labels, value labels or factors, notes, and data dictionary are created.
- 20 percent: documentation memo clearly distinguishes documentation types.
- 20 percent: derived variables and inclusion/exclusion criteria are explained.
- 10 percent: raw data are protected and generated outputs are handled appropriately.

## Common Student Issues

- Writing labels that are too short or vague.
- Forgetting that value labels apply to coded values, not free-text strings.
- Treating `analytic_sample_demo` as a final analytic sample.
- Documenting derived variables in code but not in the data dictionary.
- Hiding known data problems instead of documenting them.
- Putting instructor-style expected answers into student-facing files.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review whether the `analytic_sample_demo` rules are the right level of simplicity for your students. The rule is intentionally simple and should not replace the missing-data module.

The R lab depends on `dplyr`, `haven`, and `skimr`. The Stata lab uses value labels and `notes`, and should be tested in Stata before release.

## Instructor Check

The R lab can be checked from the repository root:

```r
source("modules/03-data-documentation/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
do modules/03-data-documentation/stata_lab.do
```
