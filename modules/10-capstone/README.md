# 10 Capstone Data Management Portfolio

## Module Purpose

This module defines the final data management portfolio for the microcredential. Students demonstrate that they can take approved source data and produce a transparent, reproducible, analysis-ready dataset with documentation.

The capstone is not a new technical topic. It is the place where students put the earlier skills together into one defensible workflow.

Students may complete the capstone through a Stata pathway, an R pathway, or a dual Stata/R pathway. The required portfolio uses one primary reproducible workflow. The dual pathway is recommended for students who want extra practice translating workflows across software environments.

## Where To Start

Read the [capstone assignment](assignment.md), then choose course-provided synthetic data (Option A) or instructor-approved, publicly distributable student-selected data (Option B). For Option B, submit the [data proposal](../../assignments/capstone-data-proposal.md) in Canvas and obtain approval before beginning the capstone with those data. Both options use the same rubric and portfolio requirements. The guided Stata and R labs remain worked examples using the synthetic data.

Reshaping can be demonstrated through Module 06 when it is not part of the capstone. For Option B, append and/or merge can be demonstrated through Module 07 when they do not apply to the approved workflow. Identify and justify those evidence locations in the proposal and final memo. All required module assignments remain part of the badge evidence.

## Learning Objectives

By the end of this module, students should be able to:

- Build one complete primary-pathway Stata do-file or R script from raw inputs to final outputs.
- Identify whether the portfolio is submitted through the Stata pathway, R pathway, or optional dual pathway.
- Choose a permitted data option and document source files, versions, and any required redistribution terms.
- Import approved inputs without manually editing them.
- Clean and recode variables while preserving the meaning of source variables.
- Assess missingness, handle special missing codes when present, and document decisions.
- Demonstrate append and merge with checks in the capstone or, for inapplicable operations in Option B, the approved Module 07 evidence.
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
- Evidence of missing data, variable coding, identifiers, sample restrictions, and applicable transformations.
- References to Module 06/07 evidence for operations that do not apply, as specified in the assignment.
- For Option B, the approved proposal, source documentation, and permitted inputs or agreed retrieval instructions.

## Stata Skills In The Synthetic Worked Example

- Build one complete do-file.
- Use `log using` to create a workflow log.
- Import raw synthetic CSV files.
- Clean and recode variables.
- Handle special missing values.
- Append yearly person-level files.
- Merge region-level contextual data.
- Run QA checks with `count`, `summarize`, `tabulate`, `duplicates`, `isid`, and `assert`.
- Save final `.dta`, CSV, documentation, and QA outputs.

## R Skills In The Synthetic Worked Example

- Build one complete R script.
- Use relative paths with `file.path()`.
- Import raw synthetic CSV files.
- Clean and recode variables with tidyverse workflows.
- Handle special missing values.
- Append yearly person-level files with `bind_rows()`.
- Merge region-level contextual data with `merge()`.
- Run QA checks with `count()`, `duplicated()`, matched/unmatched record checks, `summarise()`, and `stopifnot()`.
- Save final CSV, RDS, Stata-compatible, documentation, and QA outputs.

## Common Pitfalls

- Treating the capstone as disconnected module exercises instead of one workflow.
- Submitting output files that cannot be regenerated.
- Hiding dropped cases instead of documenting sample restrictions.
- Merging data without checking unmatched keys.
- Appending files without checking row counts.
- Recoding variables without a codebook.
- Submitting a dataset without a workflow memo.
- Using unapproved data or data that are private, restricted, confidential, identifiable respondent data, student records, or not publicly distributable.
- Omitting a skill without identifying the approved module evidence.

## Estimated Time

6 to 8 hours. Scope an Option B proposal to a manageable preparation task within the semester cutoff.

## Files Used In The Synthetic Worked Examples

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2025.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

This is the final capstone. It provides the portfolio evidence for the microcredential badge competencies: reproducible workflow design, transparent data cleaning, data combination, missing-data handling, QA, documentation, and handoff readiness.
