# 07 Combining Data Solution Notes

## Instructor Purpose

This module teaches students to combine files safely by distinguishing append operations from keyed merges/joins. It emphasizes duplicate-key diagnosis, relationship checks, unmatched records, merge indicators, and row-count validation.

## Expected Student Outputs

Students should produce or identify:

- A Stata log at `logs/module-07-stata-log.txt`, if Stata is available.
- An R log at `logs/module-07-r-log.txt`.
- Appended person files in `data/working/`.
- Person-level files with region context attached in `data/working/`.
- Combine diagnostics reports in `data/output/`.
- A data combination memo.

Generated files in `data/working/`, `data/output/`, and `logs/` should generally remain uncommitted.

## Expected Combining Decisions

Strong submissions should identify that:

- Appending stacks the 2024 and 2025 person rows.
- `respondent_id` alone is not enough for the appended person-year file.
- `respondent_id` plus `year` should be the person-year key, but the synthetic 2024 file intentionally contains a duplicate.
- Duplicate keys should be diagnosed before merge examples continue.
- The region context primary key is cleaned region name.
- The person file uses cleaned region name as a foreign key.
- `Mountain West` and missing or special region values may not match the context file.
- `Territories` exists in the context file but not in the person rows.
- A left join keeps person rows; an inner join keeps only matched rows; a full join keeps rows from both sides.
- Many-to-many joins should not be used to bypass duplicate-key problems.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: append and row-count checks are correct.
- 20 percent: duplicate and key diagnostics are clear.
- 20 percent: merge/join diagnostics identify unmatched cases and row-count changes.
- 10 percent: memo documents decisions and avoids many-to-many shortcuts.

## Common Student Issues

- Treating `respondent_id` as unique after appending years.
- Ignoring duplicate person-year keys.
- Joining on raw region names without cleaning case and spaces.
- Assuming unmatched records are automatically errors.
- Using inner joins by default and silently dropping rows.
- Failing to document context-only records.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review the handling of the intentional duplicate in the 2024 file. The labs diagnose it and then keep the first duplicate for merge demonstrations so the workflow can proceed. This is a teaching choice, not a universal rule.

The R lab uses dplyr relationship checks available in dplyr 1.1 or later. The Stata lab uses `append`, `merge 1:1`, `merge m:1`, `merge 1:m`, `duplicates`, `isid`, `_merge`, `keepusing()`, and assertions, and should be tested in Stata before release.

## Instructor Check

The R lab can be checked from the repository root:

```r
source("modules/07-combining-data/r_lab.R")
```

The Stata lab should be run from the repository root:

```stata
do modules/07-combining-data/stata_lab.do
```
