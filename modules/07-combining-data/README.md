# 07 Combining Datasets with Append, Joins, and Merges

## Module Purpose

This module teaches students how to combine datasets safely using row stacking and keyed joins. Students learn the difference between appending compatible files and merging or joining columns from related files, with special attention to keys, duplicates, unmatched records, row counts, and diagnostics.

The module uses the synthetic `synthetic_gss_like` person-level files for 2024 and 2025, plus a region-level contextual file.

## Learning Objectives

By the end of this module, students should be able to:

- Distinguish stacking rows from joining columns.
- Explain the difference between append and merge/join operations.
- Identify one-to-one, many-to-one, and one-to-many relationships.
- Explain why many-to-many merges are dangerous.
- Identify primary keys and foreign keys.
- Check whether IDs uniquely identify observations.
- Diagnose duplicate records before combining files.
- Identify unmatched records after a merge or join.
- Interpret merge indicators and join diagnostics.
- Check row counts before and after combining files.
- Document data combination decisions.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
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
- Use `left_join()`, `inner_join()`, `full_join()`, `anti_join()`, and `semi_join()`.
- Use `count()`, `distinct()`, and `duplicated()` for key checks.
- Use relationship checks where possible.
- Use `stopifnot()` for simple validation.

## Common Pitfalls

- Merging before checking whether keys are unique.
- Treating duplicate records as harmless.
- Ignoring unmatched records.
- Using a many-to-many join when a one-to-one or many-to-one relationship was intended.
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

The capstone may require students to combine multiple files. This module gives students a defensible process for stacking, joining, diagnosing duplicates, documenting unmatched cases, and proving that combined files are trustworthy.
