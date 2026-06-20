# 06 Reshaping and Restructuring Data

## Module Purpose

This module teaches students how to recognize wide and long data structures and reshape data for analysis. Students learn that the same information can be stored in different shapes depending on the workflow, research question, and software task.

The module uses `synthetic_gss_like_repeated_measures_wide.csv`, a synthetic repeated-measures file with one row per respondent and yearly measures stored across columns.

The repeated-measures file is intentionally separate from the person-level append and merge files used in later modules. This keeps the reshaping lesson focused on data structure while still using the same `synthetic_gss_like` teaching universe.

## Learning Objectives

By the end of this module, students should be able to:

- Explain wide and long data structures.
- Identify the unit of observation before and after reshaping.
- Explain why wide format can be useful for comparison and reporting.
- Explain why long format can be useful for repeated measures, panels, and person-year analysis.
- Identify variable stubs, ID variables, and time variables.
- Reshape repeated-measures data from wide to long and back to wide.
- Check row counts before and after reshaping.
- Validate reshape results using ID and time keys.
- Document restructuring decisions clearly.
- Explain how a reshaped person-year file could support later combining, QA, and capstone handoff work.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- A long-format working file.
- A reshaped-wide working file.
- A reshape validation report.
- A short memo explaining the unit of observation before and after reshaping.

## Stata Skills

- Use `reshape long` and `reshape wide`.
- Use `isid` to check unique keys.
- Use `duplicates report` to identify duplicate IDs.
- Use `sort`, `bysort`, `order`, `list`, `count`, and `assert`.

## R Skills

- Use `pivot_longer()` and `pivot_wider()`.
- Use `names_to`, `values_to`, and `id_cols`.
- Use `arrange()`, `count()`, `distinct()`, `duplicated()`, and `stopifnot()`.

## Common Pitfalls

- Reshaping before identifying the unit of observation.
- Using an ID variable that is not unique in the wide file.
- Forgetting that the year is stored inside variable names in wide data.
- Losing information stored in variable stubs.
- Failing to check row counts before and after reshaping.
- Treating wide and long formats as better or worse instead of purpose-specific.
- Recoding special missing values during reshaping without documenting that this is a separate cleaning decision.

## Estimated Time

3 to 4 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_repeated_measures_wide.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

The capstone portfolio requires students to justify the structure of their analysis-ready dataset. This module gives students the language, code patterns, and validation habits needed to explain whether a final dataset is wide, long, or person-year structured. It also reinforces badge competencies around reproducible workflows, protected raw data, row-count checks, key validation, and documented data decisions.
