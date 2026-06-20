* 04 Cleaning, Typing, Labeling, and Recoding Variables Stata Lab
* Purpose: clean selected synthetic_gss_like variables while preserving the
* original source variables and documenting recode decisions.
* Run this do-file from the repository root.

version 17
clear all
set more off

* Store project-relative paths in locals.
local raw_csv "data/synthetic/synthetic_gss_like_person_2024.csv"
local working_file "data/working/synthetic_gss_like_person_2024_cleaned.dta"
local decision_log "data/output/module-04-stata-cleaning-decisions.txt"
local log_file "logs/module-04-stata-log.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/working"
capture mkdir "data/output"

* Start a plain-text log for review.
capture log close
log using "`log_file'", text replace

display as text "Module 04 Stata cleaning and recoding log"
display as text "Raw data file: `raw_csv'"

* Import the raw CSV without manual edits.
confirm file "`raw_csv'"
import delimited using "`raw_csv'", clear varnames(1) case(lower) bindquote(strict)
capture rename survey_year year

* Inspect selected raw variables before cleaning.
describe age gender region employment_status hours_worked household_income self_rated_health physical_activity_days survey_weight
tabulate gender, missing
tabulate employment_status, missing
summarize age

* ---------------------------------------------------------------------------
* Preserve source variables and create cleaned versions.
* ---------------------------------------------------------------------------

* Clean age by preserving the raw numeric variable and setting special codes to missing.
generate age_clean = age
replace age_clean = . if inlist(age_clean, -9, 999)
label variable age_clean "Age in years, with special missing codes set to missing"
assert age_clean >= 18 & age_clean <= 89 if !missing(age_clean)

* Recode continuous age into transparent categories.
recode age_clean (18/29 = 1) (30/44 = 2) (45/64 = 3) (65/max = 4), generate(age_group)
label define age_group_lbl 1 "18-29" 2 "30-44" 3 "45-64" 4 "65+"
label values age_group age_group_lbl
label variable age_group "Age category derived from age_clean"
tabulate age_group, missing

* Standardize gender text with lower() and trim(), then create a labeled categorical variable.
generate gender_text_clean = lower(trim(gender))
replace gender_text_clean = "" if inlist(gender_text_clean, "-9", "prefer not to answer")
label variable gender_text_clean "Standardized gender text derived from raw gender"

generate byte gender_clean = .
replace gender_clean = 1 if gender_text_clean == "female"
replace gender_clean = 2 if gender_text_clean == "male"
replace gender_clean = 3 if gender_text_clean == "nonbinary"
label define gender_clean_lbl 1 "Female" 2 "Male" 3 "Nonbinary"
label values gender_clean gender_clean_lbl
label variable gender_clean "Cleaned gender category"
tabulate gender gender_clean, missing

* Demonstrate upper() by creating an uppercase region text variable for checking.
generate region_text_clean = lower(trim(region))
replace region_text_clean = "" if region_text_clean == "-9"
generate region_upper_check = upper(region_text_clean)
label variable region_text_clean "Standardized region text derived from raw region"
label variable region_upper_check "Uppercase region text for checking standardization"
tabulate region region_text_clean, missing

* Encode/decode demonstrate string-to-category and category-to-string workflows.
encode region_text_clean, generate(region_code)
label variable region_code "Encoded region category from region_text_clean"
decode region_code, generate(region_from_code)
label variable region_from_code "Decoded region text from region_code"
tabulate region_code, missing

* Convert respondent ID to string for systems that require text IDs.
tostring respondent_id, generate(respondent_id_text) format(%12.0f)
label variable respondent_id_text "Respondent ID converted to string"

* Clean hours worked by removing special text values before destring.
generate hours_worked_text = lower(trim(hours_worked))
replace hours_worked_text = "" if inlist(hours_worked_text, "-8", "-9", "n/a", "forty")
destring hours_worked_text, generate(hours_worked_num)
label variable hours_worked_num "Hours worked last week, numeric cleaned version"
assert hours_worked_num >= 0 & hours_worked_num <= 60 if !missing(hours_worked_num)

* Clean household income by removing symbols and special codes before destring.
generate household_income_text = lower(trim(household_income))
replace household_income_text = subinstr(household_income_text, "$", "", .)
replace household_income_text = subinstr(household_income_text, ",", "", .)
replace household_income_text = "" if inlist(household_income_text, "-8", "999999", "not asked")
destring household_income_text, generate(household_income_num)
label variable household_income_num "Household income numeric cleaned version"
assert household_income_num >= 0 if !missing(household_income_num)

