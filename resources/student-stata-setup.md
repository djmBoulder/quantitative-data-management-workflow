# Student Stata Setup Guide

This guide is for students who are new to Stata or who have never run a Stata do-file before. You do not need to be an expert before starting the course. The goal is to learn a repeatable workflow one small step at a time.

## What Stata Does In This Course

In this microcredential, Stata is used to:

- import synthetic teaching data,
- inspect variables,
- clean and recode data,
- check missing values,
- reshape and combine files,
- write logs,
- and save working or analysis-ready datasets.

You will usually work by running a `.do` file. A do-file is a plain-text script that stores Stata commands in the order you want them to run.

## Opening Stata

If Stata is installed on your computer:

1. Open Stata from your Applications folder, Start menu, or desktop shortcut.
2. Look for the main Stata windows: Results, Command, Variables, and Review.
3. Open the Do-file Editor from Stata's menu or toolbar.

If Stata is available only through a campus lab or remote system:

1. Follow your instructor's instructions for logging into the lab or remote desktop.
2. Open Stata inside that environment.
3. Make sure the course repository is available in the remote environment.
4. If the repository is not available, ask your instructor where course files should be stored.

Do not move course data into personal cloud folders unless your instructor tells you to. The course uses synthetic data, but the habit of storing data carefully matters.

## Opening A Do-File

A Stata do-file ends in `.do`.

Examples in this course:

- `modules/00-orientation/stata_lab.do`
- `modules/01-project-workflows/stata_lab.do`
- `modules/10-capstone/stata_lab.do`

To open a do-file:

1. Open Stata.
2. Open the Do-file Editor.
3. Use File > Open to find the `.do` file.
4. Read the comments at the top before running the file.

Comments in Stata often begin with `*` or `//`. Comments explain the code but do not run as commands.

## Running A Do-File

You can run a do-file from the Do-file Editor by clicking the run button. Your instructor may also show you how to run selected lines.

For this course, it is often best to run the full do-file from top to bottom. Running only the middle of a do-file can cause errors if earlier lines created folders, imported data, or opened logs.

If something fails:

1. Read the error message.
2. Look at the line that ran just before the error.
3. Check your working directory with `pwd`.
4. Ask whether Stata can find the file path shown in the code.

## Checking The Current Working Directory

The working directory is the folder where Stata is currently looking for files.

In Stata, type:

```stata
pwd
```

For this course, you usually want the working directory to be the repository root, the main folder named something like:

```text
ibs-data-wrangling-microcredential
```

If Stata is looking in the wrong folder, relative paths such as `data/synthetic/synthetic_gss_like_person_2024.csv` will not work.

## Relative Paths

A relative path starts from the project folder instead of from your whole computer.

Example:

```stata
import delimited "data/synthetic/synthetic_gss_like_person_2024.csv", clear
```

This means:

1. Start in the repository root.
2. Open the `data` folder.
3. Open the `synthetic` folder.
4. Read `synthetic_gss_like_person_2024.csv`.

Avoid paths that only work on your computer, such as these example absolute paths:

```text
/Users/yourname/Desktop/course/data/synthetic/synthetic_gss_like_person_2024.csv
C:\Users\yourname\Downloads\course\data\synthetic\synthetic_gss_like_person_2024.csv
```

## Log Files

A log file records what happened when your Stata script ran. Logs are useful because they show commands, output, warnings, and errors.

Many Stata labs begin with a command like:

```stata
log using "logs/module-01-stata-log.txt", text replace
```

And end with:

```stata
log close
```

If Stata says a log is already open, type:

```stata
capture log close
```

Then rerun the script from the top.

## Where Stata Outputs Go

Course Stata labs usually write generated files to:

- `logs/`
- `data/working/`
- `data/output/`

These folders are normally ignored by Git. Do not commit generated data or logs unless your instructor explicitly asks you to.

## First Setup Check

Start with Module 00:

1. Open Stata.
2. Open `modules/00-orientation/stata_lab.do`.
3. Run the full do-file.
4. Check that Stata found `data/synthetic/synthetic_gss_like_person_2024.csv`.
5. Check that the lab created:
   - `logs/module-00-stata-log.txt`
   - `data/output/module-00-stata-setup-check.txt`

If this works, your Stata setup is ready for the first module.

## When To Ask For Help

Ask for help if:

- you cannot access Stata,
- you cannot find the repository folder,
- `pwd` shows a folder you do not recognize,
- Stata says a file is not found,
- Stata cannot write to `logs/` or `data/output/`,
- or a do-file fails even after you rerun it from the top.

When asking for help, include:

- the module number,
- the do-file name,
- the error message,
- what `pwd` shows,
- and the line where the script stopped.
