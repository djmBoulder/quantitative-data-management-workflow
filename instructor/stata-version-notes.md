# Stata Version Notes

Instructor-facing notes for testing the Stata pathway in the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential.

## Course Baseline

The Stata labs currently begin with:

```stata
version 17
```

This means the labs are written to use Stata 17-compatible behavior as the baseline. Instructors should be able to test the labs in Stata 17, 18, or 19, but the exact teaching environment should still be recorded during launch prep.

## Stata 17

Stata 17 is the baseline target for the current `.do` files.

Instructor checks:

- Confirm `import delimited` reads the synthetic CSV files from `data/synthetic/`.
- Confirm `import excel` reads `data/synthetic/synthetic_gss_like_person_2024.xlsx` in Module 02.
- Confirm `export excel` works in Module 09 if Excel outputs are part of the offering.
- Confirm logs can be written to `logs/` and outputs can be written to `data/output/`.

## Stata 18

Stata 18 should generally run Stata 17-compatible code without changes when the labs use `version 17`.

Instructor checks:

- Confirm CSV imports produce the expected variable names after `case(lower)` and `capture rename survey_year year`.
- Confirm Excel import/export behavior matches Module 02 and Module 09 expectations.
- Confirm any warning messages are ordinary import or replacement notes rather than fatal errors.

## Stata 19

Stata 19 should generally run Stata 17-compatible code without changes when the labs use `version 17`.

Instructor checks:

- Confirm the smoke-test workflow runs all module labs in order.
- Confirm generated logs and outputs are written to ignored folders.
- Confirm import/export behavior is consistent with the synthetic data dictionary and module assignments.

## Common Environment Differences

Do not assume a failure is caused by Stata version until these environment issues are checked:

- The do-file was not run from the repository root.
- The repository is in a folder where Stata cannot write files.
- A generated output is open in Excel or another program.
- A campus remote desktop or lab image has restricted folder permissions.
- The Excel teaching file is missing because synthetic data were not regenerated or pulled with the repository.
- Command-line Stata executable names differ by operating system and Stata edition.

## What To Record During Testing

For each smoke-test pass, record:

- Stata version and edition,
- operating system,
- local machine, campus lab, or remote environment,
- repository branch or commit,
- whether the full smoke-test script passed,
- any modules requiring manual follow-up,
- any version-specific warnings that students may see.

## When To Update These Notes

Update this file if an instructor confirms a real version-specific issue, such as a reproducible import/export difference in Stata 17, 18, or 19. Avoid adding speculative problems before they are observed in testing.
