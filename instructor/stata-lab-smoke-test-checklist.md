# Stata Lab Smoke-Test Checklist

Instructor-facing checklist for testing Stata labs before launch.

Use this checklist from a clean working state when possible. Stata is not always available on every instructor machine, so document which environment was used for testing.

## Test Environment

- [ ] Stata version recorded:
- [ ] Stata edition recorded, if relevant: BE / SE / MP / campus remote environment
- [ ] Operating system recorded:
- [ ] Repository branch or commit recorded:
- [ ] Tester name/date recorded:
- [ ] Test run starts from the repository root: the folder containing `README.md`, `modules/`, `code/`, and `data/`.
- [ ] Existing generated files in `data/working/`, `data/output/`, and `logs/` are cleared or noted before testing.
- [ ] Version notes reviewed: `instructor/stata-version-notes.md`.

## Automated Smoke-Test Workflow

The repository includes an instructor smoke-test do-file:

```stata
do code/stata/run-stata-lab-smoke-tests.do
```

Run it from the repository root after Stata is installed and the synthetic teaching files are present. The repository root is the course folder containing `README.md`, `modules/`, `code/`, and `data/`.

The smoke test:

- runs each module `stata_lab.do` in order,
- checks stable course files and folders instead of development-only files,
- lets each module create its normal generated outputs,
- copies each module log into `logs/stata-smoke-tests/` when possible,
- writes `logs/stata-smoke-tests/stata-smoke-test-summary.txt`,
- writes `logs/stata-smoke-tests/stata-smoke-test-summary.csv`,
- returns a nonzero exit code if one or more labs fail.

Generated files in `data/working/`, `data/output/`, and `logs/` should remain ignored by Git.

Optional command-line execution is possible on machines where Stata command-line tools are configured, but exact executable paths vary by operating system, Stata edition, and campus lab setup. Examples only:

```bash
stata-mp -b do code/stata/run-stata-lab-smoke-tests.do
stata-se -b do code/stata/run-stata-lab-smoke-tests.do
```

Running the do-file from the Stata GUI is acceptable and often simpler.

## Running One Module Manually

To test one module manually, start Stata in the repository root and run one module do-file:

```stata
do modules/03-data-documentation/stata_lab.do
```

Then check:

- the module-specific log in `logs/`,
- generated working files in `data/working/`, if the module creates them,
- generated reports or outputs in `data/output/`,
- whether the do-file completed without a fatal error.

If a manual module test fails, rerun from a clean Stata session before diagnosing the module itself.

## Interpreting Pass/Fail Results

A module is smoke-test passing when:

- Stata completes the do-file without a fatal error,
- the expected module log is created,
- generated outputs are written to ignored folders,
- known teaching data problems are documented rather than treated as unexpected failures.

A module needs follow-up when:

- the do-file returns a nonzero return code,
- Stata cannot find a required synthetic input,
- `import excel` fails in Module 02 or Module 09,
- an expected log or output is missing,
- a log remains open after an error,
- a merge, reshape, or assertion fails unexpectedly.

## General Checks For Every `.do` File

For each lab:

- [ ] Open the `.do` file.
- [ ] Confirm it uses relative paths.
- [ ] Confirm it does not write into `data/synthetic/`.
- [ ] Confirm it creates needed folders or assumes only tracked folders.
- [ ] Run the full `.do` file from top to bottom.
- [ ] Confirm the script finishes without unexpected fatal errors.
- [ ] Confirm expected log file is created in `logs/`.
- [ ] Confirm expected working/output files are created in ignored folders.
- [ ] Confirm log closes properly.
- [ ] Confirm generated files should not be committed.
- [ ] Note expected warnings or intentional data issues.

## Module Checklist

| Module | Stata lab | Smoke-test checks |
| --- | --- | --- |
| 00 Orientation | `modules/00-orientation/stata_lab.do` | Finds synthetic CSV; writes setup report and log. |
| 01 Project workflows | `modules/01-project-workflows/stata_lab.do` | Imports 2024 CSV; inspects variables; saves working `.dta`; writes inspection output and log. |
| 02 Importing data | `modules/02-importing-data/stata_lab.do` | Imports CSV and Excel files; standardizes names; saves imported working copy; writes import inspection. |
| 03 Data documentation | `modules/03-data-documentation/stata_lab.do` | Applies labels/notes; exports data dictionary evidence; saves documented working file. |
| 04 Cleaning and recoding | `modules/04-cleaning-and-recoding/stata_lab.do` | Cleans strings/types; creates derived variables; validates recodes; writes cleaning decisions. |
| 05 Missing data | `modules/05-missing-data/stata_lab.do` | Recodes special missing values; creates row-missing and sample flags; writes sample/missing summaries. |
| 06 Reshaping data | `modules/06-reshaping-data/stata_lab.do` | Imports repeated-measures wide file; reshapes long and wide; validates row counts and keys. |
| 07 Combining data | `modules/07-combining-data/stata_lab.do` | Appends person files; checks duplicate person-year keys; merges region context; writes diagnostics. |
| 08 Quality assurance | `modules/08-quality-assurance/stata_lab.do` | Runs fatal and warning-level QA checks; validates merge; writes QA report. |
| 09 Reproducible outputs | `modules/09-reproducible-outputs/stata_lab.do` | Creates analysis-ready output, summary table, codebook/metadata, workflow log, and memo. |
| 10 Capstone | `modules/10-capstone/stata_lab.do` | Runs full capstone-style workflow; generates analysis-ready data, codebook, QA report, log, and memo. |

## Common Stata Smoke-Test Failures

- Wrong working directory. Run from the folder containing `README.md`, `modules/`, `code/`, and `data/`.
- Missing synthetic CSV or Excel file.
- Excel import unavailable or blocked in the test environment.
- Log already open from an earlier failed run.
- Generated output folder missing.
- Variable names differ from expected import results.
- Merge fails because duplicate keys are intentional and need diagnostic handling.
- File already open in Excel or another program.
- Stata cannot write to `data/output/`, `data/working/`, or `logs/` because of permissions or cloud sync.
- Running selected lines instead of the full do-file leaves required locals, tempfiles, or logs undefined.

## Smoke-Test Record

Use this section during launch prep:

| Module | Pass/fail | Stata version | Operating system | Notes | Follow-up needed |
| --- | --- | --- | --- | --- | --- |
| 00 Orientation |  |  |  |  |  |
| 01 Project workflows |  |  |  |  |  |
| 02 Importing data |  |  |  |  |  |
| 03 Data documentation |  |  |  |  |  |
| 04 Cleaning and recoding |  |  |  |  |  |
| 05 Missing data |  |  |  |  |  |
| 06 Reshaping data |  |  |  |  |  |
| 07 Combining data |  |  |  |  |  |
| 08 Quality assurance |  |  |  |  |  |
| 09 Reproducible outputs |  |  |  |  |  |
| 10 Capstone |  |  |  |  |  |

## After Testing

- [ ] Review `logs/stata-smoke-tests/stata-smoke-test-summary.txt`.
- [ ] Review failed module logs copied into `logs/stata-smoke-tests/`.
- [ ] Confirm generated files were not staged for commit.
- [ ] Record unresolved issues in instructor notes before launch.
