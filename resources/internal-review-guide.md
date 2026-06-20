# Internal Review Guide

Reviewer-facing guide for IBS internal curriculum review of the proposed CU Boulder microcredential **Quantitative Data Management and Workflow for Social Scientists**.

Author: Donald Mather, Statistics Consultant, Computing & Research Services, Institute of Behavioral Science, University of Colorado Boulder, Boulder, Colorado

## What This Repository Contains

This repository contains a complete draft curriculum package for the GitHub-managed **Quantitative Data Management and Workflow for Social Scientists** microcredential. It includes module lessons, parallel Stata and R labs, assignments, checklists, rubrics, syllabus materials, badge competency documentation, synthetic teaching data, student setup guides, instructor implementation materials, and QA scripts.

## Proposed Microcredential

The proposed microcredential prepares graduate students in the social sciences to manage, document, clean, combine, validate, and export social science data using reproducible workflows. Students may complete the badge through a Stata pathway, an R pathway, or a dual Stata/R pathway. The course is framed primarily as a noncredit digital badge, with notes for possible adaptation to a 1-credit graduate course or compressed bootcamp.

## Syllabus Package

Review the syllabus package first:

- [Course description](../syllabus/course-description.md)
- [Learning objectives](../syllabus/learning-objectives.md)
- [Course schedule](../syllabus/course-schedule.md)
- [Assessment plan](../syllabus/assessment-plan.md)

These files define the course rationale, audience, learning outcomes, delivery formats, time expectations, pathway policy, and assessment structure.

## Badge Competency Matrix

The formal badge competency matrix is here:

- [Badge competencies](../syllabus/badge-competencies.md)

This document defines what the badge certifies and maps competencies to modules, required evidence, acceptable Stata evidence, acceptable R evidence, and minimum badge thresholds.

## Assessment Plan And Rubrics

Assessment materials are here:

- [Assessment plan](../syllabus/assessment-plan.md)
- [Capstone rubric](../rubrics/capstone-rubric.md)
- [Module checklist rubric](../rubrics/module-checklist-rubric.md)

Review these files to evaluate whether badge evidence is competency-based, transparent, and appropriate for a noncredit microcredential.

## Capstone Assignment

The summative assessment is here:

- [Capstone data management portfolio](../assignments/capstone-data-management-portfolio.md)
- [Module 10 capstone materials](../modules/10-capstone/README.md)

The capstone requires students to submit a reproducible Stata do-file or R script, an analysis-ready dataset, a data dictionary or codebook, a QA report, a workflow memo, and evidence of missing-data handling, cleaning/recoding, merges/appends, row-count checks, relative paths, and raw-data preservation.

## Student-Facing Setup Materials

Student support materials are here:

- [How to use this repository](how-to-use-this-repository.md)
- [Student Stata setup guide](student-stata-setup.md)
- [Student R setup guide](student-r-setup.md)
- [File paths and folders](file-paths-and-folders.md)
- [Troubleshooting guide](troubleshooting.md)

These files are written for students who may be new to GitHub, Stata do-files, R scripts, RStudio, or reproducible file paths.

## Instructor-Facing Implementation Materials

Instructor implementation materials are here:

- [Teaching guide](../instructor/teaching-guide.md)
- [Course implementation notes](../instructor/course-implementation-notes.md)
- [Software setup guide](../instructor/software-setup-guide.md)
- [Module prep checklist](../instructor/module-prep-checklist.md)
- [Common student errors](../instructor/common-student-errors.md)
- [Stata lab smoke-test checklist](../instructor/stata-lab-smoke-test-checklist.md)
- [R lab smoke-test checklist](../instructor/r-lab-smoke-test-checklist.md)
- [Stata version notes](../instructor/stata-version-notes.md)

These files support delivery as a noncredit microcredential, 1-credit course adaptation, or compressed bootcamp.

## Stata/R Crosswalk

The parallel software reference is here:

- [Stata/R data wrangling crosswalk](stata-r-crosswalk.md)

The crosswalk helps reviewers and students see how the same data-management tasks are taught in Stata and R.

## Synthetic Data System

All teaching data are synthetic. The main tracked teaching files live in `data/synthetic/` and are documented here:

- [Synthetic data README](../data/synthetic/README.md)
- [Synthetic data dictionary](../data/synthetic/data-dictionary.md)

The R generator creates the CSV and Excel teaching inputs:

- [R synthetic data generator](../code/r/create-synthetic-data.R)

Generated Stata `.dta` convenience files are not tracked. They can be recreated locally with:

- [Stata synthetic data converter](../code/stata/create-synthetic-data.do)

Generated working files, outputs, and logs should remain in ignored folders such as `data/working/`, `data/output/`, and `logs/`.

## Testing Needed Before Launch

Before launch, instructors should complete local testing in the actual teaching environment:

- Run [R dependency check](../code/r/check-r-dependencies.R).
- Run [R lab smoke tests](../code/r/run-r-lab-smoke-tests.R).
- Run [Stata lab smoke tests](../code/stata/run-stata-lab-smoke-tests.do) after Stata is available.
- Confirm Stata access, Stata version, and Excel import/export behavior.
- Confirm students can install or access required R packages.
- Confirm generated files remain ignored and are submitted through the instructor-approved mechanism.

## IBS Policy Decisions

IBS leadership or the offering instructor may need to decide:

- whether the microcredential requires all module assignments or only selected badge evidence,
- whether a specific offering requires Stata, R, or allows either pathway,
- whether dual Stata/R work is optional enrichment or required in any version,
- how students submit generated outputs and logs,
- how revisions and resubmissions are managed,
- whether the course is offered as noncredit only, a bootcamp, or a possible 1-credit adaptation,
- what official CU Boulder badge language, accessibility language, and records policy should be used.

## Review Priority

For a high-level review, read the syllabus package, badge competency matrix, capstone assignment, capstone rubric, and instructor implementation notes first. For a technical readiness review, inspect the synthetic data documentation, Stata/R crosswalk, setup guides, and smoke-test materials.
