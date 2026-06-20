# 03 Data Documentation, Metadata, and Codebooks

## Module Purpose

This module teaches students how to document data so another researcher can understand what the dataset contains, where variables came from, how variables are coded, and what decisions were made during preparation. Documentation is treated as part of reproducible research, not as a final decoration added after analysis.

Students use the synthetic `synthetic_gss_like` survey data to add labels, create documented derived variables, write notes, and export a simple data dictionary.

## Learning Objectives

By the end of this module, students should be able to:

- Explain why documentation supports reproducible research, collaboration, and future analysis.
- Distinguish data dictionaries, codebooks, README files, variable labels, value labels, and workflow notes.
- Use naming conventions to make variables easier to understand.
- Add variable labels and value labels where appropriate.
- Document derived variables and coding decisions.
- Document inclusion and exclusion criteria for a demonstration analytic sample.
- Document known data limitations without hiding problems.
- Create a simple data dictionary as a CSV or Markdown file.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- A documented working file from the primary software pathway.
- A data dictionary exported from the primary software pathway.
- A short documentation memo explaining coding decisions, known limitations, and inclusion/exclusion criteria.

## Stata Skills

- Use `describe` and `codebook` to inspect variable documentation.
- Use `label data` to label a dataset.
- Use `label variable` to label variables.
- Use `label define` and `label values` to document coded values.
- Use `labelbook` to review value labels.
- Use `notes` to record source notes and coding decisions.
- Use `order` to organize variables.
- Use `compress` to reduce file size safely.
- Use `save` to store a documented working file.

## R Skills

- Use `names()`, `glimpse()`, `summary()`, and `skimr::skim()` to inspect data.
- Use `rename()` and naming conventions to clarify variables.
- Use `mutate()`, `case_when()`, and `factor()` to create documented variables.
- Use `haven` attributes where appropriate to store variable labels.
- Write a simple data dictionary as a CSV and Markdown file.
- Save a documented working file.

## Common Pitfalls

- Assuming clear variable names are enough documentation.
- Adding labels but not explaining coding decisions.
- Creating derived variables without documenting the source variable.
- Mixing student-facing documentation with instructor-only solution notes.
- Hiding known data limitations instead of documenting them.
- Documenting Stata and R workflows differently when they should be parallel.

## Estimated Time

3 to 4 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

The final capstone requires a data management portfolio with enough documentation for another researcher to understand and reuse the final dataset. This module builds the codebook, labels, notes, and decision log habits students will carry into the capstone.
