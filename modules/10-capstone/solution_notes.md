# 10 Capstone Solution Notes

Instructor-facing notes. Do not copy this content into student-facing files.

## Module Intent

The capstone should assess whether students can assemble the microcredential skills into one coherent workflow. The goal is not one exact output row count. The goal is a reproducible, documented, defensible process.

## Expected Portfolio Components

Students should submit:

- one complete primary-pathway Stata do-file or R script,
- or both scripts if the student is completing a required or optional dual pathway,
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
- clear imports from synthetic files,
- append row-count checks,
- merge key and unmatched-case checks,
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
- a local `clean_names()` helper,
- `bind_rows()` for appending person files,
- `mutate()` and `case_when()` for cleaning,
- `left_join()` with relationship checking for region context,
- `stopifnot()`, `count()`, and `anti_join()` for QA evidence,
- `write_csv()`, `saveRDS()`, and `write_dta()` for final data,
- and `writeLines()` for codebook, QA report, and memo outputs.

## Alignment Notes

This module should align with:

- `syllabus/assessment-plan.md`,
- `syllabus/badge-competencies.md`,
- `assignments/capstone-data-management-portfolio.md`,
- and `rubrics/capstone-rubric.md`.

Those files may need instructor completion before launch. The module currently defines the operational capstone expectations that those course-level documents should reference.
