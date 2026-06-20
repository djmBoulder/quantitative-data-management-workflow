# How To Use This Repository

This guide explains what is in the course repository and how to move through it. If you have never used GitHub or a course repository before, start here.

## What This Repository Is

This repository contains the materials for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential.

It includes:

- lessons,
- Stata labs,
- R labs,
- assignments,
- checklists,
- synthetic teaching data,
- student resources,
- rubrics and syllabus materials,
- and instructor-only notes.

You do not need to understand every folder on the first day. Start with Module 00 and build from there.

## Top-Level Folders

### `modules/`

This is where the main course modules live. Each module has its own folder.

Examples:

- `modules/00-orientation/`
- `modules/01-project-workflows/`
- `modules/10-capstone/`

Each module usually contains:

- `README.md`: module overview,
- `lesson.md`: student-facing lesson,
- `stata_lab.do`: Stata lab,
- `r_lab.R`: R lab,
- `assignment.md`: assignment instructions,
- `checklist.md`: student self-check,
- `solution_notes.md`: instructor-facing notes.

### `data/`

This folder contains data-related folders.

- `data/synthetic/`: approved synthetic teaching data.
- `data/working/`: generated intermediate files.
- `data/output/`: generated reports, tables, and handoff files.
- `data/raw/`: reserved for raw data in projects where it is appropriate.

In this course, use the synthetic data. Do not add private, restricted, licensed, confidential, or student data.

### `resources/`

This folder contains student reference guides.

Useful files include:

- `student-stata-setup.md`
- `student-r-setup.md`
- `file-paths-and-folders.md`
- `troubleshooting.md`
- `stata-r-crosswalk.md`

### `assignments/`

This folder contains shared assignment materials, including the capstone portfolio assignment.

### `rubrics/`

This folder contains evaluation rubrics. These explain how assignments and the capstone portfolio are reviewed.

### `syllabus/`

This folder contains course-level documents such as the course description, learning objectives, schedule, assessment plan, and badge competencies.

### `instructor/`

This folder is instructor-facing. It contains teaching guides, implementation notes, and QA checklists.

Students should not rely on this folder for assignment answers.

## Which Files Students Use

Students should focus on:

- module `README.md`,
- module `lesson.md`,
- module `assignment.md`,
- module `checklist.md`,
- either `stata_lab.do` or `r_lab.R` depending on pathway,
- student resources in `resources/`,
- capstone assignment materials,
- rubrics when reviewing expectations.

## Which Files Are Instructor-Only

Instructor-only files include:

- module `solution_notes.md`,
- files in `instructor/`,
- any file your instructor identifies as grading or implementation guidance.

Do not use instructor-only files as assignment instructions unless your instructor tells you to.

## Course Pathways

The course supports:

- Stata pathway,
- R pathway,
- dual Stata/R pathway.

All students should understand both Stata and R conceptually, but you usually submit graded work in one primary pathway unless your instructor requires both.

## How To Proceed Through Modules

For each module:

1. Read the module `README.md`.
2. Read the `lesson.md`.
3. Open the lab for your pathway:
   - Stata: `stata_lab.do`
   - R: `r_lab.R`
4. Run the lab from the repository root.
5. Check the generated outputs or logs.
6. Complete the `assignment.md`.
7. Use the `checklist.md` before submitting.
8. Save questions for your instructor.

If you are doing the dual pathway, run both labs and compare the workflows.

## How The Capstone Builds Across The Course

The capstone portfolio asks you to create a complete, reproducible data management workflow.

Earlier modules prepare pieces of that portfolio:

- Module 00: orientation and setup.
- Module 01: project workflow and reproducibility.
- Module 02: importing and inspecting data.
- Module 03: documentation and codebooks.
- Module 04: cleaning and recoding.
- Module 05: missing data and analytic sample construction.
- Module 06: reshaping data.
- Module 07: combining datasets.
- Module 08: quality assurance.
- Module 09: reproducible outputs and handoff files.
- Module 10: final capstone portfolio.

By the end, you should be able to show another person what raw synthetic files you used, what script created the final data, what decisions you made, what checks you ran, and what limitations remain.

## A Note About GitHub

GitHub is used here as a way to organize and manage course materials. You do not need to become a Git expert to begin.

Important habits:

- Do not commit private or restricted data.
- Do not commit generated files from `data/working/`, `data/output/`, or `logs/` unless your instructor explicitly asks you to.
- Keep scripts and documentation organized.
- Ask for help if GitHub language feels unfamiliar.

## Where To Start

Start with:

1. `README.md` at the repository root.
2. `modules/00-orientation/README.md`.
3. `resources/file-paths-and-folders.md`.
4. Your setup guide:
   - `resources/student-stata-setup.md`
   - `resources/student-r-setup.md`
5. `modules/00-orientation/stata_lab.do` or `modules/00-orientation/r_lab.R`.

Small steps are fine. The course is designed to build confidence as well as skill.
