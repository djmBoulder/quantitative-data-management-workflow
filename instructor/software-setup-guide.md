# Software Setup Guide

Instructor-facing setup guide for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential.

## Core Assumptions

The course supports Stata, R, and dual Stata/R pathways. Students need access to the software for their selected pathway. All students should understand the parallel structure conceptually even if they submit graded work in one primary pathway.

All course examples use synthetic teaching data. No private, restricted, licensed, confidential, or student data should be used for setup checks.

## Stata Access Assumptions

Students in the Stata pathway need access to a working Stata installation or an approved remote/lab environment.

Before launch, instructors should confirm:

- which Stata versions are supported,
- whether students have licenses through CU Boulder,
- whether Stata is available in campus labs or remote desktops,
- whether students can run `.do` files,
- whether Stata can write to the repository folder,
- and whether Stata can import Excel files for Module 02.

## If Students Do Not Have Local Stata

Options:

- Use an approved campus computer lab.
- Use a remote desktop or virtual lab if available.
- Allow the student to complete the R pathway instead.
- Pair Stata demonstrations with conceptual review rather than graded Stata submission.
- For dual-pathway offerings, provide extra setup time and a fallback plan.

Do not require students to solve Stata access problems by moving data into personal cloud folders that could create data management or privacy issues.

## R And RStudio/Positron Setup

Students in the R pathway need:

- R installed,
- RStudio, Positron, or another editor that can run `.R` scripts,
- write access to the repository folder,
- internet access during setup for package installation,
- and the ability to run scripts from the repository root.

Instructors should demonstrate:

- opening the repository folder as a project,
- running an entire script,
- checking `getwd()`,
- reading a file from `data/synthetic/`,
- writing a file to `data/output/`,
- and restarting R before rerunning a script.

## Required R Packages

The current course materials may use:

- `dplyr`
- `tidyr`
- `stringr`
- `readr`
- `readxl`
- `janitor`
- `skimr`
- `haven`
- `openxlsx` for regenerating the synthetic Excel teaching file

Some labs call functions with `package::function()` and may not load every package with `library()`. Instructors should still make sure the packages are installed before launch.

## Installing R Packages

Students can install packages from the R console:

```r
install.packages(c(
  "dplyr",
  "tidyr",
  "stringr",
  "readr",
  "readxl",
  "janitor",
  "skimr",
  "haven",
  "openxlsx"
))
```

If package installation fails:

- confirm internet access,
- confirm the student is using a current R version,
- check whether a campus-managed computer blocks package installation,
- try installing one package at a time,
- and document the issue if the student needs a temporary workaround.

## Folder Organization

Students should understand the main folders:

- `modules/`: lessons, labs, assignments, checklists, and solution notes.
- `data/synthetic/`: approved synthetic teaching data.
- `data/working/`: generated intermediate files, ignored by Git.
- `data/output/`: generated reports, tables, and handoff files, ignored by Git.
- `logs/`: generated log files, ignored by Git.
- `resources/`: shared student references.
- `instructor/`: instructor-facing implementation materials.
- `rubrics/`: assessment rubrics.
- `syllabus/`: course-level review and assessment documents.

## Relative Paths

Course scripts should use paths relative to the repository root. The first path below is a tracked synthetic input; the remaining paths are examples of generated working files, outputs, or logs:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/working/synthetic_gss_like_person_2024_cleaned.dta`
- `data/output/module-08-r-qa-report.md`
- `logs/module-01-stata-log.txt`

Avoid absolute paths such as:

- `/Users/student/Desktop/...`
- `C:\Users\student\Downloads\...`

Relative paths make the workflow easier to rerun on another computer.

## Logs And Output Folders

Stata labs commonly write log files to `logs/`. R labs may write text logs, Markdown reports, CSV outputs, RDS files, or Stata-compatible files.

Before launch:

- confirm that scripts create needed folders,
- confirm that logs are closed properly,
- confirm that output files are generated from code,
- confirm that generated files are ignored by Git,
- and decide how students submit generated files for review.

## Minimal Setup Check

For Stata:

1. Open Stata.
2. Change to the repository root.
3. Run `modules/00-orientation/stata_lab.do`.
4. Confirm that the synthetic CSV is found.
5. Confirm that `logs/module-00-stata-log.txt` and `data/output/module-00-stata-setup-check.txt` are created.

For R:

1. Open the repository folder in RStudio, Positron, or another editor.
2. Run `modules/00-orientation/r_lab.R` from the repository root.
3. Confirm that the synthetic CSV is found.
4. Confirm that `logs/module-00-r-log.txt` and `data/output/module-00-r-setup-check.txt` are created.

Generated setup files should not be committed unless the instructor explicitly changes the repository policy.
