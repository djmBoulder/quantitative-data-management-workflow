# 06 Reshaping Data Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway or your instructor requires both.

## Reshaping Concepts

- [ ] I can explain wide data.
- [ ] I can explain long data.
- [ ] I can explain why the same information can be stored in different shapes.
- [ ] I can identify repeated measures, panel-style data, and person-year data.
- [ ] I can identify variable stubs, ID variables, and time variables.

## Workflow Setup

- [ ] I ran my primary-pathway lab script from the repository root.
- [ ] I used relative paths rather than absolute paths from my own computer.
- [ ] I did not manually edit the raw wide CSV file.
- [ ] I checked row counts and duplicate IDs before reshaping.
- [ ] I treated missing-value recoding as a separate decision from reshaping.

## Stata Lab

- [ ] Stata pathway or dual pathway: I ran `modules/06-reshaping-data/stata_lab.do`.
- [ ] My Stata workflow used `reshape long`.
- [ ] My Stata workflow used `reshape wide`.
- [ ] My Stata workflow used `isid` and `duplicates report`.
- [ ] My Stata workflow used `sort`, `bysort`, `order`, `list`, `count`, and `assert`.
- [ ] My Stata workflow saved long and wide-again working files.

## R Lab

- [ ] R pathway or dual pathway: I ran `modules/06-reshaping-data/r_lab.R`.
- [ ] My R workflow used `pivot_longer()`.
- [ ] My R workflow used `pivot_wider()`.
- [ ] My R workflow used `names_to`, `values_to`, and `id_cols`.
- [ ] My R workflow used `arrange()`, `count()`, `distinct()`, `duplicated()`, and `stopifnot()`.
- [ ] My R workflow saved long and wide-again working files.

## Restructuring Memo

- [ ] I identified the unit of observation before reshaping.
- [ ] I identified the unit of observation after reshaping long.
- [ ] I identified the ID variable.
- [ ] I identified the time variable.
- [ ] I identified the reshaped variable stubs.
- [ ] I explained when wide format is useful.
- [ ] I explained when long format is useful.
- [ ] I reported row counts and validation checks.
- [ ] I explained whether special missing codes were carried through or recoded.

## Ready for the Next Module

- [ ] I can find the long working files created by the labs.
- [ ] I can find the wide-again working files created by the labs.
- [ ] I understand how reshaped data can support later combining, validation, and output modules.
- [ ] I can describe how reshape validation evidence would fit into a capstone QA report or workflow memo.
