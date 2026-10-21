# 10 Capstone Solution Notes

Instructor-facing notes. Included for faculty review; use the module assignment and rubric for student submission requirements. Do not copy solution text into student-facing lessons.

## Module Intent

The capstone should assess whether students can assemble the microcredential skills into one coherent workflow. The goal is not one exact output row count. The goal is a reproducible, documented, defensible process.

## Reviewing Student-Selected Data Proposals

Use the [proposal template](../../assignments/capstone-data-proposal.md) and [data policy](../../syllabus/course-policies.md#capstone-data-options). Record approval in Canvas before the student begins the capstone with Option B data. Confirm documented public redistribution and educational-use permission, absence of prohibited data, manageable scope, meaningful preparation tasks, and access to the exact inputs for rerunning the work. An unclear permission statement is grounds to request another source or the synthetic option.

Record a separate decision for reshape, append, and merge. If an operation does not apply to the approved project, identify Module 06 or the appropriate portion of Module 07 as its evidence. At final review, inspect the cited script, diagnostics, and explanation; a reference alone is not competency. Applicable operations must appear with checks in the capstone. All module assignments remain required, and inadequate evidence must be corrected before badge completion.

Both options use the same rubric. Do not impose the synthetic survey's years, variable names, identifiers, or expected sample on student-selected data. Review source-specific decisions and checks. Changes to approved inputs, scope, or evidence locations should be confirmed in Canvas. Proposal feedback precedes capstone submission; the existing two-revision limit applies to the portfolio.

## Expected Portfolio Components

Students should submit:

- one complete primary-pathway Stata do-file or R script,
- or both scripts if the student is completing the optional dual pathway,
- an analysis-ready dataset,
- a data dictionary or codebook,
- a QA checklist or QA report,
- a workflow memo,
- and evidence of append checks, merge checks, missing-data checks, variable coding checks, and sample restriction checks.

## Acceptable Variation

Students may make different defensible choices about:

- which variables to include in the final analysis-ready dataset,
- whether the final output is CSV, `.dta`, RDS, or more than one format,
- which special missing codes are documented as exclusions,
- whether unmatched region rows are excluded from the final sample or retained with clear flags,
- and how the QA report is formatted.

Require that choices are scripted and documented.

## Suggested Review Dimensions

Review the portfolio for:

- reproducibility from a clean session,
- protection of raw data,
- relative paths,
- clear imports from the assigned synthetic files or approved public inputs,
- reshape, append, and merge checks in the capstone or the approved Module 06/07 evidence,
- missing-data recoding and documentation,
- derived variable coding,
- duplicate key checks,
- explicit sample restrictions,
- readable code comments,
- coherent codebook,
- useful QA evidence,
- and a workflow memo that explains decisions in plain language.

## Common Portfolio Issues

Watch for:

- scripts that rely on objects already open in memory,
- undocumented manual edits to generated files,
- sample restrictions applied only through filtering with no flag or memo,
- appends or merges performed without diagnostics,
- codebooks that describe raw variables but not derived variables,
- QA reports that mention checks without showing evidence,
- and output files named in ways that do not match the memo.

## Stata Lab Notes

The Stata capstone lab is a complete example workflow using:

- `import delimited` with `stringcols(_all)` for stable raw imports,
- `append` for person-level files,
- generated derived variables for cleaning and missing-data handling,
- `merge m:1` for region context,
- `assert`, `count`, `summarize`, `tabulate`, `duplicates`, and `isid` for QA,
- `save` and `export delimited` for final data,
- and `file write` for codebook, QA report, and memo outputs.

The Stata lab should be run in Stata before classroom use.

## R Lab Notes

The R capstone lab is a complete example workflow using:

- `read.csv()` for raw imports,
- `janitor::clean_names()`,
- `bind_rows()` for appending person files,
- `mutate()` and `case_when()` for cleaning,
- `merge()` with identifier checks for region context,
- `stopifnot()`, `count()`, and matched/unmatched record checks for QA evidence,
- `write_csv()`, `saveRDS()`, and `write_dta()` for final data,
- and `writeLines()` for codebook, QA report, and memo outputs.

## Alignment Notes

This module should align with:

- `syllabus/assessment-plan.md`,
- `syllabus/badge-competencies.md`,
- `assignments/capstone-data-management-portfolio.md`,
- and `rubrics/capstone-rubric.md`.

These files and the [course policies](../../syllabus/course-policies.md) define the settled requirements. Review required module evidence and the capstone in Canvas. Allow up to two capstone revisions after the initial submission before the semester cutoff. A passing capstone grade records completion; then notify the micro registrar to issue the badge. No peer review is required, and dual-pathway work is optional.

## Duplicate-Record Review In The Synthetic Worked Examples

The labs set aside every record in an unresolved duplicate respondent-year group. Verify that the memo documents this restriction. A first-record rule is not evidence that conflicting responses were resolved. Raw inputs remain unchanged.
