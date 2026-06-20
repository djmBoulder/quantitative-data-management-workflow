# 00 Orientation Assignment

## Purpose

This assignment helps you make sure you can navigate the course repository, understand the file structure, and run a small setup check in your software pathway. The goal is not to clean data yet. The goal is to start the course with the repository, data folders, and capstone expectations in view.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/README.md`
- `data/synthetic/data-dictionary.md`

These files are synthetic. Do not edit the CSV manually.

## Tasks

1. Read `README.md` at the repository root.
2. Read `modules/00-orientation/README.md`.
3. Open `data/synthetic/README.md` and identify the four synthetic teaching files.
4. Open `data/synthetic/data-dictionary.md` and identify the unit of observation for the person-level files.
5. Choose your course pathway: Stata, R, or dual Stata/R, based on your instructor's directions.
6. Run the Module 00 setup lab for your pathway:
   - Stata: `modules/00-orientation/stata_lab.do`
   - R: `modules/00-orientation/r_lab.R`
7. Confirm that the lab created a setup report in `data/output/` and a log in `logs/`.
8. Write a short repository tour note.
9. Write a short pathway and workflow reflection.
10. Complete the orientation checklist.

## Repository Tour Note

In 150 to 250 words, answer:

- Where are module materials stored?
- Where are synthetic data files stored?
- What is the difference between `data/synthetic/`, `data/working/`, and `data/output/`?
- Which files are student-facing?
- Which file type is instructor-facing and should not be used as assignment instructions?

## Pathway And Workflow Reflection

In 100 to 150 words, answer:

- Which pathway do you expect to use in this course: Stata, R, or dual Stata/R?
- If you choose the dual pathway, what extra practice or research-team need motivates that choice?
- What is one workflow habit you want to improve?
- Why should raw or synthetic source data not be edited manually?
- How do you think the capstone portfolio will build across the modules?

## Expected Generated Files

Depending on your pathway, the setup lab should create:

- `logs/module-00-stata-log.txt`
- `data/output/module-00-stata-setup-check.txt`
- `logs/module-00-r-log.txt`
- `data/output/module-00-r-setup-check.txt`

These generated files are ignored by Git. Do not commit them unless your instructor explicitly asks for them.

## Submission Checklist

Submit:

- Your repository tour note.
- Your pathway and workflow reflection.
- Your completed orientation checklist.
- A copied excerpt or screenshot showing that your setup lab found the synthetic data file and wrote the setup report.

Do not submit generated data files unless your instructor asks for them.
