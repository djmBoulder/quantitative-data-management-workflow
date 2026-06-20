# 01 Project Workflows and Reproducibility Lesson

## Why This Skill Matters

Most data problems are workflow problems before they are statistical problems. If a researcher cannot tell which file is raw, which file is cleaned, which script created an output, or which decisions were made along the way, then the analysis becomes hard to trust.

Reproducible data work means that another person can follow your steps and recreate your results. In graduate social science research, that other person might be your future self, an advisor, a collaborator, a journal reviewer, or a class instructor.

A good workflow helps you answer basic questions:

- Where did the data come from?
- What file should never be edited?
- What code changed the data?
- Where are intermediate files stored?
- What output was created from which script?
- Can the whole process be rerun from the beginning?

This module focuses on the habits that make later cleaning, merging, recoding, and analysis easier.

## Conceptual Overview

### Raw Data

Raw data are the original files as they entered the project. In this course, the raw file for the lab is:

`data/synthetic/synthetic_gss_like_person_2024.csv`

Raw data should be treated as read-only. Do not fix spelling, remove rows, rename columns, or change missing-value codes directly in the raw file. Even when a mistake seems obvious, make the change in code so the decision is visible and reversible.

### Working Data

Working data are files created by your scripts. They may include imported, cleaned, recoded, reshaped, or merged data. Working files are useful, but they should be reproducible. If you delete a working file, your scripts should be able to recreate it from the raw data.

In this module, labs save working copies in:

`data/working/`

### Output Data

Output files are products of the workflow. These might include tables, figures, codebooks, validation reports, or final handoff files. They should be clearly named and connected to the script that created them.

In this module, simple inspection summaries are saved in:

`data/output/`

### Scripts as Records of Decisions

A script is more than a way to run commands. It is a record of what you decided to do. Good scripts include comments that explain why steps are taken.

For example:

```stata
* Import the raw CSV instead of editing it by hand.
import delimited using "data/synthetic/synthetic_gss_like_person_2024.csv", clear varnames(1)
```

```r
# Import the raw CSV instead of editing it by hand.
survey_raw <- read.csv("data/synthetic/synthetic_gss_like_person_2024.csv", check.names = FALSE)
```

The comments matter because future readers need to understand the workflow, not just the software syntax.

## Recommended Project Folder Structure

Use separate folders for separate kinds of files:

```text
project-root/
  code/
    r/
    stata/
  data/
    raw/
    synthetic/
    working/
    output/
  logs/
  resources/
  modules/
```

For this course repository:

- `data/synthetic/` contains safe teaching data.
- `data/working/` is for files created during cleaning and wrangling.
- `data/output/` is for generated summaries, tables, and handoff products.
- `logs/` is for records of script runs.
- `code/r/` and `code/stata/` hold shared scripts.
- `modules/` holds module-specific lessons, labs, assignments, and checklists.

## Relative File Paths

A relative path starts from the project folder instead of from the top of one person’s computer.

Use this:

```text
data/synthetic/synthetic_gss_like_person_2024.csv
```

Avoid this:

```text
/Users/someone/Desktop/my-class/data/synthetic_gss_like_person_2024.csv
```

Relative paths make your work portable. If the project folder moves to another computer, the code can still run as long as the folder structure stays the same.

## Stata Do-Files and Log Files

In Stata, a do-file stores the commands that create your workflow. A log file stores the output Stata printed while the do-file ran.

Use do-files for:

- importing data,
- inspecting variables,
- saving working files,
- documenting decisions with comments,
- rerunning the workflow from the top.

Use log files for:

- preserving output from `describe`, `codebook`, `summarize`, and `tabulate`,
- checking whether the script ran without errors,
- documenting what happened during a specific run.

The lab starts a log with:

```stata
* Start a plain-text log so the workflow output can be reviewed later.
log using "logs/module-01-stata-log.txt", text replace
```

## R Scripts and RStudio Projects

In R, a script stores the commands that create your workflow. An RStudio project helps R start in the correct project folder, which makes relative paths easier to use.

Use R scripts for:

- importing data,
- inspecting variables,
- saving working files,
- documenting decisions with comments,
- rerunning the workflow from the top.

Avoid relying on `.Rhistory` or `.RData` as your workflow record. These files can contain old commands or objects that are not part of your final process. A clean script should be the main record.

The lab creates a simple text log with:

```r
# Create a text log that records key output from this script.
sink("logs/module-01-r-log.txt", split = TRUE)
```

## README Files

A project README explains how to understand and run the project. It does not need to be long, but it should answer practical questions:

- What is this project about?
- What data are used?
- Which files are raw, working, and output files?
- Which script should be run first?
- What outputs should the script create?
- Are there known data issues?

In this module, the assignment asks you to draft a short README for the workflow.

## Data Dictionaries

A data dictionary explains what variables mean. It should include variable names, descriptions, expected types, and important coding notes.

For this course dataset, begin with:

`data/synthetic/data-dictionary.md`

The data dictionary tells you that `synthetic_gss_like_person_2024.csv` includes survey-style variables such as `respondent_id`, `age`, `gender`, `education`, `employment_status`, `household_income`, and `survey_weight`. It also warns that the raw CSV has teaching problems such as inconsistent capitalization, special missing codes, and string/numeric typing issues.

## A Clean Workflow from Raw Data to Output

For this module, the workflow is intentionally simple:

1. Confirm the project folders exist.
2. Start a log.
3. Import the raw CSV from `data/synthetic/`.
4. Inspect variable names, storage types, and a few values.
5. Save a working copy in `data/working/`.
6. Save a basic inspection summary in `data/output/`.
7. Close the log.
8. Confirm that the raw CSV was not edited.

This workflow does not fully clean the data yet. Later modules will handle naming, labels, recoding, missing values, reshaping, merging, and validation. The goal here is to build the habit of recording every step before the data change.

## Practice Task

Complete the lab for your primary pathway:

- Stata pathway: `stata_lab.do`
- R pathway: `r_lab.R`

Optional dual-pathway practice: complete both labs if your instructor requires it or if you want extra practice moving between research teams that use different software.

After running your pathway lab, check that the matching files were created:

- `logs/module-01-stata-log.txt`
- `logs/module-01-r-log.txt`
- `data/working/synthetic_gss_like_person_2024_working.dta`
- `data/working/synthetic_gss_like_person_2024_working.rds`
- `data/output/module-01-stata-inspection.txt`
- `data/output/module-01-r-inspection.txt`

You only need the files for your primary pathway unless you are completing the optional dual pathway.

## Common Errors

- Editing the CSV directly instead of using a script.
- Running code from the wrong folder.
- Using an absolute file path copied from your own computer.
- Forgetting to create `logs/`, `data/working/`, or `data/output/`.
- Saving a working file over the raw file.
- Closing Stata or R without saving the script.
- Forgetting to check that the log actually contains output.

## Competency Checklist

By the end of this module, you should be able to:

- Explain the difference between raw, working, and output data.
- Use a relative path to import a data file.
- Run a Stata do-file and save a log.
- Run an R script and save a text log.
- Save working data without changing the raw CSV.
- Write a short README that explains the workflow.
- Use a data dictionary to understand variables before cleaning them.
