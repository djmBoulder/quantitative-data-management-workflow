# Quantitative Data Management and Workflow for Social Scientists

This repository contains the curriculum scaffold for the IBS CU Boulder microcredential **Quantitative Data Management and Workflow for Social Scientists**. The microcredential introduces reproducible data management and data wrangling habits for graduate students preparing for quantitative research and methods coursework.

Author: Donald Mather, Statistics Consultant, Computing & Research Services, Institute of Behavioral Science, University of Colorado Boulder, Boulder, Colorado

## For Reviewers

This repository contains the proposed microcredential syllabus, module materials, synthetic teaching data plan, assessment materials, rubrics, student setup guides, and instructor implementation resources. For IBS internal curriculum review, start with the syllabus and badge documents, then review the capstone and rubrics as evidence of how competency is assessed.

Reviewer start point:

- [Internal review guide](resources/internal-review-guide.md)

Files that define the proposed microcredential:

- [Course description](syllabus/course-description.md)
- [Learning objectives](syllabus/learning-objectives.md)
- [Course schedule](syllabus/course-schedule.md)
- [Assessment plan](syllabus/assessment-plan.md)
- [Badge competency matrix](syllabus/badge-competencies.md)

Assessment and badge evidence:

- [Capstone data management portfolio](assignments/capstone-data-management-portfolio.md)
- [Capstone rubric](rubrics/capstone-rubric.md)
- [Module checklist rubric](rubrics/module-checklist-rubric.md)
- [Stata/R crosswalk](resources/stata-r-crosswalk.md)

Student-facing support materials:

- [How to use this repository](resources/how-to-use-this-repository.md)
- [Student Stata setup guide](resources/student-stata-setup.md)
- [Student R setup guide](resources/student-r-setup.md)
- [Troubleshooting guide](resources/troubleshooting.md)

Instructor-facing implementation materials:

- [Teaching guide](instructor/teaching-guide.md)
- [Course implementation notes](instructor/course-implementation-notes.md)
- [Stata lab smoke-test checklist](instructor/stata-lab-smoke-test-checklist.md)
- [R lab smoke-test checklist](instructor/r-lab-smoke-test-checklist.md)

Student-facing files live primarily in `modules/`, `resources/`, `assignments/`, `rubrics/`, and `syllabus/`. Instructor-facing files live in `instructor/` and in each module's `solution_notes.md`. All teaching data are synthetic; restricted, confidential, licensed, private, or student data should not be committed.

## For Students

Start with [How to use this repository](resources/how-to-use-this-repository.md), then complete [Module 00 Orientation](modules/00-orientation/README.md). If you are using Stata, read the [Student Stata setup guide](resources/student-stata-setup.md). If you are using R, read the [Student R setup guide](resources/student-r-setup.md). Keep the [Troubleshooting guide](resources/troubleshooting.md) and [Stata/R crosswalk](resources/stata-r-crosswalk.md) nearby as references throughout the course.

## Intended Audience

The course is designed for incoming or early-stage graduate students in sociology, political science, geography, economics, education, communication, public health, environmental studies, and related social science fields. Students are assumed to have limited prior coding experience.

## Parallel Stata and R Structure

Each module is organized around parallel workflows in Stata and R. Students should learn the same core data management ideas in both environments, with substantively similar examples and teaching datasets whenever possible.

Students may complete the microcredential through a Stata pathway, an R pathway, or a dual Stata/R pathway. All students should review both pathways conceptually, but graded work is required only in one primary pathway unless the instructor requires both for a specific offering. The dual pathway is recommended for students who want extra practice or expect to move between research teams using different software.

## What Students Will Be Able To Do

By the end of the microcredential, students should be able to:

- Organize reproducible research projects with clear folder structures and relative file paths.
- Import, inspect, clean, recode, reshape, and combine teaching datasets.
- Document data decisions clearly enough that another researcher can follow the workflow.
- Check data quality before analysis.
- Produce reproducible outputs that prepare them for graduate-level quantitative methods courses.

## Materials Included

This repository is scaffolded to include:

- Module lessons, Stata labs, R labs, assignments, checklists, and solution notes.
- Shared assignment materials and rubrics.
- Instructor-facing materials.
- Syllabus and badge competency documents.
- Teaching resources and reusable code examples.
- Folders for synthetic or publicly distributable teaching data.

## Data Warning

Do not commit restricted, confidential, licensed, private, or student data to this repository. Raw teaching data must be synthetic or publicly distributable. Generated files from `data/working/` and `data/output/` should not be committed.