* Clean physical activity days.
generate physical_activity_text = lower(trim(physical_activity_days))
replace physical_activity_text = "" if inlist(physical_activity_text, "-9", "not asked", "eight")
destring physical_activity_text, generate(physical_activity_days_num)
label variable physical_activity_days_num "Physical activity days, numeric cleaned version"
assert physical_activity_days_num >= 0 & physical_activity_days_num <= 7 if !missing(physical_activity_days_num)

* Clean survey weight. The value 1,25 uses a comma as a decimal mark.
generate survey_weight_text = trim(survey_weight)
replace survey_weight_text = subinstr(survey_weight_text, ",", ".", .)
replace survey_weight_text = "" if survey_weight_text == "-9"
destring survey_weight_text, generate(survey_weight_num)
label variable survey_weight_num "Survey weight numeric cleaned version"
assert survey_weight_num > 0 if !missing(survey_weight_num)

* Create a binary employment indicator from standardized employment text.
generate employment_text_clean = lower(trim(employment_status))
replace employment_text_clean = "" if inlist(employment_text_clean, "-8", "-9")
generate byte employed_flag = .
replace employed_flag = 1 if inlist(employment_text_clean, "employed full time", "employed part time")
replace employed_flag = 0 if inlist(employment_text_clean, "unemployed", "student", "retired", "not in labor force")
label define employed_lbl 0 "Not employed" 1 "Employed"
label values employed_flag employed_lbl
label variable employed_flag "Binary employment indicator derived from employment_status"
tabulate employment_status employed_flag, missing

* Create an ordinal self-rated health variable.
generate health_text_clean = lower(trim(self_rated_health))
replace health_text_clean = "" if inlist(health_text_clean, "-9", "dk")
generate byte health_ord = .
replace health_ord = 1 if health_text_clean == "poor"
replace health_ord = 2 if health_text_clean == "fair"
replace health_ord = 3 if health_text_clean == "good"
replace health_ord = 4 if health_text_clean == "very good"
replace health_ord = 5 if health_text_clean == "excellent"
label define health_ord_lbl 1 "Poor" 2 "Fair" 3 "Good" 4 "Very good" 5 "Excellent"
label values health_ord health_ord_lbl
label variable health_ord "Ordinal self-rated health derived from self_rated_health"
assert inrange(health_ord, 1, 5) if !missing(health_ord)

* Use egen for a grouped descriptive check after cleaning.
egen mean_hours_by_gender = mean(hours_worked_num), by(gender_clean)
label variable mean_hours_by_gender "Mean cleaned hours worked within gender_clean"

* ---------------------------------------------------------------------------
* Review and document the cleaned variables.
* ---------------------------------------------------------------------------

tabulate gender_clean, missing
tabulate age_group, missing
tabulate employed_flag, missing
tabulate health_ord, missing
summarize age_clean hours_worked_num household_income_num physical_activity_days_num survey_weight_num

* Write a simple cleaning decision log.
capture file close decisions
file open decisions using "`decision_log'", write replace text
file write decisions "Module 04 Stata cleaning decision log" _n
file write decisions "Source file: `raw_csv'" _n
file write decisions "age_clean: age with -9 and 999 set to missing." _n
file write decisions "age_group: age_clean recoded into 18-29, 30-44, 45-64, and 65+." _n
file write decisions "gender_clean: raw gender trimmed, lowercased, and recoded into labeled categories." _n
file write decisions "region_text_clean and region_code: raw region trimmed/lowercased and encoded for category practice." _n
file write decisions "hours_worked_num: text codes -8, -9, N/A, and forty set to missing before destring." _n
file write decisions "household_income_num: dollar signs and commas removed; -8, 999999, and Not asked set to missing." _n
file write decisions "employed_flag: full-time and part-time employment coded 1; other known statuses coded 0." _n
file write decisions "health_ord: self-rated health recoded from Poor to Excellent as 1-5." _n
file write decisions "Original source variables were preserved." _n
file close decisions

* Save the cleaned working copy. The raw CSV remains unchanged.
save "`working_file'", replace

display as text "Cleaning workflow complete."
display as text "Cleaned Stata file saved to `working_file'"
display as text "Cleaning decision log saved to `decision_log'"

log close
