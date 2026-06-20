* 01 Project Workflows and Reproducibility Stata Lab
* Purpose: create a simple reproducible workflow from raw CSV to working Stata data.
* Run this do-file from the repository root.

version 17
clear all
set more off

* Store project-relative paths in locals so they are easy to reuse.
local raw_csv "data/synthetic/synthetic_gss_like_person_2024.csv"
local working_dta "data/working/synthetic_gss_like_person_2024_working.dta"
local log_file "logs/module-01-stata-log.txt"
local inspection_file "data/output/module-01-stata-inspection.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/working"
capture mkdir "data/output"

* Start a plain-text log so the workflow output can be reviewed later.
capture log close
log using "`log_file'", text replace

display as text "Module 01 Stata workflow log"
display as text "Raw data file: `raw_csv'"
display as text "Working data file: `working_dta'"

* Confirm that the raw CSV exists before trying to import it.
confirm file "`raw_csv'"

* Import the raw CSV without editing it manually.
import delimited using "`raw_csv'", clear varnames(1) bindquote(strict)

* Inspect the imported data structure.
describe

* Review basic summaries for numeric-looking variables.
summarize

* Store a simple descriptive result for the output file.
summarize age
local mean_age_raw = string(r(mean), "%9.2f")

* Review selected categorical variables to see inconsistent capitalization and missing codes.
tabulate gender, missing
tabulate region, missing
tabulate education, missing

* List the first five rows so students can see raw values after import.
list in 1/5, abbreviate(20)

* Save a small inspection text file for the module output folder.
local nobs = _N
local nvars = c(k)
capture file close inspection
file open inspection using "`inspection_file'", write replace text
file write inspection "Module 01 Stata inspection summary" _n
file write inspection "Raw file: `raw_csv'" _n
file write inspection "Rows imported: `nobs'" _n
file write inspection "Variables imported: `nvars'" _n
file write inspection "Raw mean age before cleaning: `mean_age_raw'" _n
file write inspection "Note: this output is for workflow practice and has not been cleaned yet." _n
file write inspection "Working file saved to: `working_dta'" _n
file close inspection

* Save a working copy in Stata format. This does not change the raw CSV.
save "`working_dta'", replace

display as text "Workflow complete. Raw data were imported, inspected, and saved as a working copy."

* Close the log at the end of the scripted workflow.
log close
