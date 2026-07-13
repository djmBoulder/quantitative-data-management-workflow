* 05 Missing Data and Analytic Sample Construction Stata Lab
* Purpose: identify, recode, document, and report missing data while creating
* transparent complete-case and analytic-sample flags.
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
local raw_csv "data/synthetic/synthetic_gss_like_person_2024.csv"
local working_file "data/working/synthetic_gss_like_person_2024_missing_sample.dta"
local sample_report "data/output/module-05-stata-sample-construction.csv"
local missing_report "data/output/module-05-stata-missing-summary.txt"
local log_file "logs/module-05-stata-log.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/working"
capture mkdir "data/output"

* Start a plain-text log for review.
capture log close
log using "logs/module-05-stata-log.txt", text replace

display as text "Module 05 Stata missing data and analytic sample log"
display as text "Raw data file: `raw_csv'"

* Import the raw CSV without manual edits.
confirm file "`raw_csv'"
import delimited using "`raw_csv'", clear varnames(1) case(lower) bindquote(strict)
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

* Track imported sample size.
local n_imported = _N

* Inspect raw variables and special missing codes before recoding.
describe age gender hours_worked household_income self_rated_health physical_activity_days survey_weight
codebook age gender hours_worked household_income self_rated_health physical_activity_days survey_weight
tabulate gender, missing
tabulate self_rated_health, missing
summarize age

* Demonstrate user-defined Stata missing codes with extended missing values.
generate age_missing_reason = age
mvdecode age_missing_reason, mv(-9=.a \ 999=.b)
label variable age_missing_reason "Age with Stata extended missing reasons for demonstration"
notes age_missing_reason: .a represents raw code -9; .b represents raw code 999.

* ---------------------------------------------------------------------------
* Recode special missing codes to system missing for analytic variables.
* ---------------------------------------------------------------------------

generate age_clean = age
mvdecode age_clean, mv(-9 999)
label variable age_clean "Age with special missing codes recoded to system missing"
assert age_clean >= 18 & age_clean <= 89 if !missing(age_clean)

generate gender_text = lower(trim(gender))
replace gender_text = "" if inlist(gender_text, "-9", "prefer not to answer")
generate byte gender_clean = .
replace gender_clean = 1 if gender_text == "female"
replace gender_clean = 2 if gender_text == "male"
replace gender_clean = 3 if gender_text == "nonbinary"
label define gender_clean_lbl 1 "Female" 2 "Male" 3 "Nonbinary"
label values gender_clean gender_clean_lbl
label variable gender_clean "Gender recoded with special missing values set to missing"

generate health_text = lower(trim(self_rated_health))
replace health_text = "" if inlist(health_text, "-9", "dk")
generate byte health_ord = .
replace health_ord = 1 if health_text == "poor"
replace health_ord = 2 if health_text == "fair"
replace health_ord = 3 if health_text == "good"
replace health_ord = 4 if health_text == "very good"
replace health_ord = 5 if health_text == "excellent"
label define health_ord_lbl 1 "Poor" 2 "Fair" 3 "Good" 4 "Very good" 5 "Excellent"
label values health_ord health_ord_lbl
label variable health_ord "Self-rated health recoded with special missing values set to missing"

generate hours_text = lower(trim(hours_worked))
replace hours_text = "" if inlist(hours_text, "-8", "-9", "n/a", "forty")
destring hours_text, generate(hours_worked_num)
label variable hours_worked_num "Hours worked with special missing codes set to missing"
assert hours_worked_num >= 0 & hours_worked_num <= 60 if !missing(hours_worked_num)

generate income_text = lower(trim(household_income))
replace income_text = subinstr(income_text, "$", "", .)
replace income_text = subinstr(income_text, ",", "", .)
replace income_text = "" if inlist(income_text, "-8", "999999", "not asked")
destring income_text, generate(household_income_num)
label variable household_income_num "Household income with special missing codes set to missing"
assert household_income_num >= 0 if !missing(household_income_num)

