* 10 Capstone Data Management Portfolio Stata Lab
* Purpose: build one complete reproducible workflow from raw synthetic inputs
* to an analysis-ready dataset, codebook, QA report, workflow memo, and log.
* Run this do-file from the repository root.
* Beginner note: if running interactively, run the setup block from version
* through log using as a block before running later lines. Do not run isolated
* lines that depend on local macros, tempfiles, imported data, or open logs.

version 17
clear all
set more off

* Store project-relative paths in locals.
local person_2024_csv "data/synthetic/synthetic_gss_like_person_2024.csv"
local person_2025_csv "data/synthetic/synthetic_gss_like_person_2025.csv"
local region_csv "data/synthetic/synthetic_gss_like_region_context.csv"

local analysis_dta "data/output/capstone_analysis_ready_stata.dta"
local analysis_csv "data/output/capstone_analysis_ready_stata.csv"
local codebook_md "data/output/capstone_codebook_stata.md"
local qa_report_md "data/output/capstone_qa_report_stata.md"
local workflow_memo_md "data/output/capstone_workflow_memo_stata.md"
local log_file "logs/module-10-stata-log.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/output"

* Start a plain-text log for review.
capture log close
log using "logs/module-10-stata-log.txt", text replace

display as text "Capstone Stata workflow log"

* Required input files must exist before the workflow begins.
confirm file "`person_2024_csv'"
confirm file "`person_2025_csv'"
confirm file "`region_csv'"

* ---------------------------------------------------------------------------
* 1. Import raw synthetic person-level files.
* ---------------------------------------------------------------------------

tempfile person2024 person2025 appended cleaned region_context merged analysis_ready

import delimited using "`person_2024_csv'", clear varnames(1) case(lower) stringcols(_all) bindquote(strict)
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
generate str45 source_file = "synthetic_gss_like_person_2024.csv"
destring respondent_id year age, replace force
count
local n_2024 = r(N)
save `person2024', replace

import delimited using "`person_2025_csv'", clear varnames(1) case(lower) stringcols(_all) bindquote(strict)
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
generate str45 source_file = "synthetic_gss_like_person_2025.csv"
destring respondent_id year age, replace force
count
local n_2025 = r(N)
save `person2025', replace

foreach var in respondent_id year age gender race_ethnicity education marital_status region employment_status hours_worked household_income self_rated_health smoking_status physical_activity_days survey_weight {
    use `person2024', clear
    confirm variable `var'
    use `person2025', clear
    confirm variable `var'
}

display as text "Rows imported from 2024 person file: `n_2024'"
display as text "Rows imported from 2025 person file: `n_2025'"

* ---------------------------------------------------------------------------
* 2. Append person-level files and verify row counts.
* ---------------------------------------------------------------------------

use `person2024', clear
append using `person2025'
count
local n_appended = r(N)
assert `n_appended' == `n_2024' + `n_2025'

display as text "Rows after append: `n_appended'"

duplicates report respondent_id year
duplicates tag respondent_id year, generate(duplicate_key)
count if duplicate_key > 0
local duplicate_key_rows = r(N)

bysort respondent_id year: generate duplicate_order = _n
bysort respondent_id year: generate duplicate_group_n = _N

* ---------------------------------------------------------------------------
* 3. Clean, recode, and handle missing data.
* ---------------------------------------------------------------------------

generate age_clean = age
replace age_clean = . if inlist(age_clean, -9, 999)
label variable age_clean "Age in years after special missing codes were recoded"

generate gender_text = lower(trim(gender))
replace gender_text = "" if inlist(gender_text, "", "-9", "prefer not to answer")
generate str20 gender_clean = ""
replace gender_clean = "Female" if gender_text == "female"
replace gender_clean = "Male" if gender_text == "male"
replace gender_clean = "Nonbinary" if gender_text == "nonbinary"
label variable gender_clean "Cleaned gender category"

generate race_ethnicity_clean = strproper(strtrim(race_ethnicity))
replace race_ethnicity_clean = "" if race_ethnicity_clean == "-9"
label variable race_ethnicity_clean "Cleaned race and ethnicity category"

