# 03 Data Documentation Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway or your instructor requires both.

## Documentation Concepts

- [ ] I can explain why documentation is part of reproducible research.
- [ ] I can explain the difference between a data dictionary, a codebook, and a README.
- [ ] I can explain why variable names are not enough documentation.
- [ ] I can identify known limitations that should be documented.

## Workflow Setup

- [ ] I ran my primary-pathway lab script from the repository root.
- [ ] I used relative paths rather than absolute paths from my own computer.
- [ ] I did not manually edit the raw CSV file.
- [ ] I checked the course data dictionary before documenting variables.

## Stata Lab

- [ ] Stata pathway or dual pathway: I ran `modules/03-data-documentation/stata_lab.do`.
- [ ] My Stata workflow used `describe` and `codebook`.
- [ ] My Stata workflow used `label data` and `label variable`.
- [ ] My Stata workflow used `label define` and `label values`.
- [ ] My Stata workflow used `labelbook` and `notes`.
- [ ] My Stata workflow used `order`, `compress`, and `save`.
- [ ] My Stata workflow exported a simple data dictionary.

## R Lab

- [ ] R pathway or dual pathway: I ran `modules/03-data-documentation/r_lab.R`.
- [ ] My R workflow used `names()`, `glimpse()`, `summary()`, and `skimr::skim()`.
- [ ] My R workflow used `rename()` or equivalent name standardization.
- [ ] My R workflow used `mutate()`, `case_when()`, and `factor()`.
- [ ] My R workflow demonstrated a `haven` labelled workflow where appropriate.
- [ ] My R workflow wrote a simple data dictionary as CSV or Markdown.
- [ ] My R workflow saved documented working copies.

## Documentation Memo

- [ ] I explained why documentation supports collaboration and future analysis.
- [ ] I described the variable naming convention used in this course.
- [ ] I named the variables documented in the labs.
- [ ] I explained the derived variables and their source variables.
- [ ] I documented the coding decisions for derived variables.
- [ ] I explained the inclusion/exclusion rule in `analytic_sample_demo`.
- [ ] I identified known limitations that another researcher should know.

## Ready for the Next Module

- [ ] I can find the documented working files created by the labs.
- [ ] I can find the data dictionary files created by the labs.
- [ ] I understand that later modules will do more cleaning, recoding, and missing-data decisions.
