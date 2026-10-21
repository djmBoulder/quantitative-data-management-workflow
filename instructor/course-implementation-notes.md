# Course Implementation Notes

Instructor-facing notes for launching and maintaining the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential.

## Launch Readiness

Before opening the course:

- [ ] Scaffold the Canvas course with Modules 00–10, enrollment instructions, assignments, rubrics, and grade records.
- [ ] Post the [course policies](../syllabus/course-policies.md), including optional dual-pathway work and no required peer review.
- [ ] Make Module 00–09 assignment submissions part of required badge evidence in Canvas.
- [ ] Confirm CU's semester grade-submission deadline, subtract seven calendar days, and post the course cutoff date and time in Canvas.
- [ ] Configure the capstone for an initial submission and up to two revisions before the cutoff.
- [ ] Add the student-selected data proposal to Canvas, explain that approval precedes Option B work, and record approved inputs, scope, retrieval/submission arrangements, and Module 06/07 evidence locations.
- [ ] Check Canvas uploads for required scripts, datasets, logs, memos, codebooks, and QA evidence.
- [ ] Prepare the process for notifying the micro registrar after a passing capstone grade and for submitting student grades to the registrar.
- [ ] Confirm Stata access and R package installation.
- [ ] Regenerate synthetic data if needed and run Stata and R smoke tests.
- [ ] Review rubrics and badge competencies.
- [ ] Check that no generated working/output/log files are staged for commit.

## Recommended Communication To Students

At the start of the course, tell students:

- The course prepares data-management skills for later quantitative methods work.
- Use assigned synthetic data for the module work. For the capstone, choose the synthetic option or obtain approval through the proposal for publicly distributable student-selected data. Preserve all source files.
- Approved Module 06/07 evidence can demonstrate specified capstone operations that do not apply; all module assignments remain required.
- Enroll, follow the module sequence, submit assignments, and receive feedback and grades in Canvas.
- One primary Stata or R pathway is sufficient. The dual pathway is optional.
- Module assignments count as required badge evidence alongside the capstone.
- The completion window runs from registration to the Canvas cutoff, seven calendar days before CU's semester grade-submission deadline.
- Two capstone revisions are allowed after the initial submission, within that window. Submit early enough for feedback.
- No peer review is required.
- A passing capstone grade in Canvas records completion. The instructor then notifies the micro registrar to issue the badge.
- Errors are expected; use feedback to improve and document the workflow.

## Submission Strategy

Canvas is the submission system for all assignments and the capstone. Students upload the scripts, memos, codebooks, checklists, generated datasets, logs, and other evidence requested by each assignment. Canvas also holds instructor feedback and grades.

The repository supplies teaching materials. Keep student-selected capstone data out of both course repositories; use the approved Canvas submission or input-retrieval arrangement. Students keep generated files from `data/working/`, `data/output/`, and `logs/` out of GitHub. Keep instructor solution notes out of the student-facing Canvas sequence.

## Maintaining Student/Instructor Separation

Keep instructor guidance in:

- `instructor/`
- module `solution_notes.md`
- rubrics when intended for instructor review

Keep student-facing instructions in:

- module `README.md`
- module `lesson.md`
- module `assignment.md`
- module `checklist.md`
- `resources/`
- relevant syllabus files

Do not place answer keys, expected exact outputs, grading notes, or troubleshooting shortcuts in student-facing files unless they are intentionally part of the lesson.

## Data Policy

Use assigned synthetic data for the guided labs and Module 00–09 assignments. Option B capstones may use instructor-approved publicly distributable data under the [data policy](../syllabus/course-policies.md#capstone-data-options). Review the [proposal](../assignments/capstone-data-proposal.md) before work begins, including source terms, versions, scope, and instructor access. Confirm subsequent changes in Canvas. Instructor approval cannot waive the data restrictions.

Do not use:

- private data,
- student records,
- restricted data,
- licensed data that cannot be redistributed,
- confidential data,
- identifiable respondent data.

The `synthetic_gss_like` data are designed to provide realistic teaching problems without exposing real respondents.

## Version Control Guidance

Before launch and after major updates:

- Run `git status --short`.
- Look for generated files in `data/working/`, `data/output/`, or `logs/`.
- Confirm that documentation changes are intentional.
- Confirm that synthetic teaching files are reproducible from code where applicable.
- Avoid committing local machine files such as `.DS_Store` or R history files.

## Suggested Facilitation Rhythm

For each module:

1. Begin with the concept: why this workflow matters.
2. Show where the module files live.
3. Run or demonstrate a small part of the lab.
4. Pause for students to check working directory and paths.
5. Have students run the primary-pathway lab.
6. Ask students to inspect generated evidence.
7. Discuss common errors.
8. Connect the module output to the capstone portfolio.

## Capstone Review Workflow

Recommended review order:

1. Confirm Option A synthetic inputs or the approved Option B public inputs, source versions, redistribution terms, and instructor access to exact files.
2. Confirm the selected pathway.
3. Confirm the script runs or review the documented execution evidence.
4. Review raw data protection and relative paths.
5. Review cleaning and recoding decisions.
6. Review missing-data handling.
7. Review applicable reshape/append/merge diagnostics. For each operation that does not apply, inspect the approved Module 06/07 evidence and verify competency; a citation alone is insufficient.
8. Review QA evidence.
9. Review analysis-ready dataset and codebook.
10. Review workflow memo.
11. Apply `rubrics/capstone-rubric.md`.
12. Confirm that all required module assignment evidence is complete.
13. Return targeted feedback through Canvas if needed, allowing up to two capstone revisions after the initial submission before the course cutoff.
14. Record the passing capstone grade in Canvas when the required course evidence demonstrates competency. This records badge completion.
15. Notify the micro registrar to issue the badge.
16. Submit student grades to the registrar by CU's semester deadline.

## Course Delivery Policies

Use the [course policies](../syllabus/course-policies.md) as the reference for delivery, completion, and capstone data options.

| Area | Policy |
| --- | --- |
| Self-paced completion window | Registration through one week (seven calendar days) before CU's semester grade-submission deadline. Post the actual cutoff in Canvas each semester. The remaining week is for grading and submission of student grades to the registrar. |
| Capstone revisions | Two revisions after the initial submission, completed before the course cutoff. |
| Peer review | No peer review is required. |
| Software pathway | One primary Stata or R pathway. Dual Stata/R work is optional. |
| Course delivery | Scaffold the course in Canvas for enrollment, assignment submissions, feedback, and grades. |
| Module evidence | Module 00–09 assignments count as required badge evidence. |
| Capstone data | Course-provided synthetic data or instructor-approved publicly distributable student-selected data, with a proposal approved in Canvas before Option B work begins. |
| Evidence for operations that do not apply | Module 06 can demonstrate reshape; for an inapplicable Option B append and/or merge, Module 07 can demonstrate the skill. Record exact evidence locations and verify competency. |
| Completion and badge issuance | The student submits the capstone in Canvas and receives a passing grade. The instructor then notifies the micro registrar to issue the badge. |

Before each offering, implement these policies in Canvas and confirm the semester dates and software access.
