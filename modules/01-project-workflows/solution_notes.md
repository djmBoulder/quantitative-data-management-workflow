# 01 Project Workflows Solution Notes

## Instructor Purpose

This module establishes the workflow expectations students should carry through the rest of the microcredential. The main outcome is not advanced Stata or R syntax. The main outcome is that students understand reproducibility as a practical habit: protect raw data, record decisions in scripts, use relative paths, and check that outputs can be recreated.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-01-stata-log.txt`, if Stata is available.
- An R log at `logs/module-01-r-log.txt`.
- A Stata working file at `data/working/synthetic_gss_like_person_2024_working.dta`, if Stata is available.
- An R working file at `data/working/synthetic_gss_like_person_2024_working.rds`.
- A Stata inspection file at `data/output/module-01-stata-inspection.txt`, if Stata is available.
- An R inspection file at `data/output/module-01-r-inspection.txt`.
- A short README draft.
- A short reflection about protecting raw data.

Generated files in `data/working/`, `data/output/`, and `logs/` should generally remain uncommitted.

## Expected Workflow Concepts

Strong submissions should explain that:

- Raw data are original source files and should not be manually edited.
- Working data are created by scripts and can be regenerated.
- Output files are products of the workflow, such as logs, summaries, tables, and handoff files.
- Relative paths make projects portable across computers.
- Scripts and comments record decisions more transparently than interactive clicking.
- Logs help document what happened during a run.
- README files and data dictionaries help collaborators understand the project.

## Expected Data Observations

Students may notice any of the following in `synthetic_gss_like_person_2024.csv`:

- Raw CSV headers contain spaces, punctuation, and inconsistent naming styles.
- Gender, region, education, and other categorical variables include inconsistent capitalization.
- Region includes values such as `west`, padded `SOUTH`, and `Mountain West`.
- Several variables include special missing codes such as `-8`, `-9`, `99`, and `999`.
- Numeric-looking variables such as income, hours worked, activity days, and survey weight include string values.
- The file includes one duplicate respondent ID.

At this stage, students do not need to fix these issues. They only need to identify them and preserve them for later cleaning modules.

## Grading Guidance

Suggested emphasis:

- 30 percent: scripts run from the project root using relative paths.
- 25 percent: logs and inspection outputs are created.
- 20 percent: README draft correctly identifies raw, working, output, scripts, and logs.
- 15 percent: reflection clearly explains why raw data should not be manually edited.
- 10 percent: comments are clear and student does not commit or submit unnecessary generated data files.

## Common Student Issues

- Running the scripts from the wrong working directory.
- Using an absolute path from their own computer.
- Editing the CSV to make import easier.
- Reporting that data are "clean" because import succeeded.
- Forgetting to close the Stata log or R sink.
- Submitting generated working data instead of the requested documentation.

## Stata Availability

Some students may not have local Stata access. If the course environment does not provide Stata for this assignment, accept a clear note explaining the limitation and grade the R workflow plus conceptual answers. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Check

The R lab can be checked quickly by running:

```r
# Run the R lab from the repository root.
source("modules/01-project-workflows/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
* Run the Stata lab from the repository root.
do modules/01-project-workflows/stata_lab.do
```
