# 00 Orientation Lesson

## Why This Course Exists

Social science research often begins with data that are not ready for analysis. Files may arrive with unclear variable names, missing-value codes, inconsistent categories, duplicate IDs, or multiple datasets that need to be combined carefully. Before you run a model or make a table, you need a workflow that makes the data understandable, trustworthy, and reproducible.

This microcredential teaches those workflow habits. By the end of the course, you should be able to take raw synthetic inputs and produce an analysis-ready dataset with code, documentation, quality checks, and a short handoff memo.

You are not expected to know GitHub, Stata do-files, or R scripts before starting. The course begins slowly and builds.

## How The Repository Is Organized

This course is managed as a GitHub repository. A repository is a project folder that can track files over time. You will use it as the home for lessons, code labs, assignments, data documentation, and instructor materials.

The most important folders are:

| Folder | What it contains |
| --- | --- |
| `modules/` | Weekly or skill-based course modules. |
| `data/synthetic/` | Synthetic teaching data used in the labs. |
| `data/raw/` | Reserved for original synthetic or public teaching data. |
| `data/working/` | Generated intermediate files. Ignored by Git. |
| `data/output/` | Generated reports, tables, and handoff files. Ignored by Git. |
| `code/` | Shared code for creating or preparing teaching data. |
| `assignments/` | Shared assignment materials that are not module-specific. |
| `rubrics/` | Rubrics and competency evaluation materials. |
| `syllabus/` | Course description, schedule, assessment plan, and badge competencies. |
| `instructor/` | Instructor-facing materials. |
| `resources/` | Shared templates and supporting resources. |
| `logs/` | Script logs created when labs run. Ignored by Git. |

## How Modules Are Organized

Each module follows the same file pattern:

| File | Audience | Purpose |
| --- | --- | --- |
| `README.md` | Student-facing | Module overview, objectives, required outputs, and skills. |
| `lesson.md` | Student-facing | Conceptual explanation and worked examples. |
| `stata_lab.do` | Student-facing | Stata practice script. |
| `r_lab.R` | Student-facing | R practice script. |
| `assignment.md` | Student-facing | What to complete and submit. |
| `checklist.md` | Student-facing | Competency checklist before moving on. |
| `solution_notes.md` | Instructor-facing | Instructor review, grading, and troubleshooting notes. |

Student-facing files are written for you. Instructor-facing files are for teaching staff and should not be treated as assignment instructions.

## The Course Data

The course uses a synthetic teaching dataset called `synthetic_gss_like`. It resembles a small social survey structure, but it does not contain real respondents.

The synthetic data include:

- a 2024 person-level survey file,
- a 2025 person-level survey file,
- a region-level contextual file,
- and a repeated-measures wide file for reshaping practice.

The files intentionally include common teaching problems, such as inconsistent capitalization, special missing codes, duplicate IDs, unmatched region keys, and string/numeric type surprises. These are learning opportunities. Do not "fix" the raw files by hand.

## Data Folder Roles

### Raw And Synthetic Data

`data/synthetic/` contains the safe teaching data for this course. These files are intentionally treated like raw inputs during labs. You may read them, inspect them, and write scripts that transform them.

Do not manually edit the synthetic CSV or Excel files.

### Working Data

`data/working/` is for intermediate files created by scripts. Working files help you continue a workflow, but they are not usually final handoff products.

### Output Data

`data/output/` is for generated reports, QA files, codebooks, summary tables, and analysis-ready handoff files.

### Logs

`logs/` is for records of script runs. Logs help you or another person see what happened when a script ran.

## Why Raw Data Should Not Be Edited Manually

Manual edits are hard to audit. If you open a CSV and change values by hand, another person may not know what changed, when it changed, or why it changed. Even you may forget later.

In this course, data decisions should live in scripts and documentation. If a value needs to be recoded, a row needs to be excluded, or a variable needs to be renamed, make that decision in Stata or R code and document it.

## Stata And R Pathways

The course provides parallel Stata and R materials. Parallel does not mean identical line by line. It means the two pathways teach the same data management idea using each software environment's normal tools.

Your instructor may ask you to:

- complete the Stata pathway,
- complete the R pathway,
- complete the dual Stata/R pathway,
- or focus on one pathway while reviewing the other for comparison.

The standard microcredential policy is that students may complete graded work through a Stata pathway, an R pathway, or a dual Stata/R pathway. All students should be exposed conceptually to both Stata and R, but you only need to submit graded work in one primary pathway unless your instructor requires both. The dual pathway is a good choice if you want extra practice or expect to move between research teams that use different software.

If you are unsure, ask which pathway is expected for your section. The capstone can be completed with one reproducible Stata do-file or one reproducible R script unless your instructor says otherwise.

## Assignments And Checklists

Each module includes an assignment and a checklist.

The assignment tells you what to do. The checklist helps you decide whether you are ready to move on.

The checklists are not busywork. They prepare you for the capstone portfolio by asking you to gather evidence of reproducible workflow habits: scripts that run, outputs that can be regenerated, documented decisions, and checks that make the final data trustworthy.

## How The Capstone Builds Across Modules

Each technical module contributes a piece of the final portfolio:

- Module 01: project workflow and reproducibility.
- Module 02: importing and inspecting data.
- Module 03: documentation and codebooks.
- Module 04: cleaning and recoding variables.
- Module 05: missing data and analytic sample construction.
- Module 06: reshaping and restructuring data.
- Module 07: appending and merging data.
- Module 08: quality assurance checks.
- Module 09: reproducible outputs and handoff files.
- Module 10: final capstone data management portfolio.

The capstone asks you to show that you can connect these skills into one complete workflow.

## Practice Task

Run either the Stata setup check or the R setup check for this module. The goal is simply to confirm that your software can find the repository, read the synthetic data file, and write a small setup report to an ignored output folder.

If something does not work, that is useful information. Save the error message and ask for help. Setup issues are normal at the start of a course like this.

## Common Errors

- Running a script from inside the wrong folder.
- Moving the data files out of `data/synthetic/`.
- Editing a raw CSV file by hand.
- Trying to submit generated files from `data/working/` or `data/output/` when the assignment asks for scripts or memos.
- Worrying about GitHub before learning the course folder structure.

## Competency Checklist

You are ready for Module 01 when you can:

- find the main repository folders,
- explain the difference between raw/synthetic, working, output, and logs folders,
- run a small Stata or R setup script,
- explain why raw data should not be edited manually,
- identify which course pathway you are expected to complete,
- and describe the basic purpose of the capstone portfolio.
