# 07 Combining Datasets with Append and Merge Lesson

## Why This Skill Matters

Social science projects often combine survey waves or attach household, school, neighborhood, or regional information to individual observations. An incorrect merge can duplicate respondents, remove cases, or attach the wrong contextual measures. Checking identifiers and sample sizes is part of preparing defensible analyses.

## When To Append Or Merge

**Append** adds observations. Use it to stack compatible survey files, such as the 2024 and 2025 person files. Check that variables have the same names, types, units, and coding before appending. Afterward, the number of observations should equal the sum of the input counts.

**Merge** adds variables by matching records on specified identifiers. Use it to attach regional income or unemployment information to respondents. The observations retained depend on the options you choose; inspect unmatched cases before excluding them.

Both Stata and base R use the term **merge**. You may encounter R functions such as `dplyr::left_join()` in other materials; those also perform merges. This course uses `merge()` in R so the main terminology and workflow parallel Stata.

## Identifiers And Units Of Observation

First state what one observation represents in each file.

- In a person-year file, `respondent_id` together with `year` should identify one survey response.
- In the region file, the cleaned region name should identify one regional observation.
- Region repeats across many respondents. That is expected; it must be unique in the regional file used to supply context.

The variables used to match records are sometimes called merge keys. Here we call them identifiers or merge variables. Match their spelling, capitalization, types, and meaning in both files. Do not assume that similarly named variables measure the same thing.

## One-To-One, Many-To-One, And One-To-Many Merges

A **1:1 merge** matches one observation in each file, such as two files containing one record per respondent and year. Check uniqueness in both files.

An **m:1 merge** attaches one contextual record to many individual observations. For example, many respondents share one region's unemployment rate. Check that region is unique and nonmissing in the context file.

A **1:m merge** views the same arrangement from the other direction: one region record is matched to several respondents. State the resulting unit of observation before using the result.

Do not use Stata's `merge m:m` to work around duplicate identifiers. It matches repeated observations according to within-group order; it is not equivalent to R's behavior when both files contain repeated identifiers. In R, such a merge can create every possible combination of matching observations. Neither behavior resolves a duplicate-record problem. Stop and investigate the intended unit of observation.

## Core Commands And Functions

- Stata: `append`, `merge 1:1`, `merge m:1`, `merge 1:m`, `isid`, `duplicates report`, `duplicates list`, `tabulate _merge`, and `count`.
- R: `bind_rows()` to append; `merge()` to match files; `duplicated()`, `count()`, `table()`, and `nrow()` to check results.

For R's `merge(x, y, by = ..., ...)`, `x` is the first dataset and `y` is the second:

| R option | Observations retained | Comparable Stata option |
| --- | --- | --- |
| `all.x = TRUE` | All observations from the first file, with matched information from the second | `keep(master match)` |
| `all = TRUE` | Matched and unmatched observations from both files | Default `merge` behavior |
| `all = FALSE` (R's default) | Matched observations only | `keep(match)` |

Always supply `by`. Otherwise R chooses shared variable names, which may include variables you did not intend to use for matching. R may also reorder observations; use identifiers, not row position, to compare records afterward.

## Stata Example

The full lab prepares a person file and a region file. This excerpt uses the temporary files created there. It retains unmatched observations for inspection before keeping the person-level sample.

```stata
* Check that the region file has one record per nonmissing region identifier.
use `region_context', clear
isid region_clean

* Merge regional information onto the prepared person-year observations.
use `appended_unique', clear
count
local before_merge = r(N)
merge m:1 region_clean using `region_context'

* _merge: 1 = person only; 2 = context only; 3 = matched in both files.
tabulate _merge, missing
list region_clean if _merge != 3

* Retain every person observation, including people without a region match.
keep if inlist(_merge, 1, 3)
assert _N == `before_merge'
```

## R Example

This excerpt uses `person_unique` and `region_context` after their preparation in the R lab. `stopifnot()` stops the script when a required check fails. A marker added to the context file identifies a matched record even when its income measure is missing.

```r
# Require one context record per nonmissing region identifier.
stopifnot(!anyNA(region_context$region_clean))
stopifnot(all(region_context$region_clean != ""))
stopifnot(!any(duplicated(region_context$region_clean)))
region_context$context_record_present <- TRUE

# Retain every person observation and explicitly name the merge variable.
before_merge <- nrow(person_unique)
person_region <- merge(
  person_unique, region_context, by = "region_clean", all.x = TRUE
)
stopifnot(nrow(person_region) == before_merge)

# A context record can match even if one of its substantive variables is missing.
person_region$matched_region <- !is.na(person_region$context_record_present)
table(person_region$matched_region)
```

A missing identifier cannot provide a meaningful match. The labs require nonmissing identifiers in the context file. For a 1:1 merge, they require nonmissing respondent-year identifiers in both files as well.

## Duplicate And Unmatched Records

The synthetic person data deliberately contain a repeated respondent-year identifier with conflicting information. The labs report the problem and set aside **all records in that unresolved group** for the merge demonstration. The appended working file retains them for inspection. This is a documented teaching restriction, not a general instruction to discard duplicates in research. Resolve real duplicates using source records or a justified decision rule; choosing whichever record appears first is not sufficient.

Unmatched region values also require inspection. A spelling difference may be repairable; a region outside the context file's coverage may need to remain unmatched. Report the reason and any resulting sample restriction. Do not infer merge success from whether a substantive measure such as income is nonmissing.

## Common Mistakes

- Using respondent ID alone when the observation is respondent plus year.
- Merging before checking the identifiers in both files.
- Keeping matched cases only without recognizing the sample loss.
- Allowing missing identifiers to match one another.
- Selecting the first conflicting duplicate without supporting evidence.
- Assuming equal row counts alone prove that the right records matched.

## Practice Task

Complete `stata_lab.do` or `r_lab.R` for your primary pathway. Append the two survey files, inspect duplicate identifiers, merge regional information, and write a short memo explaining the unit of observation, unmatched cases, and all changes in sample size. Review the parallel lab conceptually even if you submit work in only one pathway.

## Checklist For Competency

- Choose append or merge based on the research task.
- Identify the unit of observation and the required identifiers in each file.
- Check duplicates and missing identifiers before merging.
- Interpret matched, person-only, and context-only records.
- Verify observation counts and explain exclusions.
- Preserve the original inputs and document unresolved issues.
