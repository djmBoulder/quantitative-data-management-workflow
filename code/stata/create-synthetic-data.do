* Import synthetic_gss_like CSV files and save Stata .dta versions.
* Run this do-file from the repository root after running code/r/create-synthetic-data.R.
* The R generator also creates the Module 02 Excel file; this do-file only
* converts the CSV teaching files to Stata .dta versions.
* The generated .dta files are local convenience files and are not tracked in Git.
* The output folder data/synthetic/stata/ is ignored by .gitignore.

version 17
clear all
set more off

* Keep paths relative so the workflow works on another computer.
local csv_dir "data/synthetic"
local stata_dir "data/synthetic/stata"

capture mkdir "`stata_dir'"

foreach file in synthetic_gss_like_person_2024 synthetic_gss_like_person_2025 synthetic_gss_like_region_context synthetic_gss_like_repeated_measures_wide {
    * Import the CSV exactly as a raw teaching file.
    import delimited using "`csv_dir'/`file'.csv", clear varnames(1) bindquote(strict)

    * Save a Stata version for modules that begin from .dta files.
    save "`stata_dir'/`file'.dta", replace
}

display as text "Saved Stata .dta files in `stata_dir'"
