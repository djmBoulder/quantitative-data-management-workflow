# 01 Project Workflows Assignment

## Purpose

This assignment asks you to create a clean, reproducible workflow from a raw synthetic survey file to a working data file and a simple inspection output. The goal is not to clean the full dataset yet. The goal is to prove that you can protect raw data and record your workflow in scripts.

## Data

Use:

`data/synthetic/synthetic_gss_like_person_2024.csv`

This file is synthetic. It is intentionally messy in small ways so you can practice inspecting data before cleaning it.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab conceptually so you can see how the same workflow is expressed in the other software.
3. Confirm that your pathway lab creates a log file.
4. Confirm that your pathway lab saves a working copy of the data.
5. Draft a short project README section using the prompts below.
6. Write a short reflection explaining why raw data should not be edited manually.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-01-stata-log.txt`
- `logs/module-01-r-log.txt`
- `data/working/synthetic_gss_like_person_2024_working.dta`
- `data/working/synthetic_gss_like_person_2024_working.rds`
- `data/output/module-01-stata-inspection.txt`
- `data/output/module-01-r-inspection.txt`

## README Draft Prompts

Write a short README draft of 200 to 300 words that answers:

- What is the purpose of this workflow?
- Which file is the raw data file?
- Which files are working data files?
- Which scripts produce the working files?
- Which logs or output summaries show that the scripts ran?
- What are two data issues you noticed during inspection?
- How does this workflow protect the raw data?

## Reflection Prompt

In 100 to 150 words, explain why a researcher should avoid editing raw CSV files by hand. Use at least one example from the synthetic data inspection.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your README draft.
- Your reflection.
- A screenshot or copied excerpt showing that at least one log file was created.

Do not submit generated working data files unless your instructor asks for them.
