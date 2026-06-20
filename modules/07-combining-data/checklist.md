# 07 Combining Data Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway or your instructor requires both.

## Combining Concepts

- [ ] I can explain the difference between stacking rows and joining columns.
- [ ] I can explain append versus merge or join.
- [ ] I can identify one-to-one, many-to-one, and one-to-many relationships.
- [ ] I can explain why many-to-many merges are dangerous.
- [ ] I can identify primary keys and foreign keys.

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
- [ ] My R workflow used `left_join()`, `inner_join()`, and `full_join()`.
- [ ] My R workflow used `anti_join()` and `semi_join()`.
- [ ] My R workflow used `count()`, `distinct()`, and `duplicated()`.
- [ ] My R workflow used relationship checks where possible.
- [ ] My R workflow used `stopifnot()` for validation.

## Data Combination Memo

- [ ] I explained why append was used for the person files.
- [ ] I identified the person-year key.
- [ ] I described duplicate-key diagnostics.
- [ ] I identified the region context primary key.
- [ ] I identified the person-file foreign key.
- [ ] I described unmatched person and context records.
- [ ] I reported row-count checks.
- [ ] I explained why many-to-many joins should be avoided.

## Ready for the Next Module

- [ ] I can find the appended working files.
- [ ] I can find the region-merged working files.
- [ ] I can find the combine diagnostics reports.
- [ ] I understand how combination diagnostics support later validation and handoff files.
