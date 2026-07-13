# AGENTS.md

## Project purpose

This repository contains the curriculum, code labs, assignments, and instructor materials for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential for graduate students in the social sciences.

The course teaches parallel workflows in Stata and R. Materials should emphasize reproducibility, transparent data management, defensible analytic workflows, and preparation for graduate-level quantitative methods courses.

## Audience

Primary audience: incoming or early-stage graduate students in sociology, political science, geography, economics, education, communication, public health, environmental studies, and related social science programs.

Assume students have limited prior coding experience but may soon enter required statistics or quantitative methods sequences.

## Style rules

- Write clearly for beginners.
- Avoid unnecessary jargon.
- Explain why each workflow matters before showing code.
- Every code example should include comments.
- Stata and R examples should be substantively parallel whenever possible.
- Use synthetic or publicly distributable teaching data only.
- Do not include private, student, restricted, licensed, or confidential data.
- Do not commit generated data files from `data/working/` or `data/output/`.

## Repository conventions

Each module should include:

- `README.md`
- `lesson.md`
- `stata_lab.do`
- `r_lab.R`
- `assignment.md`
- `solution_notes.md`
- `checklist.md`

Use lowercase file names with hyphens unless language conventions require otherwise.

## Pedagogical structure

Each module should follow this structure:

1. Conceptual purpose
2. When students will use this skill
3. Core commands/functions
4. Stata example
5. R example
6. Common mistakes
7. Practice task
8. Checklist for competency

## Review guidelines

Before finalizing changes, verify that:

- Every module has both Stata and R materials.
- Student-facing files do not reveal instructor solution text.
- Code runs on synthetic data.
- File paths are relative.
- The same teaching dataset can support both Stata and R examples.
- README files clearly explain what a student should do.
