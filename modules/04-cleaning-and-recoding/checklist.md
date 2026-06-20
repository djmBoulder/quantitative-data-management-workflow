# 04 Cleaning and Recoding Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway or your instructor requires both.

## Cleaning Concepts

- [ ] I can explain why cleaning and recoding are central data management tasks.
- [ ] I can distinguish numeric variables from string variables.
- [ ] I can identify common import problems that require cleaning.
- [ ] I can explain why source variables should be preserved.
- [ ] I can explain the difference between binary, ordinal, and categorical variables.

## Workflow Setup

- [ ] I ran my primary-pathway lab script from the repository root.
- [ ] I used relative paths rather than absolute paths from my own computer.
- [ ] I did not manually edit the raw CSV file.
- [ ] I checked raw values before recoding them.

## Stata Lab

- [ ] Stata pathway or dual pathway: I ran `modules/04-cleaning-and-recoding/stata_lab.do`.
- [ ] My Stata workflow used `generate` and `replace`.
- [ ] My Stata workflow used `egen` and `recode`.
- [ ] My Stata workflow used `destring`, `encode`, `decode`, and `tostring`.
- [ ] My Stata workflow used `lower()`, `upper()`, and `trim()`.
- [ ] My Stata workflow used labels and value labels.
- [ ] My Stata workflow used `tabulate` and `assert` to check recodes.

## R Lab

- [ ] R pathway or dual pathway: I ran `modules/04-cleaning-and-recoding/r_lab.R`.
- [ ] My R workflow used `mutate()`, `case_when()`, and `if_else()`.
- [ ] My R workflow used `as.numeric()` and `as.character()`.
- [ ] My R workflow used `factor()` and `recode()`.
- [ ] My R workflow used `str_trim()`, `str_to_lower()`, and `str_to_upper()`.
- [ ] My R workflow used `count()`, `tabyl()`, or `table()` to inspect recodes.
- [ ] My R workflow used `stopifnot()` or similar validation checks.

## Cleaning Memo

- [ ] I identified the original variables preserved by the labs.
- [ ] I identified the cleaned and derived variables created by the labs.
- [ ] I explained type conversions.
- [ ] I explained capitalization and whitespace standardization.
- [ ] I explained special missing-code decisions.
- [ ] I described the binary, ordinal, and categorical variables.
- [ ] I named at least one decision that would need more discussion before real analysis.

## Ready for the Next Module

- [ ] I can find the cleaned working files created by the labs.
- [ ] I can find the cleaning decision logs created by the labs.
- [ ] I understand that later modules will extend these cleaning decisions to missing data, reshaping, combining, and validation.
