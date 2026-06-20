# 03 Data Documentation Assignment

## Purpose

This assignment asks you to document a synthetic survey dataset so another researcher can understand what the data contain, where selected variables came from, how selected variables are coded, and what decisions were made during preparation.

The goal is not to finish cleaning the full dataset. The goal is to practice documenting data clearly and transparently.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the raw CSV manually.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab conceptually so you can see how the same documentation workflow is expressed in the other software.
3. Review the documented working file created by your pathway lab.
4. Review the data dictionary output created by your pathway lab.
5. Write a documentation memo using the prompts below.
6. Identify one additional variable that should be documented in a future module.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-03-stata-log.txt`
- `logs/module-03-r-log.txt`
- `data/working/synthetic_gss_like_person_2024_documented.dta`
- `data/working/synthetic_gss_like_person_2024_documented.rds`
- `data/working/synthetic_gss_like_person_2024_documented.csv`
- `data/output/module-03-stata-data-dictionary.csv`
- `data/output/module-03-r-data-dictionary.csv`
- `data/output/module-03-r-data-dictionary.md`

## Documentation Memo

Write 400 to 600 words that answers:

- Why is documentation part of reproducible research?
- What is the difference between a data dictionary, a codebook, and a README?
- What variable naming convention does this course use?
- What variables did the labs label or document?
- What derived variables did the labs create?
- What coding decisions were made for the derived variables?
- What inclusion or exclusion rule is documented in `analytic_sample_demo`?
- What known limitations should another researcher know before using this data?
- How does documentation support collaboration or future analysis?

## Debugging Tips

- If a script cannot find the raw data file, check that you are running it from the repository root.
- If the R lab stops because a package is missing, read the error message and tell your instructor which package was unavailable.
- If Stata says a variable was not found, inspect the imported variable names with `describe`.
- If labels do not appear, check whether you labeled the variable itself or only wrote a comment in the script.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your documentation memo.
- One exported data dictionary file.
- A screenshot or copied excerpt showing that at least one documentation log was created.

Do not submit generated working data files unless your instructor asks for them.
