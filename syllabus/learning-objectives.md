# Learning Objectives

This document organizes the learning objectives for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential. The course is designed primarily as a noncredit digital badge, with objectives that can also support a 1-credit graduate course or short bootcamp adaptation.

## 1. Course-Level Learning Objectives

By the end of the microcredential, students should be able to:

1. Explain why reproducible data workflows matter for graduate social science research.
2. Organize a data management project using clear folder structures, relative paths, scripts, logs, documentation, and protected source data.
3. Import, inspect, clean, recode, reshape, combine, validate, and export synthetic social science data.
4. Document variable meanings, coding decisions, missing-data rules, sample restrictions, and known data limitations.
5. Construct a transparent analysis-ready dataset from raw synthetic inputs.
6. Produce a capstone data management portfolio that another researcher could inspect, rerun, and understand.
7. Recognize parallel Stata and R approaches to the same data management tasks, even when completing graded work in one primary pathway.

## 2. Concrete Skill Outcomes

Students who complete the course should be able to:

- Navigate the course repository and identify student-facing and instructor-facing files.
- Distinguish raw, synthetic, working, output, and analysis-ready data files.
- Explain why raw data should never be edited manually.
- Use relative paths from the repository root.
- Import CSV and Excel files.
- Inspect variable names, storage types, labels, values, and missingness.
- Standardize variable names using a consistent naming convention.
- Preserve source variables while creating cleaned or derived variables.
- Convert variables between string, numeric, labelled, and categorical representations when appropriate.
- Recode binary, ordinal, categorical, and continuous variables.
- Identify special missing-value codes and convert them to system missing values.
- Check missingness by variable and by row.
- Create complete-case and analytic-sample flags.
- Track sample size changes across data preparation steps.
- Recognize wide and long data structures.
- Reshape repeated-measures data between wide and long formats.
- Append compatible person-level files across years.
- Merge or join contextual data onto person-level data.
- Check keys, duplicate records, unmatched records, and row counts before and after combining files.
- Run QA checks for required variables, numeric ranges, valid categories, duplicates, missingness, and merge results.
- Save working and analysis-ready datasets in appropriate formats.
- Produce descriptive tables, codebooks, QA reports, logs, and handoff memos.
- Avoid committing generated working data, generated output data, logs, or any private/restricted data to GitHub.

## 3. Software-Specific Stata Outcomes

Students completing the Stata pathway should be able to:

- Open, edit, and run Stata do-files.
- Use `pwd`, relative file paths, `capture mkdir`, and project-folder conventions.
- Use `log using` and `log close` to create workflow logs.
- Import CSV and Excel files using `import delimited` and `import excel`.
- Inspect data using `describe`, `codebook`, `summarize`, `tabulate`, `list`, and `misstable summarize`.
- Use `rename`, `order`, `compress`, and `save` to organize working files.
- Use `generate`, `replace`, `egen`, `recode`, `destring`, `encode`, `decode`, and `tostring`.
- Use string functions such as `lower()`, `upper()`, and `trim()`.
- Use `label data`, `label variable`, `label define`, `label values`, `labelbook`, and `notes`.
- Use `mvdecode`, `missing()`, and `egen rowmiss()` for missing-data workflows.
- Use `reshape long` and `reshape wide`.
- Use `append` and `merge 1:1`, `merge m:1`, and `merge 1:m`.
- Use `isid`, `duplicates report`, `duplicates list`, `count`, `assert`, and `_merge` diagnostics.
- Export data and outputs using `save`, `export delimited`, `export excel`, and `file write`.

## 4. Software-Specific R Outcomes

Students completing the R pathway should be able to:

- Open, edit, and run R scripts.
- Use RStudio projects or the repository root as a stable working location.
- Use relative paths and `file.path()` where helpful.
- Use `dir.create()` to create workflow folders from code.
- Read CSV and Excel files using `readr::read_csv()` and `readxl::read_excel()`.
- Inspect data using `names()`, `str()`, `summary()`, `dplyr::glimpse()`, and optional tools such as `skimr::skim()`.
- Standardize names and variables using `rename()`, `mutate()`, `across()`, and related tidyverse functions.
- Clean strings using `stringr::str_trim()`, `stringr::str_to_lower()`, and `stringr::str_to_upper()`.
- Convert types using `as.numeric()`, `as.character()`, `readr::parse_number()`, `factor()`, and labelled workflows where appropriate.
- Recode variables using `case_when()`, `if_else()`, `recode()`, and factor levels.
- Check missing data using `is.na()`, `na_if()`, `rowSums(is.na())`, `complete.cases()`, `count()`, and `summarise()`.
- Reshape data using `tidyr::pivot_longer()` and `tidyr::pivot_wider()`.
- Append rows using `dplyr::bind_rows()`.
- Join files using `left_join()`, `inner_join()`, `full_join()`, `anti_join()`, and `semi_join()`.
- Check duplicates and keys using `count()`, `distinct()`, `duplicated()`, `anyDuplicated()`, and `stopifnot()`.
- Export data and outputs using `readr::write_csv()`, `saveRDS()`, `haven::write_dta()`, and simple text or Markdown writing tools such as `writeLines()`.

## 5. Reproducibility And Documentation Outcomes

Students should be able to demonstrate that:

- Data decisions are recorded in scripts rather than manual edits.
- Raw synthetic data are protected from changes.
- Working files and outputs can be recreated by rerunning code.
- Logs or text output records show that the workflow ran.
- Data dictionaries or codebooks explain variables, source variables, derived variables, coding decisions, and known limitations.
- QA checks identify fatal errors, warning-level issues, and unresolved concerns.
- Sample restrictions are represented with flags or documented decisions before observations are removed.
- Handoff files are understandable to a future collaborator, advisor, instructor, or the student's future self.
- No private, restricted, licensed, confidential, or student data are committed to the repository.

## Pathway Note

Students may demonstrate these objectives through a Stata pathway, an R pathway, or a dual Stata/R pathway. All students should review both pathways conceptually. Graded work is required in one primary pathway unless the instructor requires both for a specific offering.
