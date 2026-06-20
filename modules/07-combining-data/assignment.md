# 07 Combining Data Assignment

## Purpose

This assignment asks you to combine synthetic survey files safely. You will append person-level files across years, diagnose duplicate keys, attach region-level context, and report unmatched cases.

The goal is not just to produce a combined file. The goal is to prove that the combined file makes sense.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2025.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the raw CSV files manually.

## Tasks

1. Run the lab for your primary pathway: `stata_lab.do` for the Stata pathway or `r_lab.R` for the R pathway.
2. Review the parallel lab conceptually so you can see how the same data-combination workflow is expressed in the other software.
3. Append the 2024 and 2025 person-level files.
4. Diagnose duplicate `respondent_id` plus `year` keys.
5. Demonstrate a one-to-one person-year join.
6. Join region context onto the person file.
7. Identify unmatched person-region keys and context-only region keys.
8. Write a data combination memo using the prompts below.

Complete both labs only if you are following the dual pathway or your instructor requires parallel submissions.

## Expected Files

After completing your pathway lab, you should have the matching Stata or R files:

- `logs/module-07-stata-log.txt`
- `logs/module-07-r-log.txt`
- `data/working/synthetic_gss_like_person_appended.dta`
- `data/working/synthetic_gss_like_person_appended.rds`
- `data/working/synthetic_gss_like_person_appended.csv`
- `data/working/synthetic_gss_like_person_region_merged.dta`
- `data/working/synthetic_gss_like_person_region_merged.rds`
- `data/working/synthetic_gss_like_person_region_merged.csv`
- `data/output/module-07-stata-combine-diagnostics.txt`
- `data/output/module-07-r-combine-diagnostics.txt`

## Data Combination Memo

Write 400 to 600 words that answers:

- What is the difference between stacking rows and joining columns?
- Why is append the right operation for the 2024 and 2025 person files?
- What key should identify person-year records?
- What duplicate-key issue did your pathway lab diagnose?
- What is the primary key in the region context file?
- What is the foreign key in the person file?
- Which region keys were unmatched?
- How did row counts change after append, inner join, left join, or full join diagnostics?
- Why are many-to-many joins dangerous?
- What combining decisions should be documented for another researcher?

## Debugging Tips

- If append fails, compare variable names and types across files.
- If a merge or join fails, check whether the key uniquely identifies records where it should.
- If row counts increase unexpectedly, check for duplicate keys on the context side.
- If row counts decrease unexpectedly, check whether you used an inner join or kept only matched records.
- If region matches look wrong, inspect cleaned and raw region values.

## Submission Checklist

Submit:

- Stata pathway: your completed `stata_lab.do`.
- R pathway: your completed `r_lab.R`.
- Dual pathway: both completed scripts.
- Your data combination memo.
- One combine diagnostics report.
- A screenshot or copied excerpt showing duplicate-key or unmatched-record diagnostics.

Do not submit generated working data files unless your instructor asks for them.
