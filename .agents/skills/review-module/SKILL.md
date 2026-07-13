# Review Module Skill

Use this skill when reviewing a module for completeness, consistency, and readiness.

## Review Scope

Check these files:

- `README.md`
- `lesson.md`
- `stata_lab.do`
- `r_lab.R`
- `assignment.md`
- `solution_notes.md`
- `checklist.md`

## Completeness Checks

- The README states purpose, objectives, outputs, Stata skills, R skills, pitfalls, time, and capstone connection.
- The lesson explains why the skill matters before showing code.
- The Stata and R labs use the same synthetic dataset and teach parallel workflows.
- The assignment matches the lesson and labs.
- The checklist includes observable competencies.
- The solution notes contain instructor-only guidance.

## Safety and Separation Checks

- Student-facing files do not reveal answers, grading notes, or instructor solution text.
- All data are synthetic or publicly distributable.
- Raw data are protected and not manually edited.
- Generated files from `data/working/`, `data/output/`, and `logs/` are not committed unless intentionally allowed.
- File paths are relative.

## Code Checks

- Code examples include comments.
- Stata and R examples are substantively parallel.
- Labs include common inspection or validation steps.
- Labs include debugging hints for likely beginner errors.
- Scripts can be run from the repository root.

## Review Output

Report findings in this order:

1. Blocking issues.
2. Important improvements.
3. Minor polish.
4. What is working well.
5. Suggested next steps.
