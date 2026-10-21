# Stata Helpers

Run module labs from the repository root using the scripts in [modules/](../../modules/README.md). The scripts here support course preparation and checking; they are not additional student assignments.

- `create-synthetic-data.do` converts the supplied CSV teaching files to local Stata `.dta` copies in the ignored `data/synthetic/stata/` folder. The labs can use the supplied files without this step.
- `run-stata-lab-smoke-tests.do` runs the module labs and records results in `logs/stata-smoke-tests/`. A smoke test checks whether a script completes without an execution error.

For student setup, use the [Stata setup guide](../../resources/student-stata-setup.md).
