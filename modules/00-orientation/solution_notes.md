# 00 Orientation Solution Notes

Instructor-facing notes. Do not copy this content into student-facing files.

## Module Intent

This module should lower the barrier to entry. Students should leave orientation able to find the repository folders, identify their software pathway, understand why raw data are protected, and run a small setup script. The technical goal is basic access, not data cleaning.

## Expected Student Outputs

Students should submit:

- a repository tour note,
- a pathway and workflow reflection,
- a completed orientation checklist,
- and evidence that their Stata or R setup lab ran.

Accept either Stata or R setup evidence unless the course section explicitly requires both.

## Expected Setup Evidence

The setup labs should create one or more of:

- `logs/module-00-stata-log.txt`,
- `data/output/module-00-stata-setup-check.txt`,
- `logs/module-00-r-log.txt`,
- `data/output/module-00-r-setup-check.txt`.

Generated files are ignored by Git and should not be committed as course materials.

## What To Look For

Strong orientation submissions should show that students can:

- identify `modules/`, `data/synthetic/`, `data/working/`, `data/output/`, and `logs/`,
- distinguish student-facing files from `solution_notes.md`,
- explain that raw or synthetic source files should not be manually edited,
- describe whether they expect to use Stata, R, or both,
- connect later module work to the final capstone portfolio.

## Common Setup Problems

- Script run from the wrong working directory.
- Repository downloaded but not unzipped or opened as the project root.
- RStudio or Positron opened in a different folder.
- Stata current directory set somewhere outside the repository.
- Student edits a synthetic CSV file while trying to inspect it.
- Student worries that a setup warning means they are not ready for the course.

## Troubleshooting Guidance

For R users, ask students to run:

```r
getwd()
file.exists(file.path("data", "synthetic", "synthetic_gss_like_person_2024.csv"))
```

For Stata users, ask students to run:

```stata
pwd
confirm file "data/synthetic/synthetic_gss_like_person_2024.csv"
```

If either file check fails, the most likely issue is that the script is not being run from the repository root.

## Grading Emphasis

Suggested review emphasis:

- 30 percent: setup lab evidence.
- 30 percent: repository tour note.
- 25 percent: pathway and workflow reflection.
- 15 percent: completed checklist and clarity of questions for follow-up.

Do not grade students down for choosing one pathway if the course section allows one-pathway completion.

## Instructor Follow-Up

Before Module 01, confirm:

- students know which software pathway is required,
- students know where to ask for setup help,
- students understand generated files in `data/output/`, `data/working/`, and `logs/` are ignored by Git,
- and students understand that the capstone will build from small module-level workflow habits.