generate activity_text = lower(trim(physical_activity_days))
replace activity_text = "" if inlist(activity_text, "-9", "not asked", "eight")
destring activity_text, generate(physical_activity_days_num)
label variable physical_activity_days_num "Physical activity days with special missing codes set to missing"
assert physical_activity_days_num >= 0 & physical_activity_days_num <= 7 if !missing(physical_activity_days_num)

generate weight_text = trim(survey_weight)
replace weight_text = subinstr(weight_text, ",", ".", .)
replace weight_text = "" if weight_text == "-9"
destring weight_text, generate(survey_weight_num)
label variable survey_weight_num "Survey weight with special missing codes set to missing"
assert survey_weight_num > 0 if !missing(survey_weight_num)

* ---------------------------------------------------------------------------
* Check missingness variable by variable and row by row.
* ---------------------------------------------------------------------------

misstable summarize age_clean gender_clean health_ord hours_worked_num household_income_num physical_activity_days_num survey_weight_num

tabulate gender_clean, missing
tabulate health_ord, missing
summarize age_clean hours_worked_num household_income_num physical_activity_days_num survey_weight_num

* Count system missing values with missing().
foreach var in age_clean gender_clean health_ord hours_worked_num household_income_num physical_activity_days_num survey_weight_num {
    count if missing(`var')
    display as text "`var' missing count: " r(N)
}

* Row-wise missingness for core variables.
egen rowmiss_core = rowmiss(age_clean gender_clean health_ord household_income_num survey_weight_num)
label variable rowmiss_core "Row-wise missing count across core analytic variables"
tabulate rowmiss_core, missing

generate byte complete_case_core = rowmiss_core == 0
label define complete_lbl 0 "Incomplete on core variables" 1 "Complete on core variables"
label values complete_case_core complete_lbl
label variable complete_case_core "Complete case indicator for core analytic variables"
tabulate complete_case_core, missing

* Analytic sample flag. Keep all rows, but mark which rows meet the criteria.
generate byte analytic_sample_flag = complete_case_core == 1 & age_clean >= 18 & age_clean <= 89 & survey_weight_num > 0
label define sample_lbl 0 "Excluded from analytic sample" 1 "Included in analytic sample"
label values analytic_sample_flag sample_lbl
label variable analytic_sample_flag "Analytic sample flag for Module 05 teaching example"
tabulate analytic_sample_flag, missing

* Track sample size changes across steps.
count if !missing(age_clean)
local n_valid_age = r(N)

count if complete_case_core == 1
local n_complete_core = r(N)

count if complete_case_core == 1 & survey_weight_num > 0
local n_positive_weight = r(N)

count if analytic_sample_flag == 1
local n_analytic = r(N)

* Use preserve/restore to inspect the analytic sample without permanently dropping rows.
preserve
keep if analytic_sample_flag == 1
count
summarize age_clean household_income_num survey_weight_num
restore

* Write a sample construction table.
capture file close sample
file open sample using "`sample_report'", write replace text
file write sample "step,n,description" _n
file write sample "1,`n_imported',Imported rows" _n
file write sample "2,`n_valid_age',Rows with valid age after recoding -9 and 999" _n
file write sample "3,`n_complete_core',Rows complete on age gender health income and survey weight" _n
file write sample "4,`n_positive_weight',Rows complete on core variables with positive survey weight" _n
file write sample "5,`n_analytic',Rows included in analytic_sample_flag" _n
file close sample

* Write a short missing-data report.
capture file close miss
file open miss using "`missing_report'", write replace text
file write miss "Module 05 Stata missing-data summary" _n
file write miss "Source file: `raw_csv'" _n
file write miss "Special codes recoded to system missing include -8, -9, 999, 999999, DK, N/A, Not asked, and impossible text values." _n
file write miss "complete_case_core requires nonmissing age_clean, gender_clean, health_ord, household_income_num, and survey_weight_num." _n
file write miss "analytic_sample_flag keeps all rows in the file and marks included observations instead of silently deleting cases." _n
file close miss

* Save the working file with missing-data flags. The raw CSV remains unchanged.
save "`working_file'", replace

display as text "Missing-data workflow complete."
display as text "Working file saved to `working_file'"
display as text "Sample construction report saved to `sample_report'"

log close
