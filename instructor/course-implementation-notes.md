# Course Implementation Notes

Instructor-facing notes for launching and maintaining the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential.

## Launch Readiness

Before opening the course:

- [ ] Confirm pathway policy for the offering: Stata, R, or dual Stata/R.
- [ ] Confirm whether module assignments are formative or required badge evidence.
- [ ] Confirm capstone submission mechanism.
- [ ] Confirm whether generated outputs are uploaded to an LMS, shared drive, or other approved location.
- [ ] Confirm Stata access plan.
- [ ] Confirm R package installation plan.
- [ ] Regenerate synthetic data if needed.
- [ ] Run Stata and R smoke tests.
- [ ] Review rubrics and badge competencies.
- [ ] Check that no generated working/output/log files are staged for commit.

## Recommended Communication To Students

At the start of the course, tell students:

- This is a data management course, not a statistics modeling course.
- You will work with synthetic data only.
- You should not edit raw data manually.
- You may complete the Stata pathway, R pathway, or dual pathway depending on the offering.
- One primary pathway is sufficient unless the instructor requires both.
- The capstone portfolio is the main badge evidence.
- Errors are expected; the goal is to learn how to debug and document.

## Submission Strategy

Recommended:

- Students commit or submit scripts, memos, codebooks, checklists, and documentation.
- Generated datasets, logs, and outputs are uploaded through an approved system when review is needed.
- Students do not commit generated files from `data/working/`, `data/output/`, or `logs/`.

If an instructor wants students to submit generated files through GitHub, repository policy and `.gitignore` should be reviewed first.

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

Use synthetic or publicly distributable teaching data only.

Do not use:

- private data,
- student data,
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

1. Confirm approved synthetic data were used.
2. Confirm the selected pathway.
3. Confirm the script runs or review the documented execution evidence.
4. Review raw data protection and relative paths.
5. Review cleaning and recoding decisions.
6. Review missing-data handling.
7. Review append/merge/key diagnostics.
8. Review QA evidence.
9. Review analysis-ready dataset and codebook.
10. Review workflow memo.
11. Apply `rubrics/capstone-rubric.md`.
12. Return targeted revision notes if needed.

## Known Implementation Decisions To Finalize

IBS or the instructor should decide:

- completion window for self-paced students,
- number of allowed capstone revisions,
- whether peer review is required,
- whether dual-pathway work is optional or required,
- how generated files are submitted,
- whether module assignments count as required badge evidence,
- and how badge completion is recorded.