generate education_clean = strproper(strtrim(education))
replace education_clean = "" if education_clean == "-9"
label variable education_clean "Cleaned education category"

generate marital_status_clean = strproper(strtrim(marital_status))
replace marital_status_clean = "" if marital_status_clean == "-9"
label variable marital_status_clean "Cleaned marital status category"

generate region_key = lower(trim(region))
replace region_key = "" if region_key == "-9"
generate region_clean = strproper(strtrim(region_key))
label variable region_clean "Cleaned person-level region category"

generate employment_status_clean = strproper(strtrim(employment_status))
replace employment_status_clean = "" if employment_status_clean == "-9"
label variable employment_status_clean "Cleaned employment status category"

generate hours_text = lower(trim(hours_worked))
replace hours_text = "" if inlist(hours_text, "-8", "-9", "n/a", "forty")
destring hours_text, generate(hours_worked_num)
label variable hours_worked_num "Usual hours worked per week as numeric"

generate income_text = lower(trim(household_income))
replace income_text = subinstr(income_text, "$", "", .)
replace income_text = subinstr(income_text, ",", "", .)
replace income_text = "" if inlist(income_text, "", "-8", "999999", "not asked")
destring income_text, generate(household_income_num)
label variable household_income_num "Household income as numeric dollars"

generate health_text = lower(trim(self_rated_health))
replace health_text = "" if inlist(health_text, "", "-9", "dk")
generate self_rated_health_ord = .
replace self_rated_health_ord = 1 if health_text == "poor"
replace self_rated_health_ord = 2 if health_text == "fair"
replace self_rated_health_ord = 3 if health_text == "good"
replace self_rated_health_ord = 4 if health_text == "very good"
replace self_rated_health_ord = 5 if health_text == "excellent"
label define health_lbl 1 "Poor" 2 "Fair" 3 "Good" 4 "Very good" 5 "Excellent"
label values self_rated_health_ord health_lbl
label variable self_rated_health_ord "Self-rated health ordinal scale"

generate smoking_status_clean = strproper(strtrim(smoking_status))
replace smoking_status_clean = "" if inlist(smoking_status_clean, "", "-9")
label variable smoking_status_clean "Cleaned smoking status category"

generate activity_text = lower(trim(physical_activity_days))
replace activity_text = "" if inlist(activity_text, "-9", "not asked", "eight")
destring activity_text, generate(physical_activity_days_num)
label variable physical_activity_days_num "Physical activity days per week as numeric"

generate weight_text = trim(survey_weight)
replace weight_text = subinstr(weight_text, ",", ".", .)
replace weight_text = "" if inlist(weight_text, "", "-9")
destring weight_text, generate(survey_weight_num)
label variable survey_weight_num "Positive survey weight as numeric"

assert missing(age_clean) | (age_clean >= 18 & age_clean <= 89)
assert missing(physical_activity_days_num) | (physical_activity_days_num >= 0 & physical_activity_days_num <= 7)
assert missing(survey_weight_num) | survey_weight_num > 0

count if missing(age_clean)
local missing_age = r(N)
count if gender_clean == ""
local missing_gender = r(N)
count if missing(household_income_num)
local missing_income = r(N)
count if missing(self_rated_health_ord)
local missing_health = r(N)
count if missing(survey_weight_num)
local missing_weight = r(N)
count if region_key == ""
local missing_region_key = r(N)

save `cleaned', replace

* ---------------------------------------------------------------------------
* 4. Import and merge region context.
* ---------------------------------------------------------------------------

import delimited using "`region_csv'", clear varnames(1) case(lower) stringcols(_all) bindquote(strict)
capture rename regionname region_key
capture rename region_name region_key
capture rename regionmedianincome region_median_income
capture rename region_unemploymentrate region_unemployment_rate
capture rename regionunemploymentrate region_unemployment_rate
capture rename urbanicityindex urbanicity_index
capture rename censusdivision census_division
replace region_key = lower(trim(region_key))
replace region_median_income = subinstr(region_median_income, "$", "", .)
replace region_median_income = subinstr(region_median_income, ",", "", .)
replace region_unemployment_rate = subinstr(region_unemployment_rate, "%", "", .)
destring region_median_income region_unemployment_rate urbanicity_index, replace force
isid region_key
save `region_context', replace

use `cleaned', clear
count
local pre_merge_rows = r(N)
merge m:1 region_key using `region_context', keep(master match)
count
local post_merge_rows = r(N)
assert `post_merge_rows' == `pre_merge_rows'
tabulate _merge, missing

