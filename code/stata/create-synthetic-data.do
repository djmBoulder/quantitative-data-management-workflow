* Import synthetic_gss_like CSV files and save Stata .dta versions.
* Run this do-file from the repository root after running code/r/create-synthetic-data.R.
* The R generator also creates the Module 02 Excel file; this do-file only
* converts the CSV teaching files to Stata .dta versions.
* The generated .dta files are local convenience files and are not tracked in Git.
* The output folder data/synthetic/stata/ is ignored by .gitignore.

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

* Keep paths relative so the workflow works on another computer.
local csv_dir "data/synthetic"
local stata_dir "data/synthetic/stata"

capture mkdir "`stata_dir'"

foreach file in synthetic_gss_like_person_2024 synthetic_gss_like_person_2025 synthetic_gss_like_region_context synthetic_gss_like_repeated_measures_wide {
    * Import the CSV exactly as a raw teaching file.
    import delimited using "`csv_dir'/`file'.csv", clear varnames(1) case(lower) bindquote(strict)

    * Standardize imported names that Stata creates from spaced or punctuated CSV headers.
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
    capture rename regionname region_name
    capture rename regionmedianincome region_median_income
    capture rename region_unemploymentrate region_unemployment_rate
    capture rename regionunemploymentrate region_unemployment_rate
    capture rename urbanicityindex urbanicity_index
    capture rename censusdivision census_division

    * Save a Stata version for modules that begin from .dta files.
    save "`stata_dir'/`file'.dta", replace
}

display as text "Saved Stata .dta files in `stata_dir'"
