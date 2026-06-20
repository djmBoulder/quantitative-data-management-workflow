# 05 Missing Data Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway or your instructor requires both.

## Missing-Data Concepts

- [ ] I can explain why missing-data decisions matter.
- [ ] I can distinguish system missing values from special missing-value codes.
- [ ] I can explain user-defined missing codes.
- [ ] I can explain how Stata missing values differ from R `NA` values.
- [ ] I can explain why silent case deletion is a problem.

## Workflow Setup

- [ ] I ran my primary-pathway lab script from the repository root.
- [ ] I used relative paths rather than absolute paths from my own computer.
- [ ] I did not manually edit the raw CSV file.
- [ ] I checked raw values before recoding them as missing.

## Stata Lab

- [ ] Stata pathway or dual pathway: I ran `modules/05-missing-data/stata_lab.do`.
- [ ] My Stata workflow used `missing()` and `mvdecode`.
- [ ] My Stata workflow used `misstable summarize`.
- [ ] My Stata workflow used `tabulate, missing`, `summarize`, `count`, and `codebook`.
- [ ] My Stata workflow used `egen rowmiss()`.
- [ ] My Stata workflow generated complete-case and analytic-sample flags.
- [ ] My Stata workflow used `assert`.
- [ ] My Stata workflow used `preserve` and `restore` where appropriate.

## R Lab

- [ ] R pathway or dual pathway: I ran `modules/05-missing-data/r_lab.R`.
- [ ] My R workflow used `is.na()` and `na_if()`.
- [ ] My R workflow used `across()`, `mutate()`, and `case_when()`.
- [ ] My R workflow used `summarise()` and `count()`.
- [ ] My R workflow used `rowSums(is.na())`.
- [ ] My R workflow used `complete.cases()`.
- [ ] My R workflow used `filter()` to inspect the analytic sample without silently deleting cases.

## Analytic Sample Memo

- [ ] I identified the special codes recoded to missing.
- [ ] I identified impossible or out-of-range values.
- [ ] I explained the variables in `complete_case_core`.
- [ ] I explained the inclusion and exclusion criteria for `analytic_sample_flag`.
- [ ] I reported sample size changes across steps.
- [ ] I explained how the workflow avoids silent case deletion.
- [ ] I named at least one decision that would need more discussion before real analysis.

## Ready for the Next Module

- [ ] I can find the working files with missing-data flags.
- [ ] I can find the sample construction tables.
- [ ] I understand how missing-data decisions affect reshaping, merging, validation, and final outputs.
