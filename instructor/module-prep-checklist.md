# Module Prep Checklist

Instructor-facing checklist for preparing each module before teaching or opening it to students.

## Before The Course Opens

- [ ] Confirm that `README.md` at the repository root states the course purpose and data policy.
- [ ] Confirm that `.gitignore` excludes `data/raw/`, `data/working/`, `data/output/`, `logs/`, temporary files, Stata backups, R history files, and system files.
- [ ] Regenerate synthetic teaching data from `code/r/create-synthetic-data.R` if needed.
- [ ] Confirm that generated teaching files in `data/synthetic/` match the documentation.
- [ ] Confirm that no private, restricted, licensed, confidential, or student data are present.
- [ ] Decide whether the offering uses Stata pathway, R pathway, or dual Stata/R pathway submissions.
- [ ] Decide where students submit generated outputs that should not be committed to GitHub.
- [ ] Review `syllabus/badge-competencies.md`, `rubrics/capstone-rubric.md`, and `rubrics/module-checklist-rubric.md`.

## For Each Module

- [ ] Read the module `README.md`.
- [ ] Read the student-facing `lesson.md`.
- [ ] Read the `assignment.md`.
- [ ] Read the `checklist.md`.
- [ ] Read instructor-facing `solution_notes.md`.
- [ ] Confirm that student-facing files do not reveal instructor solution notes.
- [ ] Confirm that assignment instructions match the pathway policy.
- [ ] Confirm that Stata and R labs are substantively parallel.
- [ ] Confirm that file paths are relative to the repository root.
- [ ] Confirm that labs write generated files only to ignored folders such as `data/working/`, `data/output/`, and `logs/`.
- [ ] Confirm that the module uses only synthetic or publicly distributable data.

## Technical Prep

- [ ] Run the Stata lab or review it using `instructor/stata-lab-smoke-test-checklist.md`.
- [ ] Run the R lab using `instructor/r-lab-smoke-test-checklist.md`.
- [ ] Confirm that required R packages are installed.
- [ ] Confirm that Stata can import CSV and Excel files where needed.
- [ ] Confirm that expected logs or reports are created.
- [ ] Confirm that generated files are not accidentally staged for commit.
- [ ] Note any expected warnings students may see.

## Teaching Prep

- [ ] Identify the module's key concept in one sentence.
- [ ] Identify the most likely beginner error for the module.
- [ ] Prepare a short demo using the synthetic data.
- [ ] Prepare one debugging example, such as a wrong working directory or missing package.
- [ ] Decide whether students will submit screenshots, log excerpts, generated files through an LMS, or written summaries.
- [ ] Decide how much time students should spend on the parallel pathway conceptually.

## After Teaching

- [ ] Record common student errors for future offerings.
- [ ] Note any lab steps that need clearer comments.
- [ ] Note any instructions that caused pathway confusion.
- [ ] Update instructor notes, not student-facing solution text, if grading guidance changes.
- [ ] Confirm that no generated files from `data/working/`, `data/output/`, or `logs/` are committed.