count if _merge == 1
local person_unmatched = r(N)
count if _merge == 3
local person_matched = r(N)

generate str12 region_merge_status = "unmatched"
replace region_merge_status = "matched" if _merge == 3
label variable region_merge_status "Region merge status"

save `merged', replace

* ---------------------------------------------------------------------------
* 5. Create final sample flag and analysis-ready dataset.
* ---------------------------------------------------------------------------

generate analytic_sample_flag = duplicate_order == 1 ///
    & region_merge_status == "matched" ///
    & !missing(age_clean) ///
    & age_clean >= 18 ///
    & age_clean <= 89 ///
    & gender_clean != "" ///
    & !missing(household_income_num) ///
    & !missing(self_rated_health_ord) ///
    & !missing(survey_weight_num) ///
    & survey_weight_num > 0
label variable analytic_sample_flag "Included in capstone analysis-ready output"

tabulate analytic_sample_flag, missing
summarize age_clean hours_worked_num household_income_num self_rated_health_ord physical_activity_days_num survey_weight_num
codebook respondent_id year age_clean gender_clean region_clean household_income_num self_rated_health_ord survey_weight_num

keep if analytic_sample_flag == 1
keep respondent_id year age_clean gender_clean race_ethnicity_clean education_clean marital_status_clean region_clean census_division region_median_income region_unemployment_rate urbanicity_index employment_status_clean hours_worked_num household_income_num self_rated_health_ord smoking_status_clean physical_activity_days_num survey_weight_num source_file

rename age_clean age
rename gender_clean gender
rename race_ethnicity_clean race_ethnicity
rename education_clean education
rename marital_status_clean marital_status
rename region_clean region
rename employment_status_clean employment_status
rename hours_worked_num hours_worked
rename household_income_num household_income
rename self_rated_health_ord self_rated_health
rename smoking_status_clean smoking_status
rename physical_activity_days_num physical_activity_days
rename survey_weight_num survey_weight

isid respondent_id year
count
local final_rows = r(N)
local final_vars = c(k)

save `analysis_ready', replace
save "`analysis_dta'", replace
export delimited using "`analysis_csv'", replace

* ---------------------------------------------------------------------------
* 6. Write capstone documentation outputs.
* ---------------------------------------------------------------------------

capture file close cb
file open cb using "`codebook_md'", write replace text
file write cb "# Capstone Stata Codebook" _n _n
file write cb "| Variable | Description | Source or derivation |" _n
file write cb "| --- | --- | --- |" _n
file write cb "| respondent_id | Synthetic respondent identifier | Person files |" _n
file write cb "| year | Survey year | Person files |" _n
file write cb "| age | Age in years | age; -9 and 999 set to missing |" _n
file write cb "| gender | Cleaned gender category | Gender; capitalization and nonresponse cleaned |" _n
file write cb "| race_ethnicity | Cleaned race and ethnicity category | Race / ethnicity; capitalization cleaned |" _n
file write cb "| education | Cleaned education category | education; capitalization cleaned |" _n
file write cb "| marital_status | Cleaned marital status category | Marital Status; capitalization cleaned |" _n
file write cb "| region | Cleaned person-level region category | region; cleaned and used for region merge |" _n
file write cb "| census_division | Contextual Census division | Region context file |" _n
file write cb "| region_median_income | Contextual region median income | Region context file |" _n
file write cb "| region_unemployment_rate | Contextual unemployment rate | Region context file |" _n
file write cb "| urbanicity_index | Contextual urbanicity index | Region context file |" _n
file write cb "| employment_status | Cleaned employment status category | employment status; capitalization cleaned |" _n
file write cb "| hours_worked | Usual hours worked per week | hours_worked; special codes and text values set to missing |" _n
file write cb "| household_income | Household income in dollars | Household Income; currency marks, commas, special codes, and text values cleaned |" _n
file write cb "| self_rated_health | Ordinal self-rated health | Self Rated Health; DK and special codes set to missing before ordinal coding |" _n
file write cb "| smoking_status | Cleaned smoking status category | smoking_status; blanks and special codes set to missing |" _n
file write cb "| physical_activity_days | Physical activity days per week | Physical Activity Days; special codes and text values set to missing |" _n
file write cb "| survey_weight | Positive survey weight | survey weight; comma decimals, blanks, and special codes cleaned |" _n
file write cb "| source_file | Synthetic source file used for the row | Created during import for provenance |" _n
file close cb

