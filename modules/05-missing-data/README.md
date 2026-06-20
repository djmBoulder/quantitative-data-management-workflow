# 05 Missing Data and Analytic Sample Construction

## Module Purpose

This module teaches students how to identify, recode, document, and report missing data before constructing an analytic sample. Students learn that missing-data decisions are research decisions, not just software defaults.

The module uses the synthetic `synthetic_gss_like` survey data, which intentionally include system missing values, special missing-value codes, impossible values, and text values that need to be documented before analysis.

## Learning Objectives

By the end of this module, students should be able to:

- Explain why missing-data decisions matter for reproducible research.
- Distinguish system missing values from special missing-value codes.
- Explain differences between Stata missing values and R `NA` values.
- Identify impossible or out-of-range values.
- Recode special missing codes to system missing values.
- Check missingness variable by variable.
- Check row-wise missingness across key variables.
- Create complete-case indicators.
- Construct analytic sample flags without silently deleting cases.
- Document inclusion and exclusion criteria.
- Track sample size changes across preparation steps.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- A missing-data summary.
- A sample construction table.
- A cleaned working file with missing-data flags.
- A short analytic sample memo explaining inclusion and exclusion rules.

## Stata Skills

- Use `missing()` to identify system missing values.
- Use `mvdecode` to recode special missing codes.
- Use `misstable summarize` for variable-level missingness.
- Use `tabulate, missing`, `summarize`, `count`, and `codebook`.
- Use `egen rowmiss()` for row-wise missingness.
- Generate complete-case and analytic-sample flags.
- Use `assert` for simple validation checks.
- Use `preserve` and `restore` when checking filtered samples.

## R Skills

- Use `is.na()` and `na_if()` to identify and recode missing values.
- Use `across()`, `mutate()`, and `case_when()` for parallel cleaning steps.
- Use `summarise()`, `count()`, and `rowSums(is.na())`.
- Use `complete.cases()` to create complete-case indicators.
- Use `filter()` to inspect analytic samples without silently deleting cases.
- Use `janitor` summaries where useful without adding unnecessary complexity.

## Common Pitfalls

- Treating special codes like `-8`, `-9`, `99`, or `999` as real values.
- Dropping cases before documenting why they were removed.
- Assuming Stata missing values and R `NA` behave the same way in every comparison.
- Forgetting to check missingness across rows, not just variables.
- Reporting a final sample size without showing how it was constructed.
- Letting a model or table silently delete cases.

## Estimated Time

3 to 4 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

The capstone requires students to explain which records are included in the analytic data and why. This module provides the missing-data summaries, complete-case indicators, analytic sample flags, and sample-size tracking habits students will need for that final portfolio.
