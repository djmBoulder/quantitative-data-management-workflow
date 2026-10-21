# Teaching Guide

Instructor-facing guide for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential.

Do not copy instructor-facing notes, grading guidance, or solution notes into student-facing files.

## Course Purpose

This course teaches graduate social science students how to manage data before analysis. The emphasis is reproducible workflow, transparent data decisions, protected raw data, documentation, quality assurance, and preparation for later quantitative methods coursework.

Students use the synthetic `synthetic_gss_like` data for guided labs and Module 00–09 assignments. The capstone also offers instructor-approved publicly distributable student-selected data through the [proposal](../assignments/capstone-data-proposal.md). Review proposals early enough to confirm permission, scope, exact inputs, and evidence locations before work begins. Apply the [data policy](../syllabus/course-policies.md#capstone-data-options); instructor approval cannot waive its restrictions.

## Teaching As A Noncredit Microcredential

Scaffold the course in Canvas. Students enroll, submit assignments, and receive feedback and grades there. Module assignments count as required badge evidence and build the skills assessed in the capstone.

Use this sequence:

1. Orientation and setup check in Module 00.
2. Required Module 01–09 assignments, with instructor feedback and checklist evidence.
3. Module 10 capstone portfolio submitted through Canvas.
4. Up to two capstone revisions after the initial submission, if needed, before the course cutoff.
5. A passing capstone grade in Canvas to record completion, followed by instructor notification to the micro registrar to issue the badge.

The self-paced window runs from registration to seven calendar days before CU's semester grade-submission deadline. Post the actual cutoff in Canvas. No peer review is required, and the dual pathway is optional. See the [course policies](../syllabus/course-policies.md).

Focus feedback on reproducibility, clarity, and whether another researcher could rerun the workflow.

## Adapting To A 1-Credit Graduate Course

A 1-credit version can use the same modules with more instructor feedback and formal grading. Possible additions:

- weekly lab meetings,
- short pre-class setup tasks,
- graded participation or lab engagement,
- instructor review of selected module assignments,
- graded capstone portfolio using `rubrics/capstone-rubric.md`,
- final portfolio walkthrough or short presentation.

A future 1-credit version requires unit decisions about contact hours, credit-specific grading, and transcript requirements. The current [course policies](../syllabus/course-policies.md) settle the completion window, two capstone revisions, optional dual pathway, Canvas delivery, module evidence, badge administration, and no required peer review.

## Running A Compressed Bootcamp

For a bootcamp, prioritize workflow concepts and hands-on troubleshooting over full written assignments during the event.

Recommended four-day structure:

- Day 1: Modules 00-02, setup, project organization, importing, inspection.
- Day 2: Modules 03-05, documentation, cleaning, recoding, missing data.
- Day 3: Modules 06-08, reshaping, combining, QA.
- Day 4: Modules 09-10, reproducible outputs, capstone build time, portfolio expectations.

Recommended two-day intensive structure:

- Day 1: Modules 00-05 with shortened practice tasks.
- Day 2: Modules 06-10 with capstone started in class and submitted later.

For a two-day format, do not require a complete capstone by the end of the second day. Give students time afterward to rerun scripts, fix path problems, and write the workflow memo.

## Pathway Models

The course supports three pathways:

- Stata pathway: students submit Stata work.
- R pathway: students submit R work.
- Dual Stata/R pathway: students submit both Stata and R work.

All students should understand both Stata and R conceptually. One primary pathway is sufficient.

### Stata-First Instruction

Use Stata-first instruction when most students are entering methods sequences taught in Stata or when Stata access is reliable. Show the R equivalent briefly to reinforce that the data decision is the same even when syntax differs.

Good emphasis points:

- do-files as research records,
- log files as evidence,
- value labels and variable labels,
- `merge` diagnostics,
- `assert`, `isid`, and `duplicates`.

### R-First Instruction

Use R-first instruction when students are expected to work in RStudio, Positron, Quarto, or research teams using tidyverse workflows. Show the Stata equivalent briefly to support cross-software literacy.

Good emphasis points:

- scripts and projects,
- package loading and missing packages,
- objects in memory,
- `dplyr` and `tidyr` verbs,
- merges with matched/unmatched record checks,
- writing reproducible outputs from scripts.

### Dual-Pathway Instruction

Offer optional dual-pathway practice to students who want to move between research teams using different software. Do not require students to complete both pathways.

Do not require line-by-line equivalence. Evaluate substantive parallelism:

- same source files,
- same major cleaning decisions,
- same missing-data rules,
- same append/merge logic,
- comparable QA checks,
- comparable final outputs.

## Supporting Students With No Coding Background

Students new to coding often need help with the mechanics before they can focus on data management concepts.

Practical supports:

- Start every module by reminding students where the repository root is.
- Demonstrate how to run the whole script, not just a selected line.
- Explain that error messages are information, not personal failure.
- Encourage students to read paths aloud from left to right.
- Use small checkpoints: import first, inspect next, then clean.
- Ask students to keep raw data untouched.
- Model how to copy a short log excerpt into an assignment response.
- Normalize revision. Reproducible workflows usually improve through debugging.

Avoid assuming that students know GitHub, terminal commands, do-files, R scripts, working directories, packages, or the difference between files on disk and objects in memory.

## Evaluating Module Assignments

Use `rubrics/module-checklist-rubric.md` for smaller module assignments and checklists.

Module assignments count as required badge evidence and provide formative feedback before the capstone. Record submissions, feedback, and grades in Canvas. Look for:

- primary-pathway lab completion,
- relative paths,
- no raw data edits,
- evidence that the workflow ran,
- short memo or reflection,
- module-specific checks,
- and capstone-relevant habits.

Give feedback that helps students succeed on the capstone. Name the missing evidence or next debugging step clearly.

## Evaluating The Capstone Portfolio

Use `rubrics/capstone-rubric.md` and `syllabus/badge-competencies.md`.

The capstone should include:

- one reproducible Stata do-file or R script, or both for dual pathway,
- one analysis-ready dataset generated from approved inputs,
- a data dictionary or codebook,
- a QA checklist or QA report,
- a workflow memo,
- evidence of missing-data handling,
- evidence of cleaning and recoding,
- evidence of ID, append/merge, and row-count checks,
- evidence of relative paths and raw data protection.

Badge-ready work should be reproducible, documented, and clear enough for another researcher to inspect and rerun. Return work for revision if it uses absolute paths, lacks QA evidence, silently drops cases, manually edits raw data, or omits the workflow memo.

For Option B, review the approved proposal, source versions and terms, and access to exact inputs. Use the same rubric for both data options. Review Module 06 evidence for reshape when it is not part of the capstone and approved Module 07 evidence for an Option B append or merge that does not apply. Confirm each skill in the cited scripts and diagnostics. Require applicable operations and checks in the capstone, and require correction of inadequate module evidence before badge completion.

## Instructor File Boundaries

Student-facing files:

- module `README.md`,
- `lesson.md`,
- `stata_lab.do`,
- `r_lab.R`,
- `assignment.md`,
- `checklist.md`,
- shared resources intended for students.

Instructor-facing files:

- `solution_notes.md`,
- files in `instructor/`,
- rubric interpretation notes,
- implementation notes.

Keep answers, grading notes, expected row counts, and solution-specific guidance in instructor-facing files only.
