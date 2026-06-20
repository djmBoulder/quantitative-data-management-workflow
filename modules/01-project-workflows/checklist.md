# 01 Project Workflows Checklist

Use this checklist before submitting the module assignment.

## Pathway Use

Complete the required lab checks for your primary pathway. Use the other software section as conceptual review unless you are completing the optional dual pathway or your instructor requires both.

## Workflow Setup

- [ ] I ran my primary-pathway lab script from the repository root.
- [ ] I used relative paths rather than absolute paths from my own computer.
- [ ] I did not manually edit `data/synthetic/synthetic_gss_like_person_2024.csv`.
- [ ] I can explain the difference between raw data, working data, and output data.

## Stata Lab

- [ ] Stata pathway or dual pathway: I ran `modules/01-project-workflows/stata_lab.do`.
- [ ] My Stata workflow started and closed a log file.
- [ ] My Stata workflow imported the raw CSV.
- [ ] My Stata workflow inspected the data with commands such as `describe`, `summarize`, and `tabulate`.
- [ ] My Stata workflow saved a working `.dta` copy without changing the raw CSV.

## R Lab

- [ ] R pathway or dual pathway: I ran `modules/01-project-workflows/r_lab.R`.
- [ ] My R workflow created a text log.
- [ ] My R workflow imported the raw CSV.
- [ ] My R workflow inspected the data with functions such as `names()`, `str()`, `summary()`, and `table()`.
- [ ] My R workflow saved a working `.rds` copy without changing the raw CSV.

## Documentation

- [ ] I drafted a short README section explaining the workflow.
- [ ] I identified the raw data file.
- [ ] I identified the working data files.
- [ ] I identified the scripts and logs.
- [ ] I used the data dictionary to understand the dataset before cleaning it.
- [ ] I named at least two data issues that later modules will address.

## Reflection

- [ ] I explained why raw data should not be edited manually.
- [ ] I connected that explanation to this module's synthetic data.
- [ ] I understand that working files should be reproducible from scripts.

## Ready for the Next Module

- [ ] I can rerun my workflow from the beginning.
- [ ] I can find the log files created by the workflow.
- [ ] I can find the working data files created by the workflow.
- [ ] I understand that later modules will clean and recode the issues identified here.
