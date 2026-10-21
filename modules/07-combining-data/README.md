# 07 Combining Datasets with Append and Merge

## Module Purpose

This module teaches students how to combine datasets safely using row stacking and merges matched on identifiers. Students learn the difference between appending compatible files and merging or merging columns from related files, with special attention to keys, duplicates, unmatched records, row counts, and diagnostics.

The module uses the synthetic `synthetic_gss_like` person-level files for 2024 and 2025, plus a region-level contextual file.

## Learning Objectives

By the end of this module, students should be able to:

- Distinguish stacking rows from merging columns.
- Explain the difference between append and merge operations.
- Identify one-to-one, many-to-one, and one-to-many relationships.
- Explain why many-to-many merges are dangerous.
- Identify unique identifiers and merge variables.
- Check whether IDs uniquely identify observations.
- Diagnose duplicate records before combining files.
- Identify unmatched records after a merge.
- Interpret merge indicators and merge diagnostics.
- Check row counts before and after combining files.
- Document data combination decisions.

## Work Produced In This Module

The list below describes the work you will produce. Use the [assignment submission instructions](assignment.md) for exactly what to upload to Canvas; some generated working files stay on your computer.

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if chosen for extra practice.
- An appended person-level working file.
- A person-level file with region context attached.
- A combination diagnostics report.
- A short memo explaining keys, duplicates, unmatched cases, and row-count checks.

## Stata Skills

- Use `append` to stack compatible rows.
- Use `merge 1:1`, `merge m:1`, and `merge 1:m`.
- Use `isid`, `duplicates report`, and `duplicates list`.
- Use `tabulate _merge`.
- Use `keepusing()`, `keep()`, `assert`, and `count`.

## R Skills

- Use `bind_rows()` to stack compatible rows.
- Use `merge()` with explicit identifiers and choices about which observations to retain.
- Use `count()`, `distinct()`, and `duplicated()` for key checks.
- Check identifier uniqueness and missingness before merging.
- Use `stopifnot()` for simple validation.

## Common Pitfalls

- Merging before checking whether keys are unique.
- Treating duplicate records as harmless.
- Ignoring unmatched records.
- Using a many-to-many merge when a one-to-one or many-to-one relationship was intended.
- Appending files that use different names or coding rules without checking compatibility.
- Looking only at the final row count without checking intermediate diagnostics.

## Estimated Time

4 to 5 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2025.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

The capstone may require students to combine multiple files. This module gives students a defensible process for stacking, merging, diagnosing duplicates, documenting unmatched cases, and proving that combined files are trustworthy.

For a capstone using instructor-approved publicly distributable student-selected data, this assignment can demonstrate append and/or merge when that operation does not apply to the approved project. Record each evidence location in the [proposal](../../assignments/capstone-data-proposal.md), explain why the operation does not apply, and cite the exact Canvas submission, filename, and script section in the final memo. Applicable operations must still appear with checks in the capstone. The synthetic capstone requires its append and merge. All students must complete this module assignment.
