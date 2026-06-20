# 02 Importing and Inspecting Data Assignment

## Purpose

This assignment asks you to import the same synthetic survey data from CSV and Excel files, inspect what happened during import, standardize variable names, and save clean working copies. The goal is to practice careful first contact with data before cleaning or analysis.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2024.xlsx`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the raw CSV or Excel file manually.

The CSV and Excel files contain the same synthetic 2024 person-level records. The Excel file exists so you can practice import decisions for `.xlsx` workbooks.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab conceptually so you can see how the same import workflow is expressed in the other software.
3. Compare what you see after importing the CSV and Excel files.
4. Standardize variable names using the lab workflow.
5. Save working copies from your primary pathway.
6. Write a short import inspection memo.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-02-stata-log.txt`
- `logs/module-02-r-log.txt`
- `data/working/synthetic_gss_like_person_2024_imported.dta`
- `data/working/synthetic_gss_like_person_2024_imported.rds`
- `data/working/synthetic_gss_like_person_2024_imported.csv`
- `data/output/module-02-stata-import-inspection.txt`
- `data/output/module-02-r-import-inspection.txt`

## Import Inspection Memo

Write 300 to 500 words that answers:

- What are the differences between CSV, Excel, Stata `.dta`, and fixed-width/plain-text files?
- Which raw files did you import or read in this module?
- What did you notice about variable names before standardizing them?
- What variable-name changes did the lab make?
- What did you notice about variable types after import?
- What missing-value or special-code issues did you notice?
- What are at least three import problems that later modules should clean or document?
- How did you protect the raw files?

## Debugging Tips

- If a script cannot find the data file, check that you are running it from the repository root.
- If the Excel portion of the R lab fails, check that the `readxl` package is installed.
- If Stata cannot import the Excel file, confirm that the `.xlsx` file exists in `data/synthetic/`.
- If variable names look different from what you expected, inspect them before renaming.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your import inspection memo.
- A screenshot or copied excerpt showing that at least one import log was created.

Do not submit generated working data files unless your instructor asks for them.
