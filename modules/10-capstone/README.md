# 10 Capstone Data Management Portfolio

## Module Purpose

This module defines the final data management portfolio for the microcredential. Students demonstrate that they can take raw synthetic data inputs and produce a transparent, reproducible, analysis-ready dataset with documentation.

The capstone is not a new technical topic. It is the place where students put the earlier skills together into one defensible workflow.

Students may complete the capstone through a Stata pathway, an R pathway, or a dual Stata/R pathway. The required portfolio uses one primary reproducible workflow unless the instructor requires both. The dual pathway is recommended for students who want extra practice translating workflows across software environments.

## Learning Objectives

By the end of this module, students should be able to:

- Build one complete primary-pathway Stata do-file or R script from raw inputs to final outputs.
- Identify whether the portfolio is submitted through the Stata pathway, R pathway, or optional dual pathway.
- Use only synthetic course data.
- Import raw synthetic files without manually editing them.
- Clean and recode variables while preserving the meaning of source variables.
- Handle special missing codes and document missing-data decisions.
- Append person-level files across years.
- Merge region-level contextual data onto person-level data.
- Check duplicates, merge results, missingness, variable coding, and sample restrictions.
- Save an analysis-ready dataset.
- Produce a data dictionary or codebook.
- Produce a QA checklist or QA report.
- Write a brief workflow memo explaining major data decisions.
- Explain what reproducible means in this course.

## Required Student Outputs

Students submit a portfolio containing:

- A reproducible Stata do-file or R script for the primary pathway, or both scripts for the optional dual pathway.
- An analysis-ready dataset.
- A data dictionary or codebook.
- A QA checklist or QA report.
- A brief workflow memo explaining major data decisions.
- Evidence that they checked merges/appends, missing data, variable coding, and sample restrictions.

## Stata Skills

- Build one complete do-file.
- Use `log using` to create a workflow log.
- Import raw synthetic CSV files.
- Clean and recode variables.
- Handle special missing values.
- Append yearly person-level files.
- Merge region-level contextual data.
- Run QA checks with `count`, `summarize`, `tabulate`, `duplicates`, `isid`, and `assert`.
- Save final `.dta`, CSV, documentation, and QA outputs.

## R Skills

- Build one complete R script.
- Use relative paths with `file.path()`.
- Import raw synthetic CSV files.
- Clean and recode variables with tidyverse workflows.
- Handle special missing values.
- Append yearly person-level files with `bind_rows()`.
- Merge region-level contextual data with joins.
- Run QA checks with `count()`, `duplicated()`, `anti_join()`, `summarise()`, and `stopifnot()`.
- Save final CSV, RDS, Stata-compatible, documentation, and QA outputs.

## Common Pitfalls

- Treating the capstone as disconnected module exercises instead of one workflow.
- Submitting output files that cannot be regenerated.
- Hiding dropped cases instead of documenting sample restrictions.
- Merging data without checking unmatched keys.
- Appending files without checking row counts.
- Recoding variables without a codebook.
- Submitting a dataset without a workflow memo.
- Using restricted, confidential, licensed, private, or student data.

## Estimated Time

6 to 8 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2025.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

This is the final capstone. It provides the portfolio evidence for the microcredential badge competencies: reproducible workflow design, transparent data cleaning, data combination, missing-data handling, QA, documentation, and handoff readiness.
