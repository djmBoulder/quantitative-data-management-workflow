* 08 Quality Assurance and Validation Checks Stata Lab
* Purpose: build QA checks into the synthetic_gss_like workflow and report
* fatal checks, warnings, merge diagnostics, and unresolved issues.
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
local person_csv "data/synthetic/synthetic_gss_like_person_2024.csv"
local region_csv "data/synthetic/synthetic_gss_like_region_context.csv"
local qa_report "data/output/module-08-stata-qa-report.md"
local log_file "logs/module-08-stata-log.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/output"

* Start a plain-text log for review.
capture log close
log using "logs/module-08-stata-log.txt", text replace

display as text "Module 08 Stata quality assurance log"

* Fatal checks: required files must exist.
confirm file "`person_csv'"
confirm file "`region_csv'"

* Import the person file.
import delimited using "`person_csv'", clear varnames(1) case(lower) bindquote(strict)
capture rename respondentid respondent_id
capture rename surveyyear year
capture rename survey_year year
capture rename raceethnicity race_ethnicity
capture rename maritalstatus marital_status
capture rename employmentstatus employment_status
capture rename householdincome household_income
capture rename selfratedhealth self_rated_health
capture rename physicalactivitydays physical_activity_days
capture rename surveyweight survey_weight
capture rename interviewmode interview_mode

* Fatal checks: required variables must exist.
foreach var in respondent_id year age gender region household_income self_rated_health physical_activity_days survey_weight {
    confirm variable `var'
}

* Row-count and variable-count checks.
count
local person_rows = r(N)
local person_vars = c(k)
assert `person_rows' == 240
assert `person_vars' >= 16

describe
codebook respondent_id age gender region household_income self_rated_health physical_activity_days survey_weight
summarize age
tabulate gender, missing
misstable summarize

* Duplicate ID checks. These are warnings in raw data, not fatal errors.
duplicates report respondent_id
duplicates tag respondent_id, generate(duplicate_id)
count if duplicate_id > 0
local duplicate_id_rows = r(N)
capture isid respondent_id
if _rc {
    display as error "WARNING: respondent_id is not unique in the raw 2024 file."
}

* Range checks. The raw data intentionally include special codes and impossible values.
count if age < 18 | age > 89
local age_range_warnings = r(N)
count if inlist(age, -9, 999)
local age_special_codes = r(N)

* Valid category checks after standardizing case and whitespace.
generate gender_clean_check = lower(trim(gender))
count if !inlist(gender_clean_check, "female", "male", "nonbinary", "prefer not to answer", "-9", "")
local invalid_gender_categories = r(N)

generate region_clean = lower(trim(region))
replace region_clean = "" if region_clean == "-9"
tabulate region_clean, missing

* Missingness and special-code checks.
count if missing(gender) | trim(gender) == ""
local blank_gender = r(N)
count if trim(survey_weight) == "" | trim(survey_weight) == "-9"
local survey_weight_missing_like = r(N)

* Logical consistency warning: not employed categories with high hours worked.
generate employment_clean = lower(trim(employment_status))
generate hours_text = lower(trim(hours_worked))
replace hours_text = "" if inlist(hours_text, "-8", "-9", "n/a", "forty")
destring hours_text, generate(hours_worked_num)
count if inlist(employment_clean, "unemployed", "retired", "not in labor force") & hours_worked_num > 40 & !missing(hours_worked_num)
local employment_hours_warnings = r(N)

* Prepare and validate region context before merge.
tempfile person_data region_context merged_data
save `person_data', replace

import delimited using "`region_csv'", clear varnames(1) case(lower) bindquote(strict)
capture rename regionname region_clean
capture rename region_name region_clean
capture rename regionmedianincome region_median_income
capture rename region_unemploymentrate region_unemployment_rate
capture rename regionunemploymentrate region_unemployment_rate
capture rename urbanicityindex urbanicity_index
capture rename censusdivision census_division
replace region_clean = lower(trim(region_clean))
count
local region_rows = r(N)
describe
isid region_clean
duplicates report region_clean
save `region_context', replace

* Merge validation: many person rows to one region row.
use `person_data', clear
count
local pre_merge_rows = r(N)
merge m:1 region_clean using `region_context', keepusing(region_median_income region_unemployment_rate urbanicity_index census_division)
count
local post_merge_rows = r(N)
assert `post_merge_rows' >= `pre_merge_rows'
tabulate _merge, missing

count if _merge == 1
local person_unmatched = r(N)
count if _merge == 2
local context_only = r(N)
count if _merge == 3
local matched_rows = r(N)

* Keep the merged data available for inspection but this module writes only QA reports.
save `merged_data', replace

* Write a QA report with fatal checks, warnings, and unresolved issues.
capture file close qa
file open qa using "`qa_report'", write replace text
file write qa "# Module 08 Stata QA Report" _n _n
file write qa "## Fatal Checks Passed" _n
file write qa "- Required input files were found." _n
file write qa "- Required person-level variables were confirmed." _n
file write qa "- Person rows matched the expected 240 rows." _n
file write qa "- Region context key region_clean was unique." _n _n
file write qa "## Warning-Level Issues" _n
file write qa "- Duplicate respondent_id rows in raw person file: `duplicate_id_rows'." _n
file write qa "- Age values outside 18-89 before cleaning: `age_range_warnings'." _n
file write qa "- Age special codes -9 or 999 before cleaning: `age_special_codes'." _n
file write qa "- Invalid standardized gender categories: `invalid_gender_categories'." _n
file write qa "- Blank gender values: `blank_gender'." _n
file write qa "- Survey weight blank or -9 values: `survey_weight_missing_like'." _n
file write qa "- Logical warning, non-employed categories with hours_worked_num greater than 40: `employment_hours_warnings'." _n _n
file write qa "## Merge Validation" _n
file write qa "- Person rows before merge: `pre_merge_rows'." _n
file write qa "- Rows after merge: `post_merge_rows'." _n
file write qa "- Person rows without region context match: `person_unmatched'." _n
file write qa "- Context-only rows: `context_only'." _n
file write qa "- Matched rows: `matched_rows'." _n _n
file write qa "## Unresolved Issues" _n
file write qa "- Duplicate respondent IDs require review before respondent-level analysis." _n
file write qa "- Special missing codes and inconsistent category capitalization require cleaning before analysis." _n
file write qa "- Unmatched region keys require documentation or key cleaning before region-level analysis." _n
file close qa

display as text "QA workflow complete."
display as text "QA report saved to `qa_report'"

log close
