# How To Use This Repository

This guide explains what is in the course repository and how to move through it. If you have never used GitHub or a course repository before, start here. This public copy is available for faculty review and includes clearly labeled teaching notes alongside the learning materials.

## Download The Course

1. Open the [public course repository](https://github.com/djmBoulder/quantitative-data-management-workflow).
2. Select **Code**, then **Download ZIP**. Extract the ZIP file before opening any scripts. Keep the complete folder structure together.
3. Put the extracted folder somewhere you can find it again. Its top level contains `README.md`, `modules/`, `data/`, and `code/`; this is the **repository root**.
4. Follow the [Stata setup guide](student-stata-setup.md) or [R setup guide](student-r-setup.md) to run Module 00 from that folder.

You do not need a GitHub account or Git commands to download the course. If you already use Git, you may clone the repository instead. Downloaded copies do not update automatically; save your own scripts separately before replacing course files with a newer download.

## Canvas And Course Completion

For enrollment availability, see the [course homepage](../README.md#course-availability). Once enrolled, follow the module sequence in Canvas. Submit module assignments and the capstone in Canvas, where you will receive feedback and grades. Module assignments count as required badge evidence. The repository provides the course readings, lab scripts, and teaching data.

Your completion window begins at registration and ends seven calendar days before CU's semester grade-submission deadline. Use the actual cutoff posted in Canvas. Two capstone revisions are allowed after the initial submission within that window. The dual pathway is optional, and no peer review is required. A passing capstone grade in Canvas records completion; the instructor then notifies the micro registrar to issue the badge. Read the [course policies](../syllabus/course-policies.md).

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
- and rubrics and syllabus materials.

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
- `solution_notes.md`: teaching and assessment notes for instructor review.

### `data/`

This folder contains the teaching data. The labs create `data/working/`, `data/output/`, and `logs/` when needed; these generated folders may be absent from a fresh download.

- `data/synthetic/`: approved synthetic teaching data.
- `data/working/`: generated intermediate files.
- `data/output/`: generated reports, tables, and handoff files.
- `data/raw/`: reserved for raw data in projects where it is appropriate.

Use the assigned synthetic data for labs and Module 00–09 assignments. For the capstone, you can request approval for publicly distributable student-selected data using the [proposal](../assignments/capstone-data-proposal.md). Obtain approval before work begins, document the sources and terms, and keep those data out of the course repositories. Private, restricted, confidential, identifiable respondent data, student records, and data whose terms prohibit redistribution are not eligible. See the [data policy](../syllabus/course-policies.md#capstone-data-options).

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

This folder contains teaching guides, implementation plans, and software checks for faculty review. It is not a source of student assignment instructions.

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

## Course Pathways

The course supports:

- Stata pathway,
- R pathway,
- dual Stata/R pathway.

All students should understand both Stata and R conceptually, and you submit graded work in one primary pathway. The dual pathway is optional.

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
8. Submit the requested assignment evidence in Canvas and review instructor feedback.

If you are doing the dual pathway, run both labs and compare the workflows.

## How The Capstone Builds Across The Course

The capstone portfolio asks you to create a complete, reproducible data management workflow. Choose the synthetic data option or the approved student-selected option. The [assignment](../assignments/capstone-data-management-portfolio.md) explains how Module 06/07 evidence can demonstrate operations that do not apply to your approved data. All module assignments remain required.

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

By the end, you should be able to show another person what approved source files and versions you used, what script created the final data, what decisions you made, what checks you ran, and what limitations remain.

## A Note About GitHub

GitHub is used here as a way to organize and manage course materials. You do not need to become a Git expert to begin.

Important habits:

- Do not commit private or restricted data.
- Do not commit generated files from `data/working/`, `data/output/`, or `logs/`. Upload requested evidence to Canvas.
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

## Reading The Code

Use [Reading the course code](reading-course-code.md) for beginner explanations of the R and Stata notation used in the labs.
