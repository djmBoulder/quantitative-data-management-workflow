# 09 Reproducible Outputs Solution Notes

Instructor-facing notes. Do not copy this content into student-facing files.

## Module Intent

This module should help students understand that data management outputs are a package, not a single cleaned file. The main competency is the ability to regenerate a documented handoff package from a script.

## Expected Student Outputs

Students should produce:

- a scripted analysis-ready dataset,
- at least one portable data export such as CSV,
- at least one software-specific or metadata-friendly export when appropriate,
- a simple descriptive table,
- a derived codebook or metadata file,
- a workflow log,
- and a handoff memo.

The exact row count may vary if students make defensible sample construction choices. Their memo should explain those choices.

## Expected Workflow Features

Strong submissions should:

- use only `data/synthetic/synthetic_gss_like_person_2024.csv`,
- use relative paths,
- create needed output folders in the script,
- preserve the raw source file,
- clean and derive variables in code,
- create an explicit analytic sample flag,
- document sample restrictions,
- validate key output assumptions before saving,
- and make clear which outputs are generated and should not be edited manually.

## Instructor Review Points

Check that students do not:

- commit generated output files from `data/output/`, `data/working/`, or `logs/`,
- include restricted or real respondent data,
- silently delete rows without documenting why,
- manually edit CSV, Excel, or `.dta` outputs after export,
- submit a dataset without a memo or codebook,
- or rely on an object already loaded in memory.

## Stata Lab Notes

The Stata lab demonstrates:

- `log using` for a workflow log,
- `describe`, `codebook`, `tabulate`, and `summarize` for review,
- scripted cleaning of special missing values and strings,
- `notes` for dataset and variable-level documentation,
- `save` for `.dta`,
- `export delimited` for CSV,
- `export excel` for an Excel handoff file,
- `collapse` for a region summary table,
- and `file write` for Markdown codebook and memo files.

The Stata lab should be tested in Stata before classroom use.

## R Lab Notes

The R lab demonstrates:

- `readr::write_csv()` for CSV exports,
- `saveRDS()` for an R-native handoff object,
- `haven::write_dta()` for a Stata-compatible export,
- `group_by()` and `summarise()` for a region summary table,
- a scripted derived codebook,
- and `writeLines()` for a Markdown handoff memo.

The R lab intentionally avoids Quarto or R Markdown as a requirement so the output workflow remains beginner-friendly. Those tools can be introduced as optional extensions.

## Grading Emphasis

Prioritize reproducibility and documentation over the exact cleaning choices. A student who explains and scripts a reasonable sample restriction is meeting the module goal, even if their output differs from the model lab.

Suggested review dimensions:

- Script runs from a clean session.
- Raw data are not manually edited.
- Output files are named clearly.
- Output files match the memo.
- Codebook describes derived variables.
- Sample restriction is explicit.
- Known limitations are documented.
