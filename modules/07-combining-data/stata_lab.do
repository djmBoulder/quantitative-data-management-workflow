* 07 Combining Datasets with Append, Joins, and Merges Stata Lab
* Purpose: append person files, diagnose keys and duplicates, attach region
* context, and document merge diagnostics.
* Run this do-file from the repository root.

version 17
clear all
set more off

* Store project-relative paths in locals.
local person_2024 "data/synthetic/synthetic_gss_like_person_2024.csv"
local person_2025 "data/synthetic/synthetic_gss_like_person_2025.csv"
local region_csv "data/synthetic/synthetic_gss_like_region_context.csv"
local appended_file "data/working/synthetic_gss_like_person_appended.dta"
local region_merged_file "data/working/synthetic_gss_like_person_region_merged.dta"
local diagnostics_report "data/output/module-07-stata-combine-diagnostics.txt"
local log_file "logs/module-07-stata-log.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/working"
capture mkdir "data/output"

* Start a plain-text log for review.
capture log close
log using "`log_file'", text replace

display as text "Module 07 Stata combining data log"

* Confirm source files exist.
confirm file "`person_2024'"
confirm file "`person_2025'"
confirm file "`region_csv'"

tempfile p2024 p2025 appended_unique region_context weights_lookup person_for_region

* ---------------------------------------------------------------------------
* Prepare the 2024 person file.
* ---------------------------------------------------------------------------

import delimited using "`person_2024'", clear varnames(1) case(lower) bindquote(strict)
capture rename survey_year year
generate source_file = "person_2024"
generate region_clean = lower(trim(region))
replace region_clean = "" if region_clean == "-9"
count
local n_2024 = r(N)
save `p2024', replace

* ---------------------------------------------------------------------------
* Prepare the 2025 person file.
* ---------------------------------------------------------------------------

import delimited using "`person_2025'", clear varnames(1) case(lower) bindquote(strict)
capture rename survey_year year
generate source_file = "person_2025"
generate region_clean = lower(trim(region))
replace region_clean = "" if region_clean == "-9"
count
local n_2025 = r(N)
save `p2025', replace

* ---------------------------------------------------------------------------
* Append rows from compatible person files.
* ---------------------------------------------------------------------------

use `p2024', clear
append using `p2025'
count
local n_appended = r(N)
assert `n_appended' == `n_2024' + `n_2025'

* Check person-year keys. The synthetic 2024 file intentionally contains a duplicate.
duplicates report respondent_id year
duplicates list respondent_id year if respondent_id < ., abbreviate(20)
capture isid respondent_id year
if _rc {
    display as error "respondent_id + year is not unique before duplicate handling."
}

duplicates tag respondent_id year, generate(duplicate_person_year)
label variable duplicate_person_year "Duplicate respondent_id-year indicator before merge examples"
tabulate duplicate_person_year, missing

save "`appended_file'", replace

* Create a de-duplicated teaching file for merge demonstrations.
sort respondent_id year source_file
by respondent_id year: generate duplicate_order = _n
preserve
keep if duplicate_order == 1
isid respondent_id year
save `appended_unique', replace
restore

* ---------------------------------------------------------------------------
* Prepare the region context file.
* ---------------------------------------------------------------------------

import delimited using "`region_csv'", clear varnames(1) case(lower) bindquote(strict)
rename region_name region_clean
replace region_clean = lower(trim(region_clean))
isid region_clean
duplicates report region_clean
save `region_context', replace

* ---------------------------------------------------------------------------
* Demonstrate a 1:1 merge using a person-year weight lookup.
* ---------------------------------------------------------------------------

use `appended_unique', clear
keep respondent_id year survey_weight
isid respondent_id year
save `weights_lookup', replace

use `appended_unique', clear
drop survey_weight
merge 1:1 respondent_id year using `weights_lookup', keepusing(survey_weight)
tabulate _merge
assert _merge == 3
drop _merge

* ---------------------------------------------------------------------------
* Demonstrate an m:1 merge: many person rows to one region context row.
* ---------------------------------------------------------------------------

merge m:1 region_clean using `region_context', keepusing(region_median_income region_unemployment_rate urbanicity_index census_division)
tabulate _merge, missing
count if _merge == 1
local n_person_unmatched_region = r(N)
count if _merge == 2
local n_context_only = r(N)
count if _merge == 3
local n_region_matched = r(N)

* Keep person rows and matched context; do not keep context-only rows in the person-level output.
keep if inlist(_merge, 1, 3)
label variable _merge "Region merge indicator: 1 person only, 3 matched"
save "`region_merged_file'", replace

* ---------------------------------------------------------------------------
* Demonstrate a 1:m merge from the region side for diagnostics.
* ---------------------------------------------------------------------------

use `appended_unique', clear
keep respondent_id year gender region_clean
save `person_for_region', replace

use `region_context', clear
merge 1:m region_clean using `person_for_region', keep(match master)
tabulate _merge, missing
count if _merge == 1
local n_region_without_people = r(N)
count if _merge == 3
local n_region_person_matches = r(N)

* ---------------------------------------------------------------------------
* Write diagnostics report.
* ---------------------------------------------------------------------------

capture file close report
file open report using "`diagnostics_report'", write replace text
file write report "Module 07 Stata combine diagnostics" _n
file write report "2024 rows: `n_2024'" _n
file write report "2025 rows: `n_2025'" _n
file write report "Rows after append: `n_appended'" _n
file write report "Append check: appended rows equal 2024 + 2025 rows." _n
file write report "Duplicate person-year keys were diagnosed before merge examples." _n
file write report "1:1 merge key: respondent_id + year for person-year weight lookup." _n
file write report "m:1 merge key: region_clean from person rows to region context." _n
file write report "Person rows unmatched to region context: `n_person_unmatched_region'" _n
file write report "Context-only rows during m:1 merge: `n_context_only'" _n
file write report "Matched person-region rows: `n_region_matched'" _n
file write report "1:m diagnostic context rows without people: `n_region_without_people'" _n
file write report "1:m diagnostic matched region-person rows: `n_region_person_matches'" _n
file write report "Many-to-many merges were not used; duplicate keys should be investigated instead." _n
file close report

display as text "Combining workflow complete."
display as text "Appended file saved to `appended_file'"
display as text "Region-merged file saved to `region_merged_file'"

log close
