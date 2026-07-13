* 00 Orientation Stata Lab
* Purpose: confirm that Stata can see the course repository, read the
* synthetic teaching data, and write a small setup report.
* Run this do-file from the repository root.
* Beginner note: if running interactively, run the setup block from version
* through log using as a block before running later lines. Do not run isolated
* lines that depend on local macros, imported data, or open logs.

version 17
clear all
set more off

* Confirm this do-file is being run from the repository root.
capture confirm file "README.md"
if _rc {
    display as error "README.md not found."
    display as error "Run this do-file from the repository root: the folder containing README.md, modules/, code/, and data/."
    exit 601
}

capture confirm file "modules/00-orientation/stata_lab.do"
if _rc {
    display as error "modules/00-orientation/stata_lab.do not found."
    display as error "Run this do-file from the repository root: the folder containing README.md, modules/, code/, and data/."
    exit 601
}

capture confirm file "code/stata/create-synthetic-data.do"
if _rc {
    display as error "code/stata/create-synthetic-data.do not found."
    display as error "Run this do-file from the repository root: the folder containing README.md, modules/, code/, and data/."
    exit 601
}

capture confirm file "data/synthetic/README.md"
if _rc {
    display as error "data/synthetic/README.md not found."
    display as error "Run this do-file from the repository root: the folder containing README.md, modules/, code/, and data/."
    exit 601
}

* Store project-relative paths in locals.
local synthetic_csv "data/synthetic/synthetic_gss_like_person_2024.csv"
local log_file "logs/module-00-stata-log.txt"
local setup_report "data/output/module-00-stata-setup-check.txt"

* Create ignored output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/output"

* Start a plain-text log. Logs are generated files and are ignored by Git.
capture log close
log using "logs/module-00-stata-log.txt", text replace

display as text "Module 00 Stata setup check"
display as text "Current working directory:"
pwd

* Confirm that the expected synthetic teaching file is available.
confirm file "`synthetic_csv'"
display as text "Found synthetic data file: `synthetic_csv'"

* Import the synthetic data only for a quick setup check.
* Do not edit the raw CSV file manually.
import delimited using "`synthetic_csv'", clear varnames(1) case(lower) bindquote(strict)

count
local row_count = r(N)
local variable_count = c(k)

display as text "Rows imported: `row_count'"
display as text "Variables imported: `variable_count'"
describe
list in 1/3, abbreviate(20)

* Write a short setup report to data/output.
capture file close report
file open report using "`setup_report'", write replace text
file write report "Module 00 Stata setup check" _n
file write report "Synthetic file found: `synthetic_csv'" _n
file write report "Rows imported: `row_count'" _n
file write report "Variables imported: `variable_count'" _n
file write report "This report confirms that Stata can read course data and write to data/output." _n
file write report "Do not manually edit raw or synthetic data files." _n
file close report

display as text "Setup report saved to `setup_report'"
display as text "Module 00 Stata setup check complete."

log close
