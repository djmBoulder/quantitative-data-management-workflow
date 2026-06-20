# 10 Capstone Data Management Portfolio Assignment

## Purpose

The capstone portfolio asks you to demonstrate the full data management workflow taught in this microcredential. You will start from raw synthetic inputs and produce a transparent, reproducible, analysis-ready dataset with documentation.

Use synthetic data only. Do not use private, student, restricted, licensed, or confidential data.

## Data

Use the `synthetic_gss_like` teaching files:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2025.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

## Acceptable Pathways

Choose a pathway:

- Stata pathway: submit one complete do-file.
- R pathway: submit one complete R script.
- Dual Stata/R pathway: submit both a complete do-file and a complete R script that implement the same major data decisions.

The standard capstone requirement is one complete reproducible workflow in your primary pathway. Your instructor may require both pathways for a specific offering. The dual pathway is recommended if you want extra practice or expect to move between research teams using different software.

## Required Portfolio Files

Submit:

1. A reproducible Stata do-file or R script for your primary pathway, or both scripts for the dual pathway.
2. An analysis-ready dataset.
3. A data dictionary or codebook.
4. A QA checklist or QA report.
5. A brief workflow memo explaining major data decisions.
6. Evidence that you checked merges/appends, missing data, variable coding, and sample restrictions.

Generated outputs should normally be kept in ignored folders such as `data/output/` and `logs/`. Your instructor may ask you to upload generated files separately rather than commit them to Git.

## Minimum Workflow Requirements

Your script should:

1. Use relative paths.
2. Create needed output folders.
3. Start a workflow log or text record.
4. Import the raw synthetic person-level files.
5. Standardize variable names.
6. Append the two person-level files.
7. Check append row counts.
8. Clean and recode selected variables.
9. Convert special missing codes into system missing values.
10. Import the region-level contextual file.
11. Check that the region key is suitable for merging.
12. Merge region context onto person-level data.
13. Check matched and unmatched merge cases.
14. Create an analytic sample flag.
15. Check duplicate respondent-year keys.
16. Check missingness, ranges, and valid categories.
17. Save an analysis-ready dataset.
18. Write a codebook or data dictionary.
19. Write a QA report or checklist.
20. Write a workflow memo.

## Workflow Memo Prompt

Your memo should be short and direct. It should answer:

- What raw files did you use?
- What script created the outputs?
- What outputs did you create?
- What variables did you clean or derive?
- How did you handle missing values?
- How did you check the append?
- How did you check the merge?
- What sample restrictions did you apply?
- What known limitations remain?
- What should a future collaborator do if the outputs need to change?

## Submission Checklist

Before submitting, confirm that:

- Your script runs from the project root.
- Your script does not require manual edits to raw data.
- Your outputs can be regenerated from the script.
- Your analysis-ready dataset has clear variable names.
- Your codebook explains derived variables.
- Your QA report shows append, merge, missingness, coding, and sample checks.
- Your memo explains major data decisions in plain language.
- Your generated files are not committed from `data/output/`, `data/working/`, or `logs/` unless your instructor explicitly requests that.
