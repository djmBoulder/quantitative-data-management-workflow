# 00 Orientation

## Module Purpose

This module introduces the IBS CU Boulder microcredential **Quantitative Data Management and Workflow for Social Scientists**. Students learn what the course is for, how the GitHub repository is organized, where files belong, how the Stata and R pathways work, and how the final capstone portfolio will build across modules.

Students may complete the microcredential through a Stata pathway, an R pathway, or a dual Stata/R pathway. Everyone should understand the parallel structure conceptually, but students submit graded work in one primary pathway unless the instructor requires both.

The module is designed as a calm first contact with the course repository. Students do not clean data yet. They confirm that they can find the synthetic data, run a small script, and write a simple setup check to an ignored folder.

## Learning Objectives

By the end of this module, students should be able to:

- Describe the purpose of the microcredential.
- Navigate the major folders in the GitHub repository.
- Explain how modules are organized.
- Distinguish student-facing files from instructor-facing files.
- Identify the `synthetic_gss_like` teaching data.
- Explain the difference between raw, synthetic, working, and output data folders.
- Explain why raw data should never be edited manually.
- Choose an appropriate Stata, R, or dual pathway for the course.
- Explain how assignments and checklists support skill-building.
- Describe how the capstone portfolio builds across Modules 01-10.

## Required Student Outputs

Students will submit:

- A completed Stata setup check or R setup check, depending on their course pathway.
- A short repository tour note.
- A short reflection about their software pathway and workflow goals.
- A completed orientation checklist.

## Stata Skills

- Open and run a `.do` file.
- Check the current working directory.
- Use relative paths.
- Confirm that a synthetic data file exists.
- Import a small synthetic CSV file for inspection.
- Create a plain-text log in `logs/`.
- Write a small setup report in `data/output/`.

## R Skills

- Open and run an `.R` script.
- Check the current working directory.
- Use `file.path()` for relative paths.
- Confirm that a synthetic data file exists.
- Read a small synthetic CSV file for inspection.
- Create a plain-text log in `logs/`.
- Write a small setup report in `data/output/`.

## Common Pitfalls

- Feeling like GitHub must be mastered before starting the course.
- Running scripts from the wrong folder.
- Using absolute paths that work only on one computer.
- Editing raw CSV files by hand.
- Confusing student-facing files with instructor-facing `solution_notes.md`.
- Trying to complete both Stata and R pathways before checking whether the dual pathway is required or optional for the course offering.

## Estimated Time

1 to 2 hours.

## Files Used

- `README.md`
- `data/synthetic/README.md`
- `data/synthetic/data-dictionary.md`
- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `modules/00-orientation/stata_lab.do`
- `modules/00-orientation/r_lab.R`

## Relationship to the Final Capstone

The final capstone portfolio asks students to produce a reproducible data management workflow with documentation. This orientation module introduces the habits students will reuse throughout the portfolio: protect raw data, use relative paths, keep scripts as records of decisions, write logs, and document what each output means.
