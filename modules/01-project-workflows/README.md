# 01 Project Workflows and Reproducibility

## Module Purpose

This module teaches students how to set up a reproducible data project before they begin cleaning or analyzing data. Students learn why social science data work should be organized as a transparent workflow rather than a series of disconnected clicks, manual edits, and unsaved commands.

The module uses the synthetic `synthetic_gss_like` survey data to model a simple path from raw CSV file to working data file and basic output.

## Learning Objectives

By the end of this module, students should be able to:

- Explain why reproducible data workflows matter for graduate social science research.
- Describe the difference between raw data, working data, and output data.
- Organize a project folder with separate locations for code, raw data, working data, outputs, logs, and documentation.
- Use relative file paths instead of computer-specific absolute paths.
- Use Stata do-files and log files as records of data decisions.
- Use R scripts and RStudio projects as records of data decisions.
- Create a short project README and connect it to a data dictionary.
- Explain why raw data should never be edited manually.
- Run a simple workflow that imports raw data, inspects it, logs key information, and saves a working copy.

## Required Student Outputs

Students will submit:

- A completed lab script for the student's primary pathway: `stata_lab.do` for Stata-pathway students or `r_lab.R` for R-pathway students.
- Optional dual-pathway practice: completed scripts for both Stata and R, if required by the instructor or chosen for extra practice.
- A pathway-appropriate log file.
- A working data copy saved from the primary software environment.
- A short project README draft that describes the workflow.
- A brief reflection explaining how the workflow protects raw data.

## Stata Skills

- Use a do-file to record workflow steps.
- Start and close a log file.
- Use relative paths from the project root.
- Create folders when needed.
- Import a CSV file with `import delimited`.
- Inspect data with `describe`, `codebook`, `summarize`, `tabulate`, and `list`.
- Save a working `.dta` file without changing the raw CSV.

## R Skills

- Use an R script to record workflow steps.
- Use an RStudio project or project root as the working location.
- Use relative paths from the project root.
- Create folders when needed.
- Import a CSV file with `read.csv()`.
- Inspect data with `names()`, `str()`, `summary()`, `head()`, and `table()`.
- Save a working `.rds` file without changing the raw CSV.
- Write a simple text log from a script.

## Common Pitfalls

- Editing raw CSV files by hand in Excel or another spreadsheet program.
- Saving code, data, and outputs in the same folder.
- Using absolute paths that only work on one computer.
- Running commands interactively but not saving them in a script.
- Forgetting to save logs or output records.
- Confusing working files with final handoff files.
- Committing generated data from `data/working/`, `data/output/`, or `logs/`.

## Estimated Time

3 to 4 hours.

## Files in This Module

- `lesson.md`: student-facing explanation of reproducible project workflows.
- `stata_lab.do`: Stata lab that imports, inspects, logs, and saves a working copy.
- `r_lab.R`: R lab that performs the parallel workflow.
- `assignment.md`: student-facing assignment instructions.
- `solution_notes.md`: instructor-facing guidance and expected outputs.
- `checklist.md`: competency checklist for students.

## Relationship to the Final Capstone

The final capstone requires students to submit a data management portfolio that another person can understand and rerun. This module provides the foundation for that portfolio: a clear folder structure, protected raw data, documented scripts, logs, working files, and plain-language project documentation.
