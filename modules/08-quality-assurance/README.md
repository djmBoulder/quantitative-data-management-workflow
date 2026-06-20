# 08 Quality Assurance and Validation Checks

## Module Purpose

This module teaches students how to build quality assurance checks into data management workflows so they can catch problems before analysis. QA is treated as an ongoing part of data work, not an optional final step.

Students use the synthetic `synthetic_gss_like` data to check row counts, variable counts, ranges, categories, duplicates, missingness, and merge results. The dataset intentionally contains issues that should be reported as warnings rather than hidden.

## Learning Objectives

By the end of this module, students should be able to:

- Explain why QA is part of data management.
- Run row-count and variable-count checks.
- Check expected variable names.
- Check numeric ranges and valid categories.
- Check logical consistency across variables.
- Diagnose duplicate ID problems.
- Summarize missingness.
- Validate merge results.
- Compare checks before and after transformations.
- Use assertions carefully.
- Create a QA log or report.
- Document unresolved issues.
- Distinguish warnings from fatal errors.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- A QA report describing fatal checks, warnings, and unresolved issues.
- A short memo explaining which issues should block analysis and which should be documented for later cleaning.

## Stata Skills

- Use `count`, `describe`, `codebook`, `summarize`, and `tabulate`.
- Use `assert` carefully for fatal checks.
- Use `confirm variable`.
- Use `isid` and `duplicates report`.
- Use `misstable summarize`.
- Use `log using` and `display`.

## R Skills

- Use `nrow()`, `ncol()`, `names()`, and `summary()`.
- Use `count()`, `distinct()`, `duplicated()`, and `anyNA()`.
- Use `stopifnot()` for simple fatal checks.
- Write a simple QA report to a text or Markdown file.

## Common Pitfalls

- Treating QA as a final step after all cleaning is done.
- Writing assertions for conditions that are expected to fail in raw data.
- Ignoring warnings because the script did not stop.
- Letting software silently drop or duplicate rows.
- Checking only row counts but not key uniqueness.
- Fixing problems without documenting the decision.

## Estimated Time

3 to 4 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

The capstone portfolio must include evidence that the final dataset was checked. This module gives students a QA-report structure they can reuse to document passed checks, warnings, unresolved issues, and decisions that require instructor or collaborator review.
