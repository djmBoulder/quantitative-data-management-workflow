# 10 Capstone Data Management Portfolio Lesson

## Why This Skill Matters

The capstone asks you to show that you can manage data from start to finish. In real research, data management is not just a list of commands. It is a chain of decisions: where files came from, how variables were cleaned, how missing values were handled, how datasets were combined, what checks were run, and what final files are ready for analysis.

For this microcredential, your capstone portfolio is evidence that you can create a transparent and reproducible workflow using course-provided synthetic data or instructor-approved, publicly distributable student-selected data.

## Choosing And Scoping Your Data

Option A uses the course-provided synthetic data and requires its append and merge. Option B lets you prepare publicly distributable data relevant to your own work after the instructor approves the [data proposal](../../assignments/capstone-data-proposal.md). The [full assignment](../../assignments/capstone-data-management-portfolio.md) defines eligibility, common workflow requirements, and submission details.

For Option B, explain the intended analysis, unit of observation, useful cleaning or recoding, missingness assessment, and sample decisions. Document the source versions and redistribution terms. Your input files must be available to the instructor through permitted copies or agreed retrieval instructions. A clear source and a bounded task make the workflow easier to reproduce and assess.

When an operation does not apply, use the approved Module 06 evidence for reshape or Module 07 evidence for append and/or merge. Explain why and identify the exact evidence in your memo. The instructor still assesses each competency. Any operation that applies to your project must be performed and checked in the capstone. All Module 00–09 assignments remain required.

## What Reproducible Means In This Course

Reproducible means that another person can:

- open your repository or project folder,
- run one primary Stata do-file or one primary R script from the project root,
- recreate your analysis-ready dataset and documentation,
- see the checks you ran,
- understand your major data decisions,
- and confirm that raw data were not manually edited.

Reproducible does not mean your workflow is complicated. A clear script with relative paths, comments, logs, checks, and documented outputs is enough.

## Capstone Portfolio Expectations

Your final portfolio should include:

1. a reproducible Stata do-file or R script,
2. an analysis-ready dataset,
3. a data dictionary or codebook,
4. a QA checklist or QA report,
5. a brief workflow memo,
6. evidence of missing data, variable coding, sample restrictions, and applicable transformations, with approved Module 06/07 references for operations that do not apply,
7. a log or text record,
8. and, for Option B, the approved proposal, source documentation, and permitted inputs or agreed retrieval instructions.

You may complete the capstone through the Stata pathway, the R pathway, or the dual Stata/R pathway. You only need to submit one primary reproducible workflow. The course provides both labs so students can see equivalent ways to complete the same workflow, and the dual pathway is recommended for students who want extra practice moving between research teams that use different software.

## Synthetic Worked Example: Workflow Steps

The guided labs illustrate Option A. For Option B, apply the common requirements in the full assignment to your approved files and evidence plan. The synthetic workflow does the following:

1. Set up relative paths and output folders.
2. Start a log or text output record.
3. Import the raw synthetic person-level files for two years.
4. Standardize variable names.
5. Append the person-level files and verify row counts.
6. Clean and recode selected variables.
7. Convert special missing codes to system missing values.
8. Create an analytic sample flag.
9. Import the region-level contextual file.
10. Check the region merge key.
11. Merge region context onto the person-level data.
12. Check unmatched and matched rows.
13. Run QA checks for duplicates, missingness, ranges, categories, and sample restrictions.
14. Save the analysis-ready dataset.
15. Export a codebook or data dictionary.
16. Export a QA report.
17. Write a workflow memo.

## Stata Worked Example

The synthetic Stata lab uses one do-file. Its commands include:

- `version`, `clear all`, and `set more off`,
- project-relative locals for input and output paths,
- `log using` for a workflow log,
- `import delimited` for raw synthetic CSV files,
- `append` for yearly person-level files,
- `generate`, `replace`, `destring`, and string functions for cleaning,
- `merge m:1` for region context,
- `count`, `tabulate`, `summarize`, `duplicates`, `isid`, and `assert` for QA,
- `save` and `export delimited` for final outputs,
- and `file write` for documentation outputs.

