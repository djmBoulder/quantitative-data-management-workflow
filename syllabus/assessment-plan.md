# Assessment Plan

This assessment plan frames **Quantitative Data Management and Workflow for Social Scientists** as a noncredit IBS CU Boulder microcredential or digital badge. It can also support a 1-credit graduate adaptation with additional grading policies.

## Assessment Philosophy

Assessment should focus on demonstrated workflow competency rather than memorization of syntax. Students should show that they can start from assigned synthetic inputs or instructor-approved publicly distributable capstone data, record data decisions in code, protect source files, check their work, and produce analysis-ready handoff materials that another researcher can understand.

The microcredential uses competency-based assessment. A passing capstone grade in Canvas records completion, and students may submit two capstone revisions after the initial submission. A portfolio is complete when it demonstrates the required competencies at a level appropriate for early graduate social science training.

## Pathway Options

Students may complete graded work through one of three pathways:

- Stata pathway: submit Stata scripts and Stata-generated evidence.
- R pathway: submit R scripts and R-generated evidence.
- Dual Stata/R pathway: submit both Stata and R workflows as an optional extension.

All students should understand both pathways conceptually. Badge evidence is required in one primary pathway. The dual pathway is optional.

## Module Assignments

Each module includes a student-facing assignment. Module assignments are designed to build pieces of the final capstone portfolio.

Module assignments typically ask students to submit:

- a completed primary-pathway lab script,
- a short memo or reflection,
- evidence that a log, output file, report, or diagnostic was created,
- and a completed or referenced checklist.

Module assignments are required badge evidence. Students submit all Module 00–09 assignments in Canvas. These assignments also serve a formative purpose: they give students practice and help the instructor identify problems before the capstone.

## Module Checklists

Each module includes a checklist. Checklists are not intended as busywork. They help students confirm that they can:

- run scripts from the repository root,
- use relative paths,
- avoid manual edits to source data,
- create pathway-appropriate outputs,
- document decisions,
- and recognize when a workflow is ready for the next module.

Students use each checklist before submitting the module assignment and include the checklist evidence requested by that assignment in Canvas.

Instructor review of smaller module assignments and checklists should follow `rubrics/module-checklist-rubric.md`. Record module feedback and grades in Canvas. Module work supports learning and counts toward required badge evidence.

## Capstone Data Management Portfolio

The final assessment is the capstone data management portfolio in `modules/10-capstone/`. Students use either course-provided synthetic data (Option A) or instructor-approved publicly distributable student-selected data (Option B) to produce a transparent, reproducible, analysis-ready dataset with documentation. Option B requires the [data proposal](../assignments/capstone-data-proposal.md) and approval in Canvas before work with those data begins. The [full assignment](../assignments/capstone-data-management-portfolio.md) defines both options.

Students submit:

1. A reproducible Stata do-file or R script for the student's primary pathway, or both scripts for the optional dual pathway.
2. An analysis-ready dataset.
3. A data dictionary or codebook.
4. A QA checklist or QA report.
5. A brief workflow memo explaining major data decisions.
6. Evidence of missing data, variable coding, identifiers, sample restrictions, and applicable transformations.
7. A log or text record, plus approved Module 06/07 evidence references when applicable.
8. For Option B, the approved proposal, source and redistribution documentation, and permitted input copies or agreed retrieval instructions.

Generated data files, logs, and outputs should normally remain outside version control in ignored folders such as `data/working/`, `data/output/`, and `logs/`. Students upload requested generated files to Canvas along with the rest of their assignment evidence.

## Evidence When An Operation Does Not Apply

The synthetic capstone requires its append and merge. Module 06 may demonstrate reshaping when reshaping is not part of the capstone. For Option B, the approved proposal can identify Module 07 evidence for append and/or merge when the corresponding operation does not apply to the student's data. Applicable operations and checks must still appear in the capstone.

The final memo explains why an operation does not apply and identifies the exact Canvas assignment, filename, and script section that demonstrates it. The instructor verifies that the cited evidence meets the same competency standard. Missing or inadequate evidence requires correction before badge completion. All Module 00–09 assignments remain required for both options.

## What Counts As Badge Evidence

Badge evidence should show that the student can perform the workflow, not just describe it. Acceptable evidence includes:

- scripts that run from the repository root,
- logs or text records showing script execution,
- analysis-ready output files generated by the script,
- codebooks or data dictionaries,
- QA reports with checks and warnings,
- sample construction tables,
- merge or append diagnostics,
- short memos explaining data decisions,
- and checklist responses tied to module or capstone competencies.

