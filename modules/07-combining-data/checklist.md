# 07 Combining Data Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway.

## Combining Concepts

- [ ] I can explain the difference between stacking rows and merging columns.
- [ ] I can explain append versus merge.
- [ ] I can identify one-to-one, many-to-one, and one-to-many relationships.
- [ ] I can explain why many-to-many merges are dangerous.
- [ ] I can identify unique identifiers and merge variables.

## Workflow Setup

- [ ] I ran my primary-pathway lab script from the repository root.
- [ ] I used relative paths rather than absolute paths from my own computer.
- [ ] I did not manually edit the raw CSV files.
- [ ] I checked row counts before and after combining files.

## Stata Lab

- [ ] Stata pathway or dual pathway: I ran `modules/07-combining-data/stata_lab.do`.
- [ ] My Stata workflow used `append`.
- [ ] My Stata workflow used `merge 1:1`, `merge m:1`, and `merge 1:m`.
- [ ] My Stata workflow used `isid`.
- [ ] My Stata workflow used `duplicates report` and `duplicates list`.
- [ ] My Stata workflow used `tabulate _merge`.
- [ ] My Stata workflow used `keepusing()`, `keep()`, `assert`, and `count`.

## R Lab

- [ ] R pathway or dual pathway: I ran `modules/07-combining-data/r_lab.R`.
- [ ] My R workflow used `bind_rows()`.
- [ ] My R workflow compared retaining all person observations, matched observations only, and observations from both files.
- [ ] My R workflow used source-file markers to identify matched and unmatched observations.
- [ ] My R workflow used `count()`, `distinct()`, and `duplicated()`.
- [ ] My R workflow checked identifier uniqueness and missingness before merging.
- [ ] My R workflow used `stopifnot()` for validation.

## Data Combination Memo

- [ ] I explained why append was used for the person files.
- [ ] I identified the person-year key.
- [ ] I described duplicate-key diagnostics.
- [ ] I identified the region context unique identifier.
- [ ] I identified the person-file merge variable.
- [ ] I described unmatched person and context records.
- [ ] I reported row-count checks.
- [ ] I explained why many-to-many merges should be avoided.

## Ready for the Next Module

- [ ] I can find the appended working files.
- [ ] I can find the region-merged working files.
- [ ] I can find the combine diagnostics reports.
- [ ] I understand how combination diagnostics support later validation and handoff files.
