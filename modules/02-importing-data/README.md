# 02 Importing and Inspecting Data

## Module Purpose

This module teaches students how to bring external data files into Stata and R without changing the original files. Students practice importing CSV and Excel versions of the synthetic `synthetic_gss_like` survey data, inspecting what the software did during import, standardizing variable names, and saving clean working copies.

The emphasis is on careful first contact with data. Before cleaning, recoding, merging, or analyzing a file, researchers need to know what kind of file they have, how it was imported, and what problems are visible right away.

The Excel file used in this module is generated reproducibly from the same synthetic 2024 person-level data as the CSV file.

## Learning Objectives

By the end of this module, students should be able to:

- Distinguish CSV, Excel, Stata `.dta`, and fixed-width/plain-text files.
- Explain why file type matters for import decisions.
- Import CSV and Excel files in Stata.
- Read CSV and Excel files in R.
- Inspect variable names, storage types, labels, and missingness after import.
- Identify common import problems such as messy headers, unexpected types, special missing codes, and inconsistent categories.
- Standardize variable names using a clear naming convention.
- Save clean working copies without editing raw files manually.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- A short import inspection memo.
- A list of variable-name changes made during the lab.
- A note describing at least three import problems visible in the raw synthetic data.
- Confirmation that the primary-pathway working copy was saved, with dual-pathway outputs included only when applicable.

## Stata Skills

- Use `import delimited` to import CSV files.
- Use `import excel` to import Excel files.
- Use `describe`, `codebook`, `summarize`, `tabulate`, `misstable summarize`, and `list` to inspect imports.
- Use `rename` to standardize variable names.
- Use `label data` and `notes` to document the working file.
- Save imported data as a `.dta` working copy.

## R Skills

- Use `read.csv()` to read CSV files.
- Use `readxl::read_excel()` to read Excel files.
- Use `names()`, `str()`, `summary()`, `head()`, `table()`, and missingness counts to inspect imports.
- Use a small helper function to standardize variable names.
- Save imported data as `.rds` and `.csv` working copies.

## Common Pitfalls

- Opening a raw CSV or Excel file and manually fixing it before writing code.
- Assuming the file extension tells the full story of the data structure.
- Importing Excel headers incorrectly.
- Letting software silently change variable names without documenting it.
- Treating numeric-looking strings as ready for analysis.
- Forgetting that CSV and Excel files do not preserve Stata-style variable labels.
- Saving imported working files over raw files.

## Estimated Time

3 to 4 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2024.xlsx`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

The capstone begins with a transparent import record. Students must be able to explain where their data came from, how each source file entered the project, what problems were visible after import, and what working copies were created. This module builds that first layer of the capstone workflow.