Module assignments use their assigned teaching data. Option B capstones use only instructor-approved publicly distributable data under the [data policy](course-policies.md#capstone-data-options). Private, restricted, confidential, identifiable respondent data, student records, and data whose terms prohibit redistribution are not eligible.

## Completion Threshold

Badge completion requires:

- completion of orientation and the Module 00–09 assignments as required badge evidence,
- submission of the Module 10 capstone portfolio through Canvas,
- and a passing capstone grade showing that the required course evidence demonstrates the badge competencies.

The passing capstone grade in Canvas records completion. The instructor then notifies the micro registrar to issue the badge. See the [course policies](course-policies.md) for the completion window, submission process, and revision limit.

## Competency Evaluation

Instructors should evaluate whether the capstone portfolio demonstrates competency in the following areas:

- project organization and reproducible workflow design,
- raw data protection,
- importing and inspecting approved source data,
- variable cleaning, typing, labeling, and recoding,
- missing-data handling and analytic sample construction,
- reshaping or restructuring data where applicable,
- appending and merging files with diagnostic checks,
- QA checks and unresolved issue documentation,
- reproducible output generation,
- data dictionary or codebook quality,
- workflow memo clarity,
- and appropriate use of the student's selected software pathway.

Evaluation should prioritize evidence of transparent, defensible decisions. A portfolio does not need to be perfect, but it should make remaining issues visible and should not hide or silently drop cases.

The capstone portfolio should be evaluated with `rubrics/capstone-rubric.md`, which uses four competency-based levels: Complete / badge-ready, Minor revision needed, Major revision needed, and Not yet demonstrated.

## Revision And Resubmission Policy

Students may submit **two capstone revisions after the initial submission**, for up to three submissions in total. The instructor provides targeted feedback through Canvas on missing evidence, unclear documentation, failed checks, or reproducibility problems. Each resubmission includes a brief explanation of what changed.

The completion window runs from registration until seven calendar days before CU's semester grade-submission deadline. Submit all required work and revisions by the cutoff posted in Canvas. This leaves the instructor one week to finish grading and submit student grades to the registrar. Students should submit early enough to use their revision opportunities.

No peer review is required. The dual pathway remains optional.

## Instructor Review Process

Recommended review steps:

1. Confirm the data option. For Option B, check the approved proposal, publicly distributable sources, versions, terms, and instructor access to the inputs.
2. Confirm that the submitted script runs from the project root or that the student clearly documents any required setup.
3. Confirm that raw files were not manually edited.
4. Review the generated analysis-ready dataset or output evidence.
5. Review the data dictionary or codebook.
6. Review QA evidence for missing data, variable coding, identifiers, sample restrictions, and applicable transformations. Review the exact Module 06/07 evidence identified in the approved plan for operations that do not apply.
7. Review the workflow memo for plain-language explanation of major decisions.
8. Confirm that the required module assignments are present and demonstrate the corresponding competencies.
9. Record feedback and the capstone grade in Canvas, applying the two-revision limit and course cutoff.
10. After a passing capstone grade records completion, notify the micro registrar to issue the badge.
11. Submit student grades to the registrar by CU's semester deadline.

## Adaptation For A 1-Credit Course

For a 1-credit graduate course, the same assessment structure can be converted into a graded framework. A possible grade distribution is:

- module assignments and checklists: 40 percent,
- participation or lab engagement: 20 percent,
- capstone data management portfolio: 40 percent.

These weights are an example for a future credit adaptation, not the current badge grading scheme. IBS and the academic unit would determine credit-specific grading, contact-hour, and transcript requirements. The current course policies specify Canvas submissions, required module evidence, two capstone revisions, optional dual-pathway work, and no required peer review.

## Implementation Policies And Offering Setup

Delivery policies and capstone data options are described in [Course completion and badge policies](course-policies.md). Before each offering, the instructor configures Canvas, posts the semester-specific cutoff, confirms software access, and prepares the micro registrar notification process. Institutional approval or wording for a future credit adaptation remains separate from these course policies.

## Files To Keep Aligned

- `modules/10-capstone/assignment.md`
- `assignments/capstone-data-management-portfolio.md`
- `assignments/capstone-data-proposal.md`
- `rubrics/capstone-rubric.md`
- `rubrics/module-checklist-rubric.md`
- `syllabus/badge-competencies.md`
