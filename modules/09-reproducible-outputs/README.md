# 09 Reproducible Outputs and Handoff Files

## Module Purpose

This module teaches students how to produce clean, reproducible outputs from a data management workflow. Students practice creating an analysis-ready dataset, summary tables, a derived codebook, a workflow log, and a handoff memo that another researcher could understand without guessing what happened.

The module emphasizes that outputs are not manually edited final products. They are files that can be regenerated from documented Stata and R scripts.

## Learning Objectives

By the end of this module, students should be able to:

- Explain what counts as a reproducible output.
- Distinguish raw data, working data, and analysis-ready data.
- Save analysis-ready datasets in appropriate formats.
- Export clean CSV files for broad use.
- Export Stata `.dta` files when collaborators need Stata metadata.
- Produce simple descriptive tables.
- Produce a derived codebook that documents cleaned variables.
- Produce a workflow log.
- Document file provenance.
- Write a handoff memo for a collaborator, advisor, or future self.
- Avoid manual edits to final outputs.

## Required Student Outputs

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- An analysis-ready dataset output.
- A summary table output.
- A derived codebook or metadata file.
- A workflow log.
- A short handoff memo describing provenance, cleaning decisions, and unresolved limitations.

## Stata Skills

- Use `save` for analysis-ready `.dta` files.
- Use `export delimited` and `export excel`.
- Use `log using` for workflow logs.
- Use `describe`, `codebook`, `tabulate`, and `summarize`.
- Use `collapse` to create a descriptive table.
- Use `file write` to create a handoff memo or codebook.
- Use `notes` to record dataset and variable documentation.

## R Skills

- Use `readr::write_csv()`.
- Use `saveRDS()`.
- Use `haven::write_dta()` when a Stata handoff file is appropriate.
- Use `group_by()`, `summarise()`, and `count()`.
- Write a simple Markdown or text handoff memo.
- Keep outputs reproducible from scripts rather than unsaved workspace objects.

## Common Pitfalls

- Treating `data/output/` as a place for hand-edited files.
- Sending a cleaned dataset without a codebook or memo.
- Exporting outputs that cannot be regenerated from a script.
- Mixing temporary working files with handoff files.
- Using unclear names such as `final_final`.
- Forgetting to include sample restrictions and known limitations.
- Assuming a CSV alone preserves labels, notes, or value meanings.

## Estimated Time

3 to 4 hours.

## Files Used

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

## Relationship to the Final Capstone

This module is the bridge from weekly module work to the capstone portfolio. Students practice packaging cleaned data, documentation, scripts, logs, and output summaries as a coherent handoff that can be reviewed, rerun, and understood.