capture file close qa
file open qa using "`qa_report_md'", write replace text
file write qa "# Capstone Stata QA Report" _n _n
file write qa "## Append Checks" _n
file write qa "- 2024 input rows: `n_2024'." _n
file write qa "- 2025 input rows: `n_2025'." _n
file write qa "- Appended rows: `n_appended'." _n
file write qa "- Appended rows were checked against the sum of input rows." _n
file write qa "- Duplicate respondent-year rows diagnosed: `duplicate_key_rows'." _n _n
file write qa "## Missing Data And Coding Checks" _n
file write qa "- Missing age after recoding: `missing_age'." _n
file write qa "- Missing gender after recoding: `missing_gender'." _n
file write qa "- Missing income after recoding: `missing_income'." _n
file write qa "- Missing health after recoding: `missing_health'." _n
file write qa "- Missing survey weight after recoding: `missing_weight'." _n
file write qa "- Range checks passed for age, physical activity days, and survey weight." _n _n
file write qa "## Merge Checks" _n
file write qa "- Person rows before region merge: `pre_merge_rows'." _n
file write qa "- Person rows after region merge: `post_merge_rows'." _n
file write qa "- Person rows without region context match: `person_unmatched'." _n
file write qa "- Person rows with region context match: `person_matched'." _n _n
file write qa "## Final Sample" _n
file write qa "- Final analysis-ready rows: `final_rows'." _n
file write qa "- Final analysis-ready variables: `final_vars'." _n
file write qa "- Final respondent-year keys were checked for duplicates." _n
file close qa

capture file close memo
file open memo using "`workflow_memo_md'", write replace text
file write memo "# Capstone Stata Workflow Memo" _n _n
file write memo "## Purpose" _n
file write memo "This portfolio uses synthetic survey-style data to demonstrate a reproducible data management workflow from raw inputs to an analysis-ready dataset." _n _n
file write memo "## Raw Inputs" _n
file write memo "- `person_2024_csv'." _n
file write memo "- `person_2025_csv'." _n
file write memo "- `region_csv'." _n _n
file write memo "## Script And Log" _n
file write memo "- Script: modules/10-capstone/stata_lab.do." _n
file write memo "- Log: `log_file'." _n _n
file write memo "## Major Decisions" _n
file write memo "- Person-level files were appended after row counts were checked." _n
file write memo "- Special missing codes and text placeholders were converted to missing values in derived variables." _n
file write memo "- Region context was merged with a many-to-one merge after checking key uniqueness." _n
file write memo "- The final analytic sample keeps nonduplicate respondent-year rows with matched region context and valid core variables." _n _n
file write memo "## Final Outputs" _n
file write memo "- Analysis-ready Stata file: `analysis_dta'." _n
file write memo "- Analysis-ready CSV: `analysis_csv'." _n
file write memo "- Codebook: `codebook_md'." _n
file write memo "- QA report: `qa_report_md'." _n _n
file write memo "## Limitations" _n
file write memo "- The data are synthetic and intended only for teaching." _n
file write memo "- Some observations are excluded because the raw files intentionally contain duplicate keys, special missing codes, or unmatched region keys." _n
file write memo "- The workflow should be rerun from the project root whenever outputs need to change." _n
file close memo

display as text "Capstone Stata workflow complete."
display as text "Analysis-ready rows: `final_rows'"
display as text "Analysis-ready Stata file saved to `analysis_dta'"
display as text "Codebook saved to `codebook_md'"
display as text "QA report saved to `qa_report_md'"
display as text "Workflow memo saved to `workflow_memo_md'"

log close
