# 06 Reshaping Data Assignment

## Purpose

This assignment asks you to reshape a synthetic repeated-measures dataset from wide to long format and back to wide format. You will identify ID variables, time variables, variable stubs, row counts, and validation checks.

The goal is to understand how restructuring changes the unit of observation without changing the underlying information.

This assignment also gives you practice producing the kind of row-count and key-check evidence that belongs in the final capstone portfolio.

## Data

Use:

- `data/synthetic/synthetic_gss_like_repeated_measures_wide.csv`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the raw CSV manually.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab for the other software so you can see how the same reshape logic is expressed differently.
3. Inspect the original wide file.
4. Reshape the data from wide to long.
5. Validate the long person-year file.
6. Reshape the long file back to wide.
7. Confirm that special missing codes were carried through the reshape rather than silently changed.
8. Write a short restructuring memo using the prompts below.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-06-stata-log.txt`
- `logs/module-06-r-log.txt`
- `data/working/synthetic_gss_like_repeated_measures_long.dta`
- `data/working/synthetic_gss_like_repeated_measures_long.rds`
- `data/working/synthetic_gss_like_repeated_measures_long.csv`
- `data/working/synthetic_gss_like_repeated_measures_wide_again.dta`
- `data/working/synthetic_gss_like_repeated_measures_wide_again.rds`
- `data/working/synthetic_gss_like_repeated_measures_wide_again.csv`
- `data/output/module-06-stata-reshape-validation.txt`
- `data/output/module-06-r-reshape-validation.txt`

## Restructuring Memo

Write 400 to 600 words that answers:

- What is the unit of observation in the original wide file?
- What is the unit of observation in the long file?
- Which variable is the ID variable?
- Which variable becomes the time variable?
- Which variable stubs are reshaped?
- When would wide format be useful?
- When would long format be useful?
- What row counts did you expect before and after reshaping?
- What checks confirmed that the reshape worked?
- Were special missing codes cleaned, carried through unchanged, or handled some other way?
- What restructuring decisions should be documented for another researcher?
- How could this validation evidence support a final capstone QA report?

## Debugging Tips

- If reshaping fails, check whether the ID variable uniquely identifies rows in the wide file.
- If the long file has the wrong number of rows, check the number of repeated years.
- If year values look wrong, inspect the suffixes in the original variable names.
- If values disappear, check whether your variable stubs matched the column names.
- If reshaping back to wide creates extra rows, check the `respondent_id` plus `year` key.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your restructuring memo.
- One reshape validation report.
- A screenshot or copied excerpt showing row-count or key validation.

Do not submit generated working data files unless your instructor asks for them.
