# Capstone Data Management Portfolio Assignment

## Purpose

The capstone portfolio is the final badge evidence for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential. It asks you to demonstrate that you can take raw synthetic social science data inputs and produce a transparent, reproducible, analysis-ready dataset with documentation.

The capstone is not a statistical analysis assignment. It is a data management portfolio. Your goal is to show that another researcher could inspect your files, rerun your workflow, understand your data decisions, and trust the analysis-ready dataset you created.

Use synthetic data only. Do not use private, student, restricted, licensed, or confidential data.

## Data

Use the `synthetic_gss_like` teaching data:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/synthetic_gss_like_person_2025.csv`
- `data/synthetic/synthetic_gss_like_region_context.csv`
- `data/synthetic/data-dictionary.md`

You may also refer to the repeated-measures file from Module 06 if your instructor asks you to include reshaping evidence in the capstone. Otherwise, Module 06 assignment evidence may satisfy the reshaping competency.

## Pathway Options

Choose one pathway unless your instructor requires both:

- **Stata pathway:** submit one complete reproducible Stata do-file.
- **R pathway:** submit one complete reproducible R script.
- **Dual Stata/R pathway:** submit both a complete Stata do-file and a complete R script that implement the same major data decisions.

All pathways must use relative paths, preserve raw synthetic data, generate outputs from code, and document major decisions.

## Required Capstone Evidence

Submit a complete data management portfolio containing:

1. One reproducible Stata do-file or R script for your primary pathway, or both scripts for the dual pathway.
2. One analysis-ready dataset generated from raw/synthetic inputs.
3. A data dictionary or codebook.
4. A QA checklist or QA report.
5. A brief workflow memo explaining major data decisions.
6. Evidence that you handled missing data.
7. Evidence that you cleaned and recoded variables.
8. Evidence that you checked IDs, merges/appends, and row counts.
9. Evidence that you used relative paths and preserved raw data.

Generated outputs should normally be uploaded through the instructor-approved submission system rather than committed to GitHub. Do not commit generated files from `data/working/`, `data/output/`, or `logs/` unless your instructor explicitly changes that rule.

## Minimum Workflow Requirements

Your script should:

1. Run from the repository root or clearly document the required setup.
2. Use relative paths.
3. Create needed output folders if they do not already exist.
4. Start a workflow log or text output record.
5. Import the raw synthetic person-level files for 2024 and 2025.
6. Inspect names, types, values, and missingness before cleaning.
7. Standardize variable names where needed.
8. Append the person-level files.
9. Check row counts before and after append.
10. Check whether respondent-year IDs uniquely identify observations.
11. Clean and recode selected variables.
12. Convert special missing codes to system missing values.
13. Create an analytic sample flag before dropping or filtering observations.
14. Import the region-level contextual file.
15. Check the region merge key.
16. Merge or join region context onto the person-level data.
17. Check matched and unmatched merge/join cases.
18. Run QA checks for missingness, numeric ranges, valid categories, duplicates, and required variables.
19. Save an analysis-ready dataset.
20. Export a data dictionary or codebook.
21. Export a QA checklist or QA report.
22. Write a brief workflow memo.

## Recommended Portfolio Organization

Your submitted portfolio should be easy for an instructor or reviewer to navigate. Recommended files:

- `capstone_workflow.do` or `capstone_workflow.R`
- `analysis_ready_dataset.csv` or another instructor-approved generated dataset format
- `capstone_codebook.md` or `capstone_data_dictionary.csv`
- `capstone_qa_report.md` or `capstone_qa_checklist.md`
- `capstone_workflow_memo.md`
- optional: `capstone_log.txt`

Use clear filenames. Avoid names such as `final_final`, `new_data`, or `cleaned2`.

## Workflow Memo Prompt

Write a brief memo, usually 500 to 900 words, that answers:

- What raw synthetic files did you use?
- Which pathway did you complete: Stata, R, or dual Stata/R?
- What script created the analysis-ready dataset and documentation?
- What output files did your workflow create?
- What variables did you clean, recode, or derive?
- How did you handle special missing codes and system missing values?
- What analytic sample flag or sample restriction did you create?
- How did you check appends, merges/joins, IDs, and row counts?
- What QA checks passed, warned, or identified unresolved issues?
- What known limitations remain?
- What should a future collaborator do if the output needs to be changed?

## Submission Checklist

Before submitting, confirm that:

- [ ] I used only approved synthetic teaching data.
- [ ] My script runs from the repository root or clearly documents setup.
- [ ] My script uses relative paths.
- [ ] My script does not manually edit raw synthetic files.
- [ ] My analysis-ready dataset is generated by the script.
- [ ] My codebook or data dictionary explains source and derived variables.
- [ ] My QA evidence includes missing data, variable coding, IDs, append/merge checks, and row counts.
- [ ] My workflow memo explains major decisions in plain language.
- [ ] My generated outputs are submitted through the approved mechanism and are not committed to ignored repository folders unless instructed.

## Connection To Badge Competencies

This capstone provides summative evidence for the badge competencies in `syllabus/badge-competencies.md`, especially:

- project organization and reproducibility,
- importing and inspecting data,
- documentation and metadata,
- cleaning and recoding variables,
- missing data and analytic sample construction,
- combining datasets,
- quality assurance,
- reproducible outputs,
- and workflow memo/capstone portfolio readiness.

Module 06 reshaping evidence may come from the capstone or from the Module 06 assignment, depending on instructor requirements.

## Revision Policy

If the portfolio does not yet demonstrate badge-ready competency, your instructor may return it for revision. Revisions should include a short note explaining what changed. Common reasons for revision include scripts that do not run, missing QA evidence, unclear documentation, use of absolute paths, undocumented dropped cases, or missing append/merge diagnostics.
