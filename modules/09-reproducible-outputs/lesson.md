# 09 Reproducible Outputs Lesson

## Why This Skill Matters

A data management workflow is not finished when the dataset looks clean on your screen. It is finished when another person can find the output files, understand what they contain, see how they were created, and rerun the workflow from the original source files.

In graduate research, that "other person" might be your advisor, a collaborator, a future teaching assistant, a journal reviewer, or your future self. Reproducible outputs make your work easier to trust because they connect the final files back to the scripts, data sources, and decisions that created them.

This module uses the synthetic `synthetic_gss_like` data to create a small handoff package:

- an analysis-ready dataset,
- a clean CSV export,
- a Stata `.dta` export when appropriate,
- a simple descriptive table,
- a derived codebook,
- a workflow log,
- and a handoff memo.

## Conceptual Overview

### Raw Data

Raw data are the original files you received or generated for the project. In this course, raw teaching files live in `data/synthetic/`. You should never manually edit raw data. If the raw file contains inconsistent capitalization, special missing codes, or awkward variable names, fix those problems in a script.

### Working Data

Working data are intermediate files created while cleaning, checking, and reshaping data. They are useful for rerunning a workflow, but they are not usually the files you hand to a collaborator as the final product.

Working files often live in `data/working/`, which is ignored by Git in this repository.

### Analysis-Ready Data

Analysis-ready data are cleaned enough for a specific analysis or handoff purpose. They should have:

- clear variable names,
- documented derived variables,
- missing values handled consistently,
- sample restrictions or flags documented,
- obvious file provenance,
- and validation checks run before export.

Analysis-ready does not mean perfect. It means the data are ready for a defined next step, and any unresolved issues are documented.

### Reproducible Outputs

A reproducible output is a file created by a script, not by manual editing. Common reproducible outputs include:

- cleaned datasets,
- descriptive tables,
- codebooks,
- QA reports,
- logs,
- handoff memos,
- figures,
- and sample construction tables.

The important test is simple: can you delete the generated output and recreate it by rerunning the script?

## What Belongs in a Handoff Package

A useful data handoff package usually includes more than one file.

| File type | Purpose |
| --- | --- |
| Analysis-ready dataset | The cleaned file prepared for analysis or review. |
| CSV export | A broadly readable data format. |
| Stata `.dta` export | A Stata-readable file that can preserve labels and metadata. |
| Summary table | A quick check of sample composition or key variables. |
| Derived codebook | A map of output variables and how they were created. |
| Workflow log | Evidence that the script ran and what it printed. |
| Handoff memo | A plain-language explanation of provenance, decisions, and limitations. |

## File Provenance

File provenance means the history of where a file came from and how it was produced. A handoff memo should answer questions such as:

- What source file did this output use?
- What script created this output?
- When was the workflow run?
- Which variables were cleaned or derived?
- Which observations were included or excluded?
- What known issues remain?

Provenance does not need to be fancy. A short Markdown memo is enough for many class projects.

## Core Commands And Functions

### Stata

Common Stata commands for reproducible outputs include:

- `log using` to capture script output,
- `describe` and `codebook` to inspect data structure,
- `tabulate` and `summarize` to produce descriptive summaries,
- `save` to write a `.dta` file,
- `export delimited` to write a CSV file,
- `export excel` to write an Excel file,
- `collapse` to create summary tables,
- `file write` to write a text or Markdown memo,
- and `notes` to attach dataset or variable notes.

### R

Common R functions for reproducible outputs include:

- `readr::write_csv()` to write a clean CSV,
- `saveRDS()` to save an R object,
- `haven::write_dta()` to write a Stata `.dta` file,
- `group_by()` and `summarise()` to create summary tables,
- `count()` to count categories,
- and `writeLines()` to write a text or Markdown memo.

Quarto and R Markdown are useful extensions for longer reports, but this module keeps the workflow simple: scripts create data files, tables, logs, and a short memo.

## Worked Example

The module labs follow the same basic workflow in Stata and R.

1. Import the synthetic person-level CSV file.
2. Clean variable names.
3. Convert selected variables to useful numeric or categorical forms.
4. Create an analytic sample flag.
5. Save an analysis-ready dataset.
6. Export a clean CSV file.
7. Export a simple descriptive table.
8. Write a derived codebook.
9. Write a handoff memo.
10. Rerun the full script from the repository root.

The handoff package is created in `data/output/` and `logs/`. Those folders are ignored by Git because generated files should be reproducible from scripts instead of committed as permanent repository content.

## Common Errors

### Manually Editing Final Outputs

Manual edits break reproducibility. If a value, label, or note needs to change, change the script and rerun the output.

### Saving Only One File

A dataset without documentation is hard to use. A codebook without the dataset is incomplete. A handoff package should include both data and context.

### Confusing Working Files With Handoff Files

Working files are for your process. Handoff files are for review, collaboration, or analysis. Use clear names so those roles are obvious.

### Assuming CSV Preserves Metadata

CSV files are portable, but they do not preserve Stata value labels, R factor levels, variable notes, or dataset notes. Pair CSV files with a codebook or memo.

### Forgetting To Rerun From The Top

Before submitting, restart Stata or R and rerun the full script. If the script depends on something sitting in memory from earlier work, it is not yet reproducible.

## Practice Task

In this module, you will create a handoff package from `synthetic_gss_like_person_2024.csv`. Your package should include an analysis-ready dataset, a summary table, a derived codebook, a log, and a memo explaining how the files were created.

The goal is not to produce a perfect research dataset. The goal is to show that your outputs are scripted, documented, and understandable to a future collaborator.

## Competency Checklist

You are ready to move on when you can:

- explain the difference between raw, working, and analysis-ready data,
- create output files from a script,
- export the same analysis-ready data in more than one useful format,
- create a descriptive table from cleaned variables,
- write a codebook for derived variables,
- write a handoff memo with file provenance,
- and rerun the full workflow without manual edits.
