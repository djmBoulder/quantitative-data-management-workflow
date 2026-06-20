# Module Assignment And Checklist Rubric

This rubric explains how instructors can evaluate smaller module assignments and checklists in the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential. Module assignments are primarily formative: they build the skills students later demonstrate in the capstone data management portfolio.

## Purpose

Module assignments and checklists help instructors see whether students are building the habits required for badge completion:

- running scripts from the repository root,
- using relative paths,
- preserving raw synthetic data,
- completing the selected Stata, R, or dual pathway lab,
- documenting data decisions,
- producing pathway-appropriate evidence,
- and identifying issues before they become capstone problems.

## Suggested Use

In the noncredit badge version, instructors may use this rubric as:

- a complete/incomplete check for module assignments,
- a feedback guide for students before the capstone,
- a self-assessment guide,
- or a lightweight review tool for teaching assistants.

In a 1-credit adaptation, instructors may convert these categories into points or performance levels.

## Checklist Review Levels

| Level | Meaning | Recommended action |
| --- | --- | --- |
| Complete | The module submission demonstrates the expected skill for the student's pathway and includes adequate evidence. | Mark complete or provide brief reinforcing feedback. |
| Minor revision | The submission is mostly complete but needs a small clarification, screenshot/excerpt, or documentation improvement. | Ask for targeted revision or note for capstone improvement. |
| Major revision | The submission misses important workflow evidence, does not run, or shows misunderstanding of the module skill. | Return for revision before the student relies on it for capstone work. |
| Not submitted / not demonstrated | Required module evidence is absent or unrelated. | Mark incomplete and follow course policy. |

## Module Assignment Rubric

| Review area | Complete | Minor revision | Major revision | Not submitted / not demonstrated |
| --- | --- | --- | --- | --- |
| Pathway completion | Student completes the required Stata, R, or dual-pathway lab for the module. | Student completes the main workflow but pathway choice or dual-pathway status needs clarification. | Student submits the wrong file, incomplete lab work, or evidence from a different module. | No pathway evidence is submitted. |
| Reproducibility habits | Script uses relative paths, runs from the repository root, and creates or references expected folders. | Script mostly follows reproducible workflow practices but has a small setup or path issue. | Script relies on absolute paths, manual setup, or unstated files. | No runnable script or reproducible evidence is submitted. |
| Raw data protection | Student does not manually edit raw or synthetic source files and distinguishes source data from working/output files. | Raw data protection is implied but should be stated more clearly. | Student appears to overwrite or manually edit source files, or source/working files are confused. | Data provenance cannot be evaluated. |
| Module skill evidence | Submission demonstrates the module's core skill, such as importing, documenting, cleaning, missing-data checks, reshaping, combining, QA, or output generation. | Core skill is mostly demonstrated but one required check or explanation is thin. | Core skill is incomplete, incorrect, or missing important diagnostics. | Module skill is not demonstrated. |
| Documentation and reflection | Memo, checklist, or notes explain what was done and why in beginner-friendly language. | Explanation is understandable but missing one or two prompts or details. | Explanation is vague, copied from code without interpretation, or does not address the module purpose. | No documentation or reflection is submitted. |
| Evidence of checks | Student includes log excerpts, screenshots, output snippets, tables, reports, or checklist items showing that the workflow ran. | Evidence is present but limited or not clearly connected to the script. | Evidence is insufficient to tell whether the workflow ran correctly. | No evidence of checks is submitted. |
| Preparation for capstone | Submission creates or practices evidence that can support the final portfolio. | Submission is useful but needs clearer naming or organization before capstone reuse. | Submission would not support the capstone without substantial revision. | No capstone-relevant evidence is present. |

## Module-Specific Evidence Guide

| Module | Evidence instructors should expect |
| --- | --- |
| 00 Orientation | Setup check, repository tour note, pathway reflection, orientation checklist. |
| 01 Project workflows | Primary-pathway script, log evidence, working copy evidence, README draft, raw-data protection reflection. |
| 02 Importing data | Import lab evidence, import inspection memo, variable-name changes, CSV/Excel import checks. |
| 03 Data documentation | Documented working file evidence, exported data dictionary or codebook, documentation memo. |
| 04 Cleaning and recoding | Cleaning decision log, recode checks, cleaned/derived variable evidence, cleaning memo. |
| 05 Missing data | Missing-data summary, sample construction table, analytic sample flag evidence, sample memo. |
| 06 Reshaping data | Wide-to-long and long-to-wide evidence, row-count/key validation, restructuring memo. |
| 07 Combining data | Append and merge/join diagnostics, duplicate and unmatched-record checks, combination memo. |
| 08 Quality assurance | QA report, fatal/warning/unresolved issue labels, row/range/category/duplicate/missingness checks. |
| 09 Reproducible outputs | Analysis-ready output evidence, summary table, codebook or metadata file, workflow log, handoff memo. |
| 10 Capstone | Full portfolio evaluated with `rubrics/capstone-rubric.md`. |

## Pathway Policy

Students may complete module work through the Stata pathway, R pathway, or dual Stata/R pathway. One primary pathway is sufficient unless the instructor requires both. Students should still review both pathways conceptually so they understand the parallel data management logic.

For dual-pathway module work, instructors should look for substantive parallelism rather than line-by-line equivalence. The Stata and R submissions should use the same source data, address the same task, and document comparable decisions.

## Feedback Guidance

Feedback should be specific enough to help students revise before the capstone. Useful feedback names:

- what evidence is missing,
- what part of the workflow did not run or was unclear,
- what documentation needs more detail,
- what QA or validation check should be added,
- and how the student can make the work more useful for the final portfolio.

Avoid treating module assignments as syntax quizzes. The main question is whether the student can use code, documentation, and checks to make a transparent data workflow.
