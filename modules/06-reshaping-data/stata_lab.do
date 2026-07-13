* 06 Reshaping and Restructuring Data Stata Lab
* Purpose: reshape synthetic repeated-measures data from wide to long and
* back to wide, with row-count and key validation.
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
local wide_csv "data/synthetic/synthetic_gss_like_repeated_measures_wide.csv"
local long_file "data/working/synthetic_gss_like_repeated_measures_long.dta"
local wide_again_file "data/working/synthetic_gss_like_repeated_measures_wide_again.dta"
local validation_report "data/output/module-06-stata-reshape-validation.txt"
local log_file "logs/module-06-stata-log.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/working"
capture mkdir "data/output"

* Start a plain-text log for review.
capture log close
log using "logs/module-06-stata-log.txt", text replace

display as text "Module 06 Stata reshape log"
display as text "Wide input file: `wide_csv'"

* Import the wide repeated-measures file.
confirm file "`wide_csv'"
import delimited using "`wide_csv'", clear varnames(1) case(lower) bindquote(strict)

* Inspect the wide structure.
describe
order respondent_id gender region health_2022 health_2023 health_2024 activity_days_2022 activity_days_2023 activity_days_2024
sort respondent_id
list respondent_id gender region health_2022 health_2023 health_2024 in 1/5, abbreviate(20)

* Check that respondent_id uniquely identifies rows before reshaping.
duplicates report respondent_id
isid respondent_id
count
local wide_rows = r(N)

* A small one-measure preview helps show the reshape idea before the full reshape.
preserve
    keep respondent_id gender region health_2022 health_2023 health_2024
    reshape long health_, i(respondent_id) j(year)
    rename health_ health_value
    list respondent_id year health_value in 1/6, abbreviate(20)
restore

* Reshape from wide to long. The year suffix becomes the time variable.
reshape long health_ activity_days_ hours_worked_, i(respondent_id) j(year)

* Rename reshaped variables to remove the trailing underscore from the stub.
rename health_ health
rename activity_days_ activity_days
rename hours_worked_ hours_worked

* Inspect and validate the long person-year structure.
order respondent_id year gender region health activity_days hours_worked
sort respondent_id year
list respondent_id year gender region health activity_days hours_worked in 1/9, abbreviate(20)

count
local long_rows = r(N)
local expected_long = `wide_rows' * 3
assert `long_rows' == `expected_long'
isid respondent_id year
bysort respondent_id: assert _N == 3
assert inlist(year, 2022, 2023, 2024)

* Save the long working file.
save "`long_file'", replace

* Reshape back to wide so students can see the reverse operation.
reshape wide health activity_days hours_worked, i(respondent_id gender region) j(year)

* Rename the wide variables back to the original underscore style.
rename health2022 health_2022
rename health2023 health_2023
rename health2024 health_2024
rename activity_days2022 activity_days_2022
rename activity_days2023 activity_days_2023
rename activity_days2024 activity_days_2024
rename hours_worked2022 hours_worked_2022
rename hours_worked2023 hours_worked_2023
rename hours_worked2024 hours_worked_2024

sort respondent_id
count
local wide_again_rows = r(N)
assert `wide_again_rows' == `wide_rows'
isid respondent_id

* Save the reshaped-wide working file.
save "`wide_again_file'", replace

* Write a short validation report.
capture file close report
file open report using "`validation_report'", write replace text
file write report "Module 06 Stata reshape validation report" _n
file write report "Wide input rows: `wide_rows'" _n
file write report "Long output rows: `long_rows'" _n
file write report "Expected long rows: `expected_long'" _n
file write report "Wide-again rows: `wide_again_rows'" _n
file write report "Wide key: respondent_id" _n
file write report "Long key: respondent_id + year" _n
file write report "Reshape stubs: health, activity_days, hours_worked" _n
file write report "Time variable: year with values 2022, 2023, and 2024" _n
file write report "Special missing codes are carried through reshaping and should be handled in a cleaning step." _n
file close report

display as text "Reshape workflow complete."
display as text "Long file saved to `long_file'"
display as text "Wide-again file saved to `wide_again_file'"

log close