## R Worked Example

The synthetic R lab uses one script. Its functions include:

- relative paths with `file.path()`,
- output folder creation with `dir.create()`,
- CSV imports from `data/synthetic/`,
- `janitor::clean_names()` for standardizing variable names,
- `bind_rows()` for appending person-level files,
- `mutate()`, `case_when()`, and string functions for cleaning,
- `merge()` for region context,
- `count()`, `duplicated()`, matched/unmatched record checks, `summarise()`, and `stopifnot()` for QA,
- `write_csv()`, `saveRDS()`, or `write_dta()` for final outputs,
- and `writeLines()` for documentation outputs.

## Required Documentation

Your portfolio documentation should be short but complete.

### Codebook Or Data Dictionary

The codebook should describe the variables in the analysis-ready dataset. It should identify source variables, derived variables, recoding decisions, and missing-value rules.

### QA Checklist Or QA Report

For either option, show checks for required variables, observation counts, identifiers, duplicates, missingness, valid values, and sample rules. Document applicable reshape, append, and merge checks, and reference approved module evidence for operations that do not apply. In the synthetic example, the QA file shows:

- row counts before and after append,
- duplicate respondent-year keys,
- missing values after recoding,
- variable ranges,
- valid categories,
- merge key uniqueness,
- matched and unmatched merge rows,
- and final sample restrictions.

### Workflow Memo

The workflow memo should explain:

- what approved source files and versions were used, including redistribution terms for Option B,
- what script produced the outputs,
- what final files were created,
- what major cleaning decisions were made,
- how missing data were handled,
- where reshape, append, and merge competencies were demonstrated, with exact module references and reasons for any operation that does not apply,
- what sample restrictions were applied,
- and what limitations remain.

## How To Organize Final Submitted Files

Use clear names. A good capstone submission might include:

- `capstone_workflow.R` or `capstone_workflow.do`,
- `capstone_analysis_ready.csv`,
- `capstone_codebook.csv` or `capstone_codebook.md`,
- `capstone_qa_report.md`,
- `capstone_workflow_memo.md`,
- and a workflow log.

Keep student-selected source files in your local project folder or ignored `data/raw/` folder. Keep generated files in ignored folders such as `data/output/` and `logs/`, and upload the required portfolio files to Canvas. Keep student-selected data out of the course repositories. Canvas holds submissions, feedback, and grades. A passing capstone grade records completion after the required module evidence is complete; the instructor then notifies the micro registrar to issue the badge. Two capstone revisions are allowed after the initial submission, before the course cutoff. See the [course policies](../../syllabus/course-policies.md).

## Connection To Badge Competencies

The capstone connects to the badge competencies by asking you to demonstrate:

- reproducible project workflow,
- safe handling of raw data,
- import and inspection,
- documentation and metadata,
- cleaning and recoding,
- missing-data handling,
- data combination,
- QA and validation,
- and analysis-ready output handoff.

## Common Mistakes

- Writing a script that only runs because objects are already open in memory.
- Editing the raw CSV files by hand.
- Appending files without checking that row counts add up.
- Merging files without checking unmatched keys.
- Dropping observations without a sample flag or memo.
- Saving a final dataset without a codebook.
- Reporting that checks were done without showing evidence.

## Practice Task

Use the synthetic capstone lab in your primary pathway as a model. Then build your final portfolio with the assigned synthetic files or your approved Option B data and evidence plan. If you are completing the optional dual pathway, build both scripts from the same documented data decisions. Your final submission should make it easy for a reviewer to run your script and understand your outputs.

## Competency Checklist

You are ready to submit when your script runs from the project root, recreates your outputs, and produces documentation that explains how the analysis-ready dataset was made.
