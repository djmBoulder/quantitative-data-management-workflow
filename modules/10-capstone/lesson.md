# 10 Capstone Data Management Portfolio Lesson

## Why This Skill Matters

The capstone asks you to show that you can manage data from start to finish. In real research, data management is not just a list of commands. It is a chain of decisions: where files came from, how variables were cleaned, how missing values were handled, how datasets were combined, what checks were run, and what final files are ready for analysis.

For this microcredential, your capstone portfolio is evidence that you can create a transparent and reproducible workflow using synthetic social science data.

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
6. and evidence that you checked appends, merges, missing data, variable coding, and sample restrictions.

You may complete the capstone through the Stata pathway, the R pathway, or the dual Stata/R pathway. You only need to submit one primary reproducible workflow unless your instructor asks for parallel submissions. The course provides both labs so students can see equivalent ways to complete the same workflow, and the dual pathway is recommended for students who want extra practice moving between research teams that use different software.

## Minimum Required Workflow Steps

Your script should do the following:

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

## Acceptable Stata Pathway

A complete Stata capstone workflow should use one do-file. It should include:

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

## Acceptable R Pathway

A complete R capstone workflow should use one script. It should include:

- relative paths with `file.path()`,
- output folder creation with `dir.create()`,
- CSV imports from `data/synthetic/`,
- a helper for cleaning variable names,
- `bind_rows()` for appending person-level files,
- `mutate()`, `case_when()`, and string functions for cleaning,
- `left_join()` for region context,
- `count()`, `duplicated()`, `anti_join()`, `summarise()`, and `stopifnot()` for QA,
- `write_csv()`, `saveRDS()`, or `write_dta()` for final outputs,
- and `writeLines()` for documentation outputs.

## Required Documentation

Your portfolio documentation should be short but complete.

### Codebook Or Data Dictionary

The codebook should describe the variables in the analysis-ready dataset. It should identify source variables, derived variables, recoding decisions, and missing-value rules.

### QA Checklist Or QA Report

The QA file should show that you checked:

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

- what raw files were used,
- what script produced the outputs,
- what final files were created,
- what major cleaning decisions were made,
- how missing data were handled,
- how appends and merges were checked,
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

Generated files should normally live in ignored folders such as `data/output/` and `logs/`. Your instructor may ask you to upload generated files to the learning management system rather than commit them to Git.

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

Use the capstone lab in your primary pathway as a model. Then adapt it into your own final portfolio workflow. If you are completing the optional dual pathway, build both scripts from the same documented data decisions. Your final submission should make it easy for a reviewer to run your script and understand your outputs.

## Competency Checklist

You are ready to submit when your script runs from the project root, recreates your outputs, and produces documentation that explains how the analysis-ready dataset was made.
