# Write Module Skill

Use this skill when drafting or revising a full course module for **Quantitative Data Management and Workflow for Social Scientists**.

## Goals

- Write for graduate social science students with limited coding experience.
- Explain why the workflow matters before showing commands.
- Keep Stata and R examples substantively parallel.
- Use only synthetic or publicly distributable teaching data, preferably `synthetic_gss_like`.
- Keep student-facing material separate from instructor-only solution notes.

## Module Files

Each module should include:

- `README.md`: purpose, objectives, outputs, Stata skills, R skills, pitfalls, estimated time, capstone connection.
- `lesson.md`: beginner-friendly conceptual explanation and worked examples.
- `stata_lab.do`: commented Stata workflow.
- `r_lab.R`: commented R workflow parallel to the Stata lab.
- `assignment.md`: student-facing task instructions and submission checklist.
- `solution_notes.md`: instructor-facing expected outputs, grading notes, and troubleshooting.
- `checklist.md`: competency checklist students can use before submitting.

## Writing Rules

- Use plain language and define new terms.
- Include common mistakes and debugging tips.
- Use relative paths.
- Never ask students to edit raw data manually.
- Do not include instructor answers, grading notes, or solution text in `README.md`, `lesson.md`, `assignment.md`, labs, or `checklist.md`.
- Do not commit generated data from `data/working/`, `data/output/`, or `logs/`.

## Before Finishing

- Confirm all seven module files exist.
- Confirm Stata and R workflows use the same teaching dataset and teach the same concept.
- Confirm code examples include comments.
- Confirm student-facing files do not reveal instructor solution notes.
