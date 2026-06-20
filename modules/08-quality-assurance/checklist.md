# 08 Quality Assurance Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway or your instructor requires both.

## QA Concepts

- [ ] I can explain why QA is part of data management.
- [ ] I can distinguish fatal errors from warning-level issues.
- [ ] I can explain why no error message does not mean the data are correct.
- [ ] I can explain why unresolved issues should be documented.

## Workflow Setup

- [ ] I ran my primary-pathway lab script from the repository root.
- [ ] I used relative paths rather than absolute paths from my own computer.
- [ ] I did not manually edit the raw CSV files.
- [ ] I read the QA report after the script ran.

## Stata Lab

- [ ] Stata pathway or dual pathway: I ran `modules/08-quality-assurance/stata_lab.do`.
- [ ] My Stata workflow used `count`, `describe`, `codebook`, `summarize`, and `tabulate`.
- [ ] My Stata workflow used `assert` carefully.
- [ ] My Stata workflow used `confirm variable`.
- [ ] My Stata workflow used `isid` and `duplicates report`.
- [ ] My Stata workflow used `misstable summarize`.
- [ ] My Stata workflow used `log using` and `display`.

## R Lab

- [ ] R pathway or dual pathway: I ran `modules/08-quality-assurance/r_lab.R`.
- [ ] My R workflow used `nrow()`, `ncol()`, `names()`, and `summary()`.
- [ ] My R workflow used `count()`, `distinct()`, `duplicated()`, and `anyNA()`.
- [ ] My R workflow used `stopifnot()` for fatal checks.
- [ ] My R workflow wrote a simple QA report to a Markdown file.

## QA Memo

- [ ] I identified fatal checks.
- [ ] I identified warning-level issues.
- [ ] I described duplicate ID checks.
- [ ] I described range and category checks.
- [ ] I described missingness checks.
- [ ] I described merge validation.
- [ ] I documented unresolved issues.

## Ready for the Next Module

- [ ] I can find the QA logs.
- [ ] I can find the QA reports.
- [ ] I understand how QA reports support reproducible outputs and handoff files.
