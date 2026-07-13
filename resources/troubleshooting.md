# Troubleshooting Guide

This guide lists common problems and first fixes. If you feel stuck, slow down and read the error message carefully. Most errors are fixable.

When asking for help, include:

- the module number,
- whether you are using Stata or R,
- the exact error message,
- the line where the script stopped,
- and what `pwd` in Stata or `getwd()` in R shows.

## File Not Found

What it may look like:

- Stata: `file ... not found`
- R: `cannot open file`
- R: `No such file or directory`

Likely causes:

- You are not running the script from the repository root.
- The file path is misspelled.
- The file is in a different folder.
- The file was not generated yet.

Try:

1. Check your working directory:
   - Stata: `pwd`
   - R: `getwd()`
2. Confirm you can see the file in the repository.
3. Check spelling, capitalization, and file extension.
4. Rerun earlier steps that create the file.

For an R lab, run from the repository root with a command such as:

```r
source("modules/03-data-documentation/r_lab.R")
```

## Package Not Installed

What it may look like in R:

```text
there is no package called 'dplyr'
```

Try:

```r
install.packages("dplyr")
```

For several common course packages:

```r
install.packages(c("dplyr", "tidyr", "stringr", "readr", "readxl", "janitor", "skimr", "haven", "openxlsx"))
```

You can also run `source("code/r/check-r-dependencies.R")` from the repository root to see which required packages are missing. Then rerun the script. If installation fails on a campus computer, ask your instructor about the approved setup.

## Object Not Found

What it may look like in R:

```text
object 'survey_raw' not found
```

Likely causes:

- You ran a later line before running the line that creates the object.
- The object name is misspelled.
- You restarted R and did not rerun the script from the top.

Try:

1. Restart R.
2. Run the full script from the top.
3. Check spelling and capitalization.
4. Look for the line where the object is first created.

## Permission Denied

What it may look like:

- Stata or R cannot write a file.
- The script fails when saving to `data/output/` or `logs/`.
- Your computer says the file is locked.

Likely causes:

- The file is open in Excel or another program.
- You do not have write permission in the folder.
- A cloud-sync folder is locking the file.
- A campus lab environment restricts saving.

Try:

1. Close the file if it is open in another program.
2. Make sure the repository is in a folder where you can save files.
3. Try rerunning after closing Excel, Stata Viewer windows, or preview tools.
4. Ask your instructor where files should be saved in a lab or remote system.

## Working Directory Confusion

What it may look like:

- Some files are found but others are not.
- Outputs appear in a folder you did not expect.
- A script works one day and fails the next.

Try:

1. Check:
   - Stata: `pwd`
   - R: `getwd()`
2. Make sure the result is the repository root.
3. Open the repository folder as your RStudio/Positron project if using R.
4. In Stata, start from the repository folder before running module do-files.

Avoid fixing this by pasting in an absolute path. That may work once but can break reproducibility.

## Unexpected Missing Values

What it may look like:

- A variable has more missing values than expected.
- `NA` appears in R after type conversion.
- Stata shows `.` after recoding.
- Means or counts look strange.

Likely causes:

- Special codes such as `-8`, `-9`, `999`, `DK`, `Refused`, or `Not asked`.
- Text values in numeric-looking columns.
- Type conversion changed values that could not be parsed.

Try:

1. Tabulate or inspect the raw values before recoding.
2. Check the data dictionary.
3. Document which special codes become missing.
4. Compare raw and cleaned variables.

## Merge Mismatch

What it may look like:

- Some rows do not match after a merge or join.
- Stata `_merge` shows unmatched records.
- R `anti_join()` returns rows.
- Row counts change unexpectedly.

Likely causes:

- Keys are misspelled or differently capitalized.
- Region names have extra spaces.
- One file has keys that the other file does not have.
- The key is not unique where it should be.

Try:

1. Inspect the key variables in both files.
2. Trim spaces and standardize capitalization if appropriate.
3. Check duplicates before merging.
4. Count matched and unmatched rows.
5. Document unmatched cases instead of ignoring them.

## Duplicate IDs

What it may look like:

- Stata says variables do not uniquely identify observations.
- R duplicate checks show repeated `respondent_id` and `year`.
- A join creates more rows than expected.

Likely causes:

- `respondent_id` repeats across years.
- The correct key is `respondent_id` plus `year`.
- The synthetic data include intentional duplicate teaching cases.

Try:

In Stata:

```stata
duplicates report respondent_id year
duplicates list respondent_id year
```

In R:

```r
dplyr::filter(dplyr::count(person, respondent_id, year), n > 1)
```

Do not drop duplicates automatically. First decide whether they are expected repeated measures, intentional teaching problems, or true errors.

## Stata Variable Not Found

What it may look like:

```text
variable gender_clean not found
```

Likely causes:

- The variable has not been created yet.
- The variable name is misspelled.
- Import changed the name.
- You ran only part of the do-file.

Try:

```stata
describe
```

Then check whether the variable exists and how it is spelled. Rerun the do-file from the top if needed.

## Stata Smoke-Test Or Log Problems

What it may look like:

- The instructor smoke test reports that one module failed.
- A module log is missing from `logs/`.
- Stata says a log is already open.
- The smoke-test summary is written to `logs/stata-smoke-tests/`, but one module returned an error code.

Try:

1. Confirm Stata is running from the repository root.
2. Run the failing module manually, for example:

```stata
do modules/03-data-documentation/stata_lab.do
```

3. If Stata says a log is already open, run:

```stata
capture log close
```

4. Check whether Stata can write to `logs/`, `data/working/`, and `data/output/`.
5. Review `instructor/stata-lab-smoke-test-checklist.md` and `instructor/stata-version-notes.md` if you are preparing the course for launch.

## R Column Not Found

What it may look like:

```text
Column `gender_clean` doesn't exist
```

Likely causes:

- The column has not been created yet.
- The column name is misspelled.
- A previous `select()` dropped it.
- Name cleaning changed it.

Try:

```r
names(person)
```

Then check the exact spelling. Restart R and rerun the script from the top if the object may be stale.

## When You Still Feel Stuck

Send your instructor:

- the module number,
- Stata or R pathway,
- the exact error message,
- the line that failed,
- what `pwd` or `getwd()` shows,
- and what you tried already.

You are not expected to debug everything alone. Learning how to ask a precise debugging question is part of the course.
