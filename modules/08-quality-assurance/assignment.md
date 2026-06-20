# 08 Quality Assurance Assignment

## Purpose

This assignment asks you to build QA checks into a synthetic data workflow. You will run row-count checks, variable checks, range checks, category checks, duplicate checks, missingness checks, and merge validation checks. You will also classify issues as fatal errors, warnings, or unresolved concerns.

The goal is to catch problems before analysis and document what remains unresolved.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the raw CSV files manually.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab conceptually so you can see how the same QA workflow is expressed in the other software.
3. Review the row-count and variable-count checks.
4. Review range, category, duplicate, missingness, and logical consistency warnings.
5. Review the merge validation checks.
6. Write a short QA memo using the prompts below.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-08-stata-log.txt`
- `logs/module-08-r-log.txt`
- `data/output/module-08-stata-qa-report.md`
- `data/output/module-08-r-qa-report.md`

## QA Memo

Write 400 to 600 words that answers:

- Why is QA part of data management rather than an optional final step?
- Which checks in the lab are fatal checks?
- Which checks produce warning-level issues?
- What duplicate ID issue appears in the synthetic data?
- What range or category issues appear in the synthetic data?
- What missingness issues appear in the synthetic data?
- What did the merge validation show?
- What unresolved issues should be documented before analysis?
- How does your pathway lab distinguish warnings from fatal errors?

## Debugging Tips

- If a required variable is missing, stop and check whether the file imported correctly.
- If an assertion fails, decide whether it should be a fatal check or a warning-level check.
- If merge row counts change unexpectedly, check key uniqueness and unmatched records.
- If no error appears, still read the QA report for warnings.
- If warning counts differ slightly across software, inspect how missing strings were imported.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your QA memo.
- One QA report.
- A screenshot or copied excerpt showing at least one warning-level issue.

Do not submit generated working data files unless your instructor asks for them.
