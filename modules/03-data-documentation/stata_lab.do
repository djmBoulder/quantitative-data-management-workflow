* 03 Data Documentation, Metadata, and Codebooks Stata Lab
* Purpose: document synthetic_gss_like with labels, value labels, notes,
* derived-variable documentation, and a small data dictionary.
* Run this do-file from the repository root.
* Beginner note: if running interactively, run the setup block from version
* through log using as a block before running later lines. Do not run isolated
* lines that depend on local macros, imported data, or open logs.

version 17
clear all
set more off

* Store project-relative paths in locals.
local raw_csv "data/synthetic/synthetic_gss_like_person_2024.csv"
local working_file "data/working/synthetic_gss_like_person_2024_documented.dta"
local dictionary_file "data/output/module-03-stata-data-dictionary.csv"
local log_file "logs/module-03-stata-log.txt"

* Create output folders if they do not already exist.
capture mkdir "logs"
capture mkdir "data/working"
capture mkdir "data/output"

* Start a plain-text log so documentation output can be reviewed.
capture log close
log using "logs/module-03-stata-log.txt", text replace

display as text "Module 03 Stata documentation log"
display as text "Raw data file: `raw_csv'"

* Confirm the raw teaching file exists and import it without manual editing.
confirm file "`raw_csv'"
import delimited using "`raw_csv'", clear varnames(1) case(lower) bindquote(strict)

* Standardize imported names to match the course data dictionary.
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

* Inspect the imported dataset before adding documentation.
describe
codebook respondent_id year age gender region education

* Label the dataset and core variables.
label data "Documented synthetic_gss_like person-level survey data, 2024"

label variable respondent_id "Synthetic respondent identifier"
label variable year "Survey year"
label variable age "Respondent age in years"
label variable gender "Raw self-reported gender text"
label variable race_ethnicity "Raw race and ethnicity category"
label variable education "Raw highest education category"
label variable marital_status "Raw marital status category"
label variable region "Raw respondent region"
label variable employment_status "Raw employment status category"
label variable hours_worked "Raw hours worked in the last week"
label variable household_income "Raw annual household income text"
label variable self_rated_health "Raw self-rated general health"
label variable smoking_status "Raw current smoking status"
label variable physical_activity_days "Raw days of physical activity in the last week"
label variable survey_weight "Raw synthetic survey weight"
label variable interview_mode "Raw survey interview mode"

* Add dataset-level and variable-level notes.
notes: Source file is data/synthetic/synthetic_gss_like_person_2024.csv.
notes: Unit of observation is one synthetic survey response in 2024.
notes: Raw values are intentionally messy for teaching and are not fully cleaned in this module.
notes age: Values -9 and 999 are special teaching codes that should be documented before analysis.
notes gender: Raw text includes inconsistent capitalization and missing or not-reported values.
notes region: Raw text includes inconsistent capitalization and region keys for later merge practice.
notes household_income: Raw text may include dollar signs, commas, blanks, and special missing codes.

* Create a documented derived gender variable from the raw text.
gen byte gender_doc = .
replace gender_doc = 1 if strlower(strtrim(gender)) == "female"
replace gender_doc = 2 if strlower(strtrim(gender)) == "male"
replace gender_doc = 3 if strlower(strtrim(gender)) == "nonbinary"
replace gender_doc = 9 if inlist(strlower(strtrim(gender)), "prefer not to answer", "-9", "")

label define gender_doc_lbl 1 "Female" 2 "Male" 3 "Nonbinary" 9 "Missing or not reported"
label values gender_doc gender_doc_lbl
label variable gender_doc "Documented gender category derived from raw gender text"
notes gender_doc: Derived from gender by trimming spaces and standardizing capitalization.
notes gender_doc: Code 9 combines special missing and not-reported responses for documentation practice.

* Create a documented ordered health variable from the raw text.
gen byte health_doc = .
replace health_doc = 5 if strlower(strtrim(self_rated_health)) == "excellent"
replace health_doc = 4 if strlower(strtrim(self_rated_health)) == "very good"
replace health_doc = 3 if strlower(strtrim(self_rated_health)) == "good"
replace health_doc = 2 if strlower(strtrim(self_rated_health)) == "fair"
replace health_doc = 1 if strlower(strtrim(self_rated_health)) == "poor"
replace health_doc = 9 if inlist(strlower(strtrim(self_rated_health)), "dk", "-9", "")

label define health_doc_lbl 1 "Poor" 2 "Fair" 3 "Good" 4 "Very good" 5 "Excellent" 9 "Missing or not reported"
label values health_doc health_doc_lbl
label variable health_doc "Documented ordered self-rated health category"
notes health_doc: Derived from self_rated_health for documentation practice.
notes health_doc: Higher values indicate better self-rated health, except code 9 marks missing or not reported.

* Create a demonstration analytic sample indicator.
gen byte analytic_sample_demo = age >= 18 & age <= 89 & gender_doc < . & gender_doc != 9
label define yesno_lbl 0 "Excluded from demonstration sample" 1 "Included in demonstration sample"
label values analytic_sample_demo yesno_lbl
label variable analytic_sample_demo "Demonstration analytic sample indicator"
notes analytic_sample_demo: Includes respondents ages 18-89 with documented gender values 1, 2, or 3.
notes analytic_sample_demo: This is a documentation example; later modules cover missing data and analytic samples in depth.

* Put documented variables near the variables they describe.
order respondent_id year age gender gender_doc race_ethnicity education marital_status region employment_status ///
    hours_worked household_income self_rated_health health_doc smoking_status physical_activity_days ///
    survey_weight interview_mode analytic_sample_demo

* Review labels, value labels, and notes.
describe
codebook gender_doc health_doc analytic_sample_demo
labelbook gender_doc_lbl health_doc_lbl yesno_lbl
notes list

* Compress safely before saving the documented working file.
compress
save "`working_file'", replace

* Write a simple data dictionary CSV that can be read outside Stata.
capture file close dict
file open dict using "`dictionary_file'", write replace text
file write dict "variable_name,description,source_or_derivation,coding_or_notes" _n
file write dict "respondent_id,Synthetic respondent identifier,Raw imported variable,Person-level identifier; duplicate checks happen in later modules" _n
file write dict "year,Survey year,Renamed from Survey Year/survey_year,All records in this file are 2024" _n
file write dict "age,Respondent age in years,Raw imported variable,Special codes -9 and 999 require later missing-data decisions" _n
file write dict "gender,Raw self-reported gender text,Raw imported variable,Includes inconsistent capitalization and not-reported values" _n
file write dict "gender_doc,Documented gender category,Derived from gender,1 Female; 2 Male; 3 Nonbinary; 9 Missing or not reported" _n
file write dict "self_rated_health,Raw self-rated general health,Raw imported variable,Includes DK and special missing codes" _n
file write dict "health_doc,Documented ordered self-rated health category,Derived from self_rated_health,1 Poor through 5 Excellent; 9 Missing or not reported" _n
file write dict "analytic_sample_demo,Demonstration analytic sample indicator,Derived from age and gender_doc,Includes ages 18-89 with documented gender values 1-3" _n
file close dict

display as text "Documentation workflow complete."
display as text "Documented Stata file saved to `working_file'"
display as text "Data dictionary saved to `dictionary_file'"

log close
