# 04 Cleaning and Recoding Assignment

## Purpose

This assignment asks you to clean and recode selected variables from the synthetic survey data while preserving the original source variables. You will create derived variables, convert types, apply labels or factor levels, validate the results, and document your decisions.

The goal is not to make every variable perfect. The goal is to practice transparent, defensible cleaning.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the raw CSV manually.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab conceptually so you can see how the same cleaning workflow is expressed in the other software.
3. Confirm that the original source variables are still present.
4. Review the cleaned and derived variables created by your pathway lab.
5. Review the cleaning decision logs.
6. Write a short cleaning memo using the prompts below.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-04-stata-log.txt`
- `logs/module-04-r-log.txt`
- `data/working/synthetic_gss_like_person_2024_cleaned.dta`
- `data/working/synthetic_gss_like_person_2024_cleaned.rds`
- `data/working/synthetic_gss_like_person_2024_cleaned.csv`
- `data/output/module-04-stata-cleaning-decisions.txt`
- `data/output/module-04-r-cleaning-decisions.txt`

## Cleaning Memo

Write 400 to 600 words that answers:

- Why should cleaning and recoding be done in scripts rather than by editing raw files?
- Which original variables did your pathway lab preserve?
- Which new cleaned or derived variables did your pathway lab create?
- What type conversions did your pathway lab perform?
- How did your pathway lab standardize capitalization and whitespace?
- How were special missing codes handled?
- What binary, ordinal, and categorical variables were created?
- What validation checks helped confirm the recodes?
- What decisions would need more discussion before a real analysis?

## Debugging Tips

- If a script cannot find the raw data file, check that you are running it from the repository root.
- If a type conversion creates many missing values, inspect the source text before converting.
- If a recode leaves unexpected missing values, tabulate the raw variable.
- If Stata or R reports that a variable does not exist, inspect the imported variable names.
- If a validation check fails, read the check and inspect the values that caused the failure.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your cleaning memo.
- One cleaning decision log.
- A screenshot or copied excerpt showing at least one recode check.

Do not submit generated working data files unless your instructor asks for them.
