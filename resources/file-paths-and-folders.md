# File Paths And Folders

This guide explains how folders and file paths work in this course. If file paths feel confusing, you are in good company. Most beginning data problems are really folder problems.

## Repository Root

The repository root is the main course folder. It is the folder that contains top-level folders such as:

- `modules/`
- `data/`
- `resources/`
- `syllabus/`
- `assignments/`
- `rubrics/`

The repository root is the course repository folder, the folder containing `README.md`.

Most course scripts assume you are running code from this folder.

## Main Data Folders

### `data/raw/`

This folder is reserved for raw data in projects where raw files are used. In this course, do not add private, restricted, licensed, confidential, or student data here.

### `data/synthetic/`

This folder contains approved synthetic teaching data for the course.

Tracked course files include:

- `synthetic_gss_like_person_2024.csv`
- `synthetic_gss_like_person_2024.xlsx`
- `synthetic_gss_like_person_2025.csv`
- `synthetic_gss_like_region_context.csv`
- `synthetic_gss_like_repeated_measures_wide.csv`

These files are designed for learning. They are not real respondent data.

### `data/working/`

This folder is for generated intermediate files. A working file might be imported, cleaned, reshaped, or merged, but not yet final.

Examples:

- cleaned working `.dta` files,
- working `.rds` files,
- intermediate CSV files.

Files in `data/working/` should be reproducible from scripts.

### `data/output/`

This folder is for generated outputs.

Examples:

- QA reports,
- summary tables,
- codebooks,
- analysis-ready datasets,
- handoff memos.

Files in `data/output/` should be reproducible from scripts.

### `logs/`

This folder is for generated log files or text records that show a script ran.

Examples:

- `module-01-stata-log.txt`
- `module-01-r-log.txt`

Logs are evidence, but they are usually not committed to GitHub.

## Why Raw Data Should Not Be Edited

Raw or source data should be preserved so that another person can recreate your workflow.

Do not:

- open a CSV and change values by hand,
- delete rows manually,
- rename columns manually,
- save cleaned data over the source file,
- or use a spreadsheet program to silently change data types.

Instead, make changes in Stata or R scripts. That way your decisions are visible, reviewable, and repeatable.

## Relative Paths

A relative path starts from the repository root.

Example:

```text
data/synthetic/synthetic_gss_like_person_2024.csv
```

This path means:

1. Start in the repository root.
2. Open `data/`.
3. Open `synthetic/`.
4. Use `synthetic_gss_like_person_2024.csv`.

Relative paths are portable. They can work on your computer, your instructor's computer, or a campus lab computer as long as everyone has the same repository structure.

## Absolute Paths

An absolute path starts from the top of your computer's file system.

Mac example absolute path:

```text
/Users/yourname/Desktop/course-repository/data/synthetic/synthetic_gss_like_person_2024.csv
```

Windows example absolute path:

```text
C:\Users\yourname\Downloads\course-repository\data\synthetic\synthetic_gss_like_person_2024.csv
```

Absolute paths are fragile because they usually work only on one computer.

## Common Mac Path Problems

- The repository is inside Downloads, but the script expects a project folder.
- The path includes spaces or special characters.
- The file is actually in iCloud Drive and not fully downloaded.
- The script is run from the wrong working directory.

Try:

- Move the repository to a stable folder such as Documents or a course folder.
- Open the repository folder directly in RStudio/Positron or Stata.
- Check `pwd` in Stata or `getwd()` in R.

## Common Windows Path Problems

- Backslashes are copied into R strings without escaping.
- The repository is inside OneDrive and syncing causes permission issues.
- A path points to Downloads instead of the repository root.
- File extensions are hidden, so `file.csv` may actually be `file.csv.csv`.

Try:

- Use forward slashes in R paths, for example: `data/synthetic/synthetic_gss_like_person_2024.csv`.
- Keep the repository in a stable folder.
- Check `getwd()` or `pwd`.
- Turn on file extensions in Windows Explorer if filenames are confusing.

## How To Check Where You Are

In Stata:

```stata
pwd
```

In R:

```r
getwd()
```

If the result is not the repository root, file paths may fail.

## A Good Rule

If your path starts with `data/`, `modules/`, `logs/`, or `resources/`, you are probably using a relative course path.

If your path starts with your username, Desktop, Downloads, OneDrive, iCloud, or a drive letter, you are probably using an absolute path.
