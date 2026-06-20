* Run Stata Lab Smoke Tests
*
* Instructor-facing QA script for the IBS CU Boulder
* "Quantitative Data Management and Workflow for Social Scientists" microcredential.
*
* Run this do-file from the repository root after Stata is installed:
*
*   do code/stata/run-stata-lab-smoke-tests.do
*
* Optional command-line examples, if Stata is available on your PATH:
*
*   stata-mp -b do code/stata/run-stata-lab-smoke-tests.do
*   stata-se -b do code/stata/run-stata-lab-smoke-tests.do
*
* Exact executable names and paths vary by operating system, Stata edition,
* and campus lab configuration. Running from the Stata GUI is fine.
*
* The script writes generated QA logs and summaries to:
*
*   logs/stata-smoke-tests/
*
* Generated logs, working files, and outputs should remain untracked by Git.

version 17
clear all
set more off

* Confirm this do-file is being run from the repository root.
capture confirm file "AGENTS.md"
if _rc {
    display as error "AGENTS.md not found."
    display as error "Run this do-file from the repository root."
    exit 601
}

capture confirm file "modules/00-orientation/stata_lab.do"
if _rc {
    display as error "Module Stata labs were not found."
    display as error "Run this do-file from the repository root."
    exit 601
}

* Respect repository folder policy. These folders contain generated files.
capture mkdir "logs"
capture mkdir "logs/stata-smoke-tests"
capture mkdir "data/working"
capture mkdir "data/output"

local smoke_dir "logs/stata-smoke-tests"
local summary_txt "`smoke_dir'/stata-smoke-test-summary.txt"
local summary_csv "`smoke_dir'/stata-smoke-test-summary.csv"
local repo_root "`c(pwd)'"
local stata_version "`c(stata_version)'"
local run_date "`c(current_date)'"
local run_time "`c(current_time)'"

capture file close smoke_summary
file open smoke_summary using "`summary_txt'", write text replace
file write smoke_summary "Stata lab smoke-test summary" _n
file write smoke_summary "Repository root: `repo_root'" _n
file write smoke_summary "Stata version: `stata_version'" _n
file write smoke_summary "Run date/time: `run_date' `run_time'" _n
file write smoke_summary "Generated files should remain untracked by Git." _n _n
file write smoke_summary "module,path,status,return_code,module_log,smoke_log_copy" _n
file close smoke_summary

capture file close smoke_csv
file open smoke_csv using "`summary_csv'", write text replace
file write smoke_csv "module,path,status,return_code,module_log,smoke_log_copy" _n
file close smoke_csv

local modules ///
    00-orientation 01-project-workflows 02-importing-data ///
    03-data-documentation 04-cleaning-and-recoding 05-missing-data ///
    06-reshaping-data 07-combining-data 08-quality-assurance ///
    09-reproducible-outputs 10-capstone

local lab_paths ///
    modules/00-orientation/stata_lab.do modules/01-project-workflows/stata_lab.do ///
    modules/02-importing-data/stata_lab.do modules/03-data-documentation/stata_lab.do ///
    modules/04-cleaning-and-recoding/stata_lab.do modules/05-missing-data/stata_lab.do ///
    modules/06-reshaping-data/stata_lab.do modules/07-combining-data/stata_lab.do ///
    modules/08-quality-assurance/stata_lab.do modules/09-reproducible-outputs/stata_lab.do ///
    modules/10-capstone/stata_lab.do

local module_logs ///
    logs/module-00-stata-log.txt logs/module-01-stata-log.txt ///
    logs/module-02-stata-log.txt logs/module-03-stata-log.txt ///
    logs/module-04-stata-log.txt logs/module-05-stata-log.txt ///
    logs/module-06-stata-log.txt logs/module-07-stata-log.txt ///
    logs/module-08-stata-log.txt logs/module-09-stata-log.txt ///
    logs/capstone_stata_log.txt

local smoke_copies ///
    `smoke_dir'/00-orientation-stata-log.txt `smoke_dir'/01-project-workflows-stata-log.txt ///
    `smoke_dir'/02-importing-data-stata-log.txt `smoke_dir'/03-data-documentation-stata-log.txt ///
    `smoke_dir'/04-cleaning-and-recoding-stata-log.txt `smoke_dir'/05-missing-data-stata-log.txt ///
    `smoke_dir'/06-reshaping-data-stata-log.txt `smoke_dir'/07-combining-data-stata-log.txt ///
    `smoke_dir'/08-quality-assurance-stata-log.txt `smoke_dir'/09-reproducible-outputs-stata-log.txt ///
    `smoke_dir'/10-capstone-stata-log.txt

local lab_count 0
local pass_count 0
local fail_count 0

foreach module_id of local modules {
    gettoken lab_do lab_paths : lab_paths
    gettoken module_log module_logs : module_logs
    gettoken smoke_copy smoke_copies : smoke_copies

    local ++lab_count

    display as text _n "Running `module_id'..."

    capture confirm file "`lab_do'"
    if _rc {
        local status "FAIL"
        local rc = _rc
        local ++fail_count
        display as error "Missing lab file: `lab_do'"
    }
    else {
        * Each module lab opens and closes its own log. capture do lets the
        * smoke test continue so instructors get a complete pass/fail summary.
        capture do "`lab_do'"
        local rc = _rc

        * Close any log left open after an unexpected module failure.
        capture log close

        if `rc' == 0 {
            local status "PASS"
            local ++pass_count
        }
        else {
            local status "FAIL"
            local ++fail_count
        }
    }

    * Copy the module's own log into the smoke-test folder when it exists.
    local copied_log "`smoke_copy'"
    capture confirm file "`module_log'"
    if !_rc {
        capture copy "`module_log'" "`smoke_copy'", replace
        if _rc {
            local copied_log ""
        }
    }
    else {
        local copied_log ""
    }

    display as text "`module_id': `status' (return code `rc')"

    capture file close smoke_summary
    file open smoke_summary using "`summary_txt'", write text append
    file write smoke_summary "`module_id',`lab_do',`status',`rc',`module_log',`copied_log'" _n
    file close smoke_summary

    capture file close smoke_csv
    file open smoke_csv using "`summary_csv'", write text append
    file write smoke_csv "`module_id',`lab_do',`status',`rc',`module_log',`copied_log'" _n
    file close smoke_csv
}

capture file close smoke_summary
file open smoke_summary using "`summary_txt'", write text append
file write smoke_summary _n "Labs selected: `lab_count'" _n
file write smoke_summary "Passed: `pass_count'" _n
file write smoke_summary "Failed: `fail_count'" _n
file close smoke_summary

display as text _n "Stata smoke-test summary"
display as text "========================"
display as text "Labs selected: `lab_count'"
display as text "Passed: `pass_count'"
display as text "Failed: `fail_count'"
display as text "Summary text: `summary_txt'"
display as text "Summary CSV:  `summary_csv'"

if `fail_count' > 0 {
    display as error "One or more Stata labs returned errors. Review logs/stata-smoke-tests/."
    exit 9
}

display as text "All selected Stata labs completed without fatal errors."
