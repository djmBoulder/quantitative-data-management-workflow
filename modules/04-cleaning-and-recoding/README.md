# 04 Cleaning, Typing, Labeling, and Recoding Variables

## Module Purpose

This module teaches students how to clean variables while preserving the meaning of the original source data. Students practice correcting variable types, standardizing capitalization and whitespace, creating derived variables, recoding categorical variables, and documenting each cleaning decision.

The module uses the synthetic `synthetic_gss_like` survey data. The data intentionally include common teaching problems such as string/numeric type issues, special missing codes, inconsistent capitalization, dollar signs, commas, and values such as `N/A`, `forty`, `DK`, and `Not asked`.

## Learning Objectives

By the end of this module, students should be able to:

- Explain why cleaning and recoding are central data management tasks.
- Distinguish numeric variables from string variables.
- Identify common import problems that require cleaning.
- Standardize capitalization and whitespace.
- Convert variables from string to numeric or numeric to string when needed.
- Preserve original variables before recoding.
- Create new derived variables rather than overwriting raw variables.
- Create binary, ordinal, and categorical variables.
- Apply value labels in Stata and factor levels in R.
- Recode continuous variables into categories.
- Use transparent naming conventions for derived variables.
- Document recode decisions in comments and output files.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- A cleaned working file from the primary software pathway.
- A cleaning decision log.
- A short memo explaining the most important recode and type-conversion decisions.

## Stata Skills

- Use `generate` and `replace` to create cleaned variables.
- Use `egen` for grouped summaries.
- Use `recode` to turn continuous values into categories.
- Use `destring`, `encode`, `decode`, and `tostring` for type conversion.
- Use string functions such as `lower()`, `upper()`, and `trim()`.
- Use `label variable`, `label define`, and `label values`.
- Use `tabulate` to compare raw and cleaned variables.
- Use `assert` for simple validation checks.

## R Skills

- Use `mutate()` to create cleaned and derived variables.
- Use `case_when()` and `if_else()` for recoding.
- Use `as.numeric()` and `as.character()` for type conversion.
- Use `factor()` and `recode()` for categorical variables.
- Use `str_trim()`, `str_to_lower()`, and `str_to_upper()` for string cleaning.
- Use `count()`, `tabyl()`, or `table()` to inspect recodes.
- Use `stopifnot()` or simple validation checks.

## Common Pitfalls

- Overwriting source variables before checking the cleaned result.
- Treating special missing codes such as `-8`, `-9`, `99`, or `999` as real values.
- Converting strings to numbers before removing symbols, commas, or text values.
- Creating categories without documenting the cut points.
- Creating Stata and R recodes that are almost, but not quite, parallel.
- Assuming a recoded variable is correct without tabulating it.

## Estimated Time

4 to 5 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

The capstone portfolio must show defensible cleaning and recoding decisions. This module gives students the core evidence they will need: code that preserves source variables, creates named derived variables, applies labels or factor levels, validates results, and documents decisions clearly.
