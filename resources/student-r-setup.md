# Student R Setup Guide

This guide is for students who are new to R, RStudio, Positron, or R scripts. It is normal for R to feel strange at first. You are learning both software habits and data workflow habits.

## What R Does In This Course

In this microcredential, R is used to:

- read synthetic teaching data,
- inspect variables,
- clean and recode data,
- check missing values,
- reshape and combine files,
- write reports and logs,
- and save working or analysis-ready datasets.

You will usually work by running an `.R` script.

## Installing R

R is the programming language. You need R installed before RStudio or Positron can run R code.

General steps:

1. Go to the official R project website.
2. Download R for your operating system.
3. Install R using the default options unless your instructor says otherwise.
4. Open R once to confirm it starts.

If you are using a campus-managed computer, R may already be installed or package installation may be restricted. Ask your instructor if installation fails.

## Installing RStudio Or Positron

RStudio and Positron are editors that make it easier to work with R scripts.

You may use either:

- RStudio Desktop,
- Positron,
- or another editor approved by your instructor.

After installation, open the course repository folder as your project or working folder. This helps R start in the correct place.

## Opening R Scripts

R scripts end in `.R`.

Examples in this course:

- `modules/00-orientation/r_lab.R`
- `modules/01-project-workflows/r_lab.R`
- `modules/10-capstone/r_lab.R`

To open a script:

1. Open RStudio or Positron.
2. Open the course repository folder.
3. Use the Files pane or File > Open to open the script.
4. Read the comments at the top.

Comments in R begin with `#`. They explain the code but do not run as commands.

## Running Code

There are two common ways to run R code:

- Run the whole script.
- Run one section or line at a time.

When you are learning, running section by section can help you see what each part does. Before submitting work, restart R and run the full script from the top. This checks that your script does not depend on old objects left in memory.

In RStudio, common options include:

- Run the current line or selection.
- Source the full script.
- Restart R, then run all code again.

## Installing Packages

Packages add functions to R. Some course labs use packages such as:

- `dplyr`
- `tidyr`
- `stringr`
- `readr`
- `readxl`
- `janitor`
- `skimr`
- `haven`
- `openxlsx`

To install packages, run:

```r
install.packages(c(
  "dplyr",
  "tidyr",
  "stringr",
  "readr",
  "readxl",
  "janitor",
  "skimr",
  "haven",
  "openxlsx"
))
```

You usually install a package once. You load a package each time you start a new R session if the script uses `library(package_name)`.

Example:

```r
library(dplyr)
library(stringr)
```

Some scripts use `package::function()`, such as `readr::read_csv()`. This tells R exactly which package a function comes from.

## Checking Packages

The repository includes a setup helper that checks whether the required R packages are installed. From the repository root, run:

```r
source("code/r/check-r-dependencies.R")
```

The checker lists required packages, reports what is installed, and prints an `install.packages()` command if anything is missing. It does not install packages automatically.

## Checking The Working Directory

The working directory is where R is currently looking for files.

Run:

```r
getwd()
```

For this course, you usually want the working directory to be the repository root, the main folder named something like:

```text
ibs-data-wrangling-microcredential
```

If R is looking in the wrong folder, paths such as `data/synthetic/synthetic_gss_like_person_2024.csv` will not work.

## Relative Paths

A relative path starts from the project folder.

Example:

```r
readr::read_csv("data/synthetic/synthetic_gss_like_person_2024.csv")
```

This means:

1. Start in the repository root.
2. Open `data`.
3. Open `synthetic`.
4. Read the CSV file.

Avoid paths that only work on your computer, such as these example absolute paths:

```text
/Users/yourname/Desktop/course/data/synthetic/synthetic_gss_like_person_2024.csv
C:\Users\yourname\Downloads\course\data\synthetic\synthetic_gss_like_person_2024.csv
```

## Reading Error Messages

R error messages can look intense, but they usually give clues.

Common patterns:

- `object not found`: R does not know about an object because it has not been created yet or the name is misspelled.
- `there is no package called`: a package needs to be installed.
- `could not find function`: a package may need to be loaded, or the function name is misspelled.
- `cannot open file`: R cannot find the file path.
- `undefined columns selected`: a column name is wrong or was changed earlier.

When an error appears:

1. Read the first error line.
2. Check the line of code that caused it.
3. Check spelling and capitalization.
4. Restart R and rerun the script from the top.
5. Check `getwd()` if a file cannot be found.

## First Setup Check

Start with Module 00:

1. Open the repository folder in RStudio or Positron.
2. Open `modules/00-orientation/r_lab.R`.
3. Run the full script.
4. Check that R found `data/synthetic/synthetic_gss_like_person_2024.csv`.
5. Check that the lab created:
   - `logs/module-00-r-log.txt`
   - `data/output/module-00-r-setup-check.txt`

If this works, your R setup is ready for the first module.

## When To Ask For Help

Ask for help if:

- you cannot install R,
- RStudio or Positron cannot find R,
- packages will not install,
- `getwd()` shows a folder you do not recognize,
- a script cannot find a file,
- or you get the same error after restarting R and running the script from the top.

When asking for help, include:

- the module number,
- the script name,
- the error message,
- what `getwd()` shows,
- and the line where the script stopped.
