# 05 Missing Data Assignment

## Purpose

This assignment asks you to identify, recode, document, and report missing data before constructing a transparent analytic sample. You will create complete-case indicators, analytic sample flags, and a sample construction table.

The goal is not to decide the perfect sample for every research question. The goal is to make missing-data and inclusion decisions visible.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the raw CSV manually.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab conceptually so you can see how the same missing-data workflow is expressed in the other software.
3. Review the variable-level missingness summaries.
4. Review the row-wise missingness counts.
5. Review the complete-case and analytic-sample flags.
6. Review the sample construction table.
7. Write a short analytic sample memo using the prompts below.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-05-stata-log.txt`
- `logs/module-05-r-log.txt`
- `data/working/synthetic_gss_like_person_2024_missing_sample.dta`
- `data/working/synthetic_gss_like_person_2024_missing_sample.rds`
- `data/working/synthetic_gss_like_person_2024_missing_sample.csv`
- `data/output/module-05-stata-sample-construction.csv`
- `data/output/module-05-r-sample-construction.csv`
- `data/output/module-05-stata-missing-summary.txt`
- `data/output/module-05-r-missing-summary.txt`

## Analytic Sample Memo

Write 400 to 600 words that answers:

- Why do missing-data decisions matter?
- What is the difference between system missing values and special missing-value codes?
- How do Stata missing values differ from R `NA` values?
- Which special codes did your pathway lab recode to missing?
- Which impossible or out-of-range values did your pathway lab identify?
- Which variables were included in the complete-case indicator?
- What inclusion and exclusion criteria define `analytic_sample_flag`?
- How did the sample size change across steps?
- How does your pathway lab avoid silent case deletion?
- What decisions would need more discussion before a real analysis?

## Debugging Tips

- If a script cannot find the raw data file, check that you are running it from the repository root.
- If R gives unexpected results with missing values, check whether you used `is.na()` rather than `== NA`.
- If Stata counts look wrong, check whether special codes were recoded with `mvdecode`.
- If row-wise missingness looks too high or too low, inspect the variables included in the row-wise count.
- If a validation check fails, inspect the out-of-range values before changing the rule.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your analytic sample memo.
- One sample construction table.
- A screenshot or copied excerpt showing variable-level or row-wise missingness.

Do not submit generated working data files unless your instructor asks for them.
