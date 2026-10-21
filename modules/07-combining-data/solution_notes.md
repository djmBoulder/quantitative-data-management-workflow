# 07 Combining Data Solution Notes

Instructor-facing notes. Included for faculty review; use the module assignment and rubric for student submission requirements. Do not copy solution text into student-facing lessons.

## Instructor Purpose

This module teaches students to combine files safely by distinguishing append operations from merges matched on identifiers. It emphasizes duplicate-key diagnosis, relationship checks, unmatched records, merge indicators, and row-count validation.

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
- The region context unique identifier is cleaned region name.
- The person file uses cleaned region name to match regional information; it may repeat across respondents.
- `Mountain West` and missing or special region values may not match the context file.
- `Territories` exists in the context file but not in the person rows.
- `all.x = TRUE` keeps person observations; `all = FALSE` keeps matched observations; `all = TRUE` keeps observations from both files.
- Many-to-many merges should not be used to bypass duplicate-key problems.

## Grading Guidance

Suggested emphasis:

- 25 percent: scripts run from the repository root using relative paths.
- 25 percent: append and row-count checks are correct.
- 20 percent: duplicate and key diagnostics are clear.
- 20 percent: merge diagnostics identify unmatched cases and row-count changes.
- 10 percent: memo documents decisions and avoids many-to-many shortcuts.

## Common Student Issues

- Treating `respondent_id` as unique after appending years.
- Ignoring duplicate person-year keys.
- Merging on raw region names without cleaning case and spaces.
- Assuming unmatched records are automatically errors.
- Using merges that retain matched observations only by default and silently dropping rows.
- Failing to document context-only records.

## Stata Availability

Some students may not have local Stata access. If Stata access is not available in the course environment, accept a clear note explaining the limitation and grade the R workflow plus conceptual memo. If Stata access is expected, ask students to rerun the do-file from the repository root.

## Instructor Review Notes

Review the handling of the intentional duplicate in the 2024 file. The labs retain the duplicate records in the appended working file, then set aside all records in that unresolved respondent-year group for merge demonstrations. Students must report this restriction. Real research requires source review or a justified resolution rule.

The Stata lab should be run from the repository root:

**Stata:**

```stata
* Stata: Instructor Review Notes.
do modules/07-combining-data/stata_lab.do
```

The R lab uses base R `merge()` with explicit `by` and `all.x`/`all` options. Identifier checks and source-file markers provide merge diagnostics. The Stata lab uses `append`, `merge 1:1`, `merge m:1`, `merge 1:m`, `duplicates`, `isid`, `_merge`, `keepusing()`, and assertions, and should be tested in Stata before release.

## Instructor Check

The R lab can be checked from the repository root:

**R:**

```r
# R: Instructor Check.
source("modules/07-combining-data/r_lab.R")
```

## Duplicate-Record Review

The revised labs set aside every record in an unresolved duplicate respondent-year group. Verify that the memo documents this restriction. A first-record rule is not evidence that conflicting responses were resolved. Raw inputs remain unchanged.
