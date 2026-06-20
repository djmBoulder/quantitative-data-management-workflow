# Common Student Errors

Instructor-facing guide to common problems in the **Quantitative Data Management and Workflow for Social Scientists** microcredential.

Use this guide for troubleshooting and feedback. Keep solution-specific answers in `solution_notes.md` or other instructor-facing files.

## Working Directory Problems

Common symptoms:

- Stata says a file cannot be found.
- R reports `cannot open file`.
- Outputs are created in an unexpected folder.
- Relative paths work for the instructor but not the student.

Likely cause:

The student is not running the script from the repository root.

Instructor response:

- Ask the student to run `pwd` in Stata or `getwd()` in R.
- Have the student identify the repository root.
- Remind them that course paths usually begin with folders such as `data/`, `modules/`, or `logs/`.
- Avoid telling students to solve this with absolute paths.

## File Path Errors

Common symptoms:

- Paths include a personal Desktop or Downloads folder.
- Windows paths use backslashes inconsistently.
- A script works only on one computer.

Instructor response:

- Point students back to relative paths.
- Show a correct example such as `data/synthetic/synthetic_gss_like_person_2024.csv`.
- Remind students that reproducible workflows should run on another computer.

## Missing R Packages

Common symptoms:

- R reports `there is no package called 'dplyr'`.
- R reports that a function such as `read_excel()` or `pivot_longer()` cannot be found.

Likely packages:

- `dplyr`
- `tidyr`
- `stringr`
- `readr`
- `readxl`
- `janitor`
- `skimr`
- `haven`
- `openxlsx` for regenerating synthetic Excel files

Instructor response:

- Have students install missing packages with `install.packages("package_name")`.
- Confirm they load packages with `library(package_name)` when the lab expects it.
- Remind students that `package::function()` can call a function without `library()`.

## Stata Import Errors

Common symptoms:

- `file not found`
- Excel import fails.
- Variable names look different than expected.
- Numeric-looking variables import as strings.

Instructor response:

- Confirm the student is in the repository root.
- Confirm that `data/synthetic/synthetic_gss_like_person_2024.xlsx` exists for Module 02.
- Have students inspect with `describe` immediately after import.
- Remind students that import is not cleaning; type problems are expected teaching issues.

## R Object-Not-Found Errors

Common symptoms:

- `object 'survey_raw' not found`
- `object 'person' not found`
- A later line fails even though the code looks correct.

Likely cause:

The student ran only part of the script or skipped the line that creates the object.

Instructor response:

- Ask the student to restart R and run the script from the top.
- Explain that R objects live in memory and must be created during the session.
- Encourage students not to rely on objects left over from earlier attempts.

## Overwriting Raw Data

Common symptoms:

- Student saves cleaned data into `data/synthetic/`.
- Student edits a CSV manually in Excel.
- Student cannot recreate the original teaching problem.

Instructor response:

- Stop and restore the synthetic file from the repository or regenerate it from code.
- Explain raw versus working versus output data.
- Remind students to save generated files to `data/working/` or `data/output/`.
- Treat manual raw-data edits as a revision issue for capstone work.

## Merge And Key Problems

Common symptoms:

- Row counts grow unexpectedly after a merge.
- Duplicate IDs appear.
- Stata reports that variables do not uniquely identify observations.
- R joins create more rows than expected.
- Region context does not match all person rows.

Instructor response:

- Ask students to identify the key before merging.
- Use `isid`, `duplicates report`, or `duplicates list` in Stata.
- Use `count()`, `duplicated()`, `anti_join()`, or `distinct()` in R.
- Remind students that unmatched records are not automatically errors, but they must be diagnosed and documented.
- Warn against many-to-many merges as a way to silence errors.

## Special Missing Values

Common symptoms:

- Means are distorted by `-8`, `-9`, or `999`.
- `DK`, `Refused`, or `Not asked` appears as a valid category.
- R `NA` checks do not catch string missing codes.
- Stata missing values are misunderstood.

Instructor response:

- Ask students to tabulate raw values before recoding.
- Have students document what each special code means.
- In Stata, use `mvdecode` or explicit `replace` rules where appropriate.
- In R, use `na_if()`, `case_when()`, or string cleaning before recoding.
- Emphasize that missing-data decisions are research decisions.

## Confusing Student-Facing Files And Solution Notes

Common symptoms:

- Student refers to `solution_notes.md`.
- Student-facing files include answer keys or grading notes.
- Instructor copies expected outputs into a public lesson.

Instructor response:

- Remind students that `solution_notes.md` is instructor-facing.
- Keep grading notes in `instructor/` or `solution_notes.md`.
- If solution material appears in a student-facing file, revise before launch.

## Pathway Confusion

Common symptoms:

- Students think they must submit both Stata and R work.
- Students ignore the parallel pathway entirely.
- Dual-pathway students produce workflows with different data decisions.

Instructor response:

- State the offering policy at the start: Stata, R, or dual.
- Remind students that one primary pathway is sufficient unless the instructor requires both.
- Ask students to review the other pathway conceptually.
- For dual submissions, evaluate whether decisions are substantively parallel.

## Generated Files Accidentally Committed

Common symptoms:

- Files from `data/working/`, `data/output/`, or `logs/` appear in Git status.
- Students try to submit generated datasets by committing them.

Instructor response:

- Remind students that generated files are normally ignored by Git.
- Use LMS or another approved submission system for generated outputs.
- Check `.gitignore` before launch.
- Do not ask students to commit private or generated data unless the repository policy is intentionally changed.
