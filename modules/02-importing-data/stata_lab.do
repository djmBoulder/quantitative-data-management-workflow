* 02 Importing and Inspecting Data Stata Lab
* Purpose: import CSV and Excel versions of synthetic_gss_like, inspect them,
* standardize variable names, and save a clean working copy.
* Run this do-file from the repository root.

version 17
clear all
set more off

* Store project-relative paths in locals.
local csv_file "data/synthetic/synthetic_gss_like_person_2024.csv"
local excel_file "data/synthetic/synthetic_gss_like_person_2024.xlsx"
local working_file "data/working/synthetic_gss_like_person_2024_imported.dta"
local log_file "logs/module-02-stata-log.txt"
local inspection_file "data/output/module-02-stata-import-inspection.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/working"
capture mkdir "data/output"

* Start a plain-text log for the import workflow.
capture log close
log using "`log_file'", text replace

display as text "Module 02 Stata import log"
display as text "CSV file: `csv_file'"
display as text "Excel file: `excel_file'"

* Confirm that both raw teaching files exist.
confirm file "`csv_file'"
confirm file "`excel_file'"

* ---------------------------------------------------------------------------
* Part 1: Import and inspect the CSV file.
* ---------------------------------------------------------------------------

* Import the CSV. The first row contains variable names.
import delimited using "`csv_file'", clear varnames(1) case(lower) bindquote(strict)

display as text "CSV import: initial names and types"
describe

display as text "CSV import: selected variable summaries"
summarize age
tabulate gender, missing
tabulate region, missing
misstable summarize
list in 1/5, abbreviate(20)

* Stata may convert spaces and punctuation in raw headers to underscores.
* Standardize names to the course data dictionary where needed.
capture rename survey_year year

* Label the working dataset to document how it entered the project.
label data "synthetic_gss_like person 2024 imported from CSV for Module 02"
notes: Imported from data/synthetic/synthetic_gss_like_person_2024.csv
notes: Raw file was not edited manually.
notes: Variable names standardized after import; values are not fully cleaned yet.

* Store row and variable counts for the inspection output.
local csv_rows = _N
local csv_vars = c(k)

* Save the standardized CSV import as the Stata working copy.
save "`working_file'", replace

* ---------------------------------------------------------------------------
* Part 2: Import and inspect the Excel file.
* ---------------------------------------------------------------------------

* Import the Excel file. The first row contains variable names.
import excel using "`excel_file'", clear firstrow case(lower)

display as text "Excel import: initial names and types"
describe

display as text "Excel import: selected variable summaries"
summarize age
tabulate gender, missing
tabulate region, missing
misstable summarize
list in 1/5, abbreviate(20)

* Standardize the same name so students see the parallel workflow.
capture rename survey_year year

local excel_rows = _N
local excel_vars = c(k)

* Write a short import inspection summary for review.
capture file close inspection
file open inspection using "`inspection_file'", write replace text
file write inspection "Module 02 Stata import inspection summary" _n
file write inspection "CSV rows imported: `csv_rows'" _n
file write inspection "CSV variables imported after renaming: `csv_vars'" _n
file write inspection "Excel rows imported: `excel_rows'" _n
file write inspection "Excel variables imported after renaming: `excel_vars'" _n
file write inspection "Working file saved to: `working_file'" _n
file write inspection "Known issues to inspect later: special missing codes, inconsistent capitalization, and string/numeric typing problems." _n
file close inspection

display as text "Workflow complete. CSV and Excel files were imported and inspected."
display as text "The CSV import was saved as the Stata working copy."

log close
