# 08 Quality Assurance and Validation Checks Lesson

## Why This Skill Matters

Quality assurance, or QA, is how you catch data problems before they become analysis problems. QA is not a final decoration after cleaning. It should happen throughout the workflow: after import, after recoding, after reshaping, after merging, and before producing final outputs.

QA helps answer:

- Did the number of rows change when expected?
- Did the number of variables change when expected?
- Are key variables present?
- Do IDs uniquely identify observations?
- Are values inside plausible ranges?
- Are categories valid?
- Did a merge attach the expected records?
- Are unresolved issues documented?

## Fatal Errors Versus Warnings

Not every QA issue should stop the script.

A fatal error means the workflow should stop because the file is not what the script expects. Examples:

- the required input file is missing,
- a required variable is missing,
- row count changed during a step that should not change rows,
- a supposed primary key is not unique in a cleaned lookup table.

A warning means the script can continue, but the issue must be reported. Examples:

- raw data include duplicate IDs that students need to diagnose,
- raw categories have inconsistent capitalization,
- special missing codes are present,
- region keys do not all match a context file.

Good QA scripts use assertions for fatal expectations and reports for warning-level issues.

## Row-Count Checks

Row-count checks confirm whether the number of observations changed.

Examples:

- Importing a file should produce the expected number of rows.
- A left join should usually keep the same number of rows as the main file.
- An inner join may reduce rows, so that reduction should be documented.

In Stata:

```stata
count
```

In R:

```r
nrow(data)
```

## Variable-Count and Name Checks

Variable-count checks confirm the expected number of columns. Name checks confirm that required variables are present.

In Stata:

```stata
describe
confirm variable respondent_id
```

In R:

```r
ncol(data)
names(data)
stopifnot("respondent_id" %in% names(data))
```

## Range Checks

Range checks confirm that numeric values fall within plausible limits.

Examples:

- valid age should be between 18 and 89 in this synthetic adult survey,
- physical activity days should be between 0 and 7,
- survey weights should be positive.

Raw data may fail these checks because of special missing codes. That is a warning to document before cleaning.

## Valid Category Checks

Category checks confirm that values belong to an expected set.

For example, raw `gender` includes values such as:

```text
Female, female, FEMALE, Male, male, MALE, Nonbinary, -9, Prefer not to answer
```

The inconsistent capitalization is an intentional teaching issue. QA should reveal it.

## Logical Consistency Checks

Logical consistency checks compare variables that should make sense together.

Examples:

- a respondent coded as not employed should usually not have very high reported hours worked,
- a region key should match the region context file after cleaning,
- a person-year key should uniquely identify rows in a person-year file.

Some logical checks are warnings because the data may need interpretation before correction.

## Duplicate ID Checks

Duplicate checks are essential before merges, joins, or appends.

In this course data, the 2024 person file intentionally contains a duplicate `respondent_id`. That issue should be reported and investigated. It should not be ignored.

In Stata:

```stata
duplicates report respondent_id
isid respondent_id
```

In R:

```r
any(duplicated(data$respondent_id))
data |> count(respondent_id) |> filter(n > 1)
```

## Missingness Checks

Missingness checks should include both system missing values and special missing codes.

In Stata:

```stata
misstable summarize
tabulate gender, missing
```

In R:

```r
anyNA(data)
colSums(is.na(data))
```

If raw CSV blanks import as empty strings rather than `NA`, QA should report that too.

## Merge Validation

After a merge or join, check:

- whether row counts changed,
- how many records matched,
- how many main-file records did not match,
- how many context-only records exist,
- whether duplicate keys caused row multiplication.

Stata uses `_merge`. R uses tools such as `anti_join()`, `semi_join()`, and row-count comparisons.

## Checking Before and After Transformations

A QA mindset asks students to check both before and after transformations:

- Before cleaning: What problems exist in the raw data?
- After cleaning: Did the cleaning produce valid values?
- Before merging: Are keys unique where they should be?
- After merging: Did the expected records match?

The lab focuses on QA reports, not on fully fixing the data.

## Practice Task

Complete the lab for your primary pathway:

- Stata pathway: `stata_lab.do`
- R pathway: `r_lab.R`

Optional dual-pathway practice: complete both labs if your instructor requires it or if you want extra practice moving between research teams that use different software.

The labs import the person-level and region context files, run fatal structural checks, report warning-level data issues, validate a merge, and write a QA report. Review the parallel lab conceptually even if you submit work in only one pathway.

## Common Errors

- Writing `assert` or `stopifnot()` for a raw-data issue that is expected to fail.
- Letting warnings scroll by without saving them in a report.
- Treating no error message as proof that the data are correct.
- Checking merged data without checking key uniqueness first.
- Reporting a problem without saying whether it is fatal or unresolved.

## Competency Checklist

By the end of this module, you should be able to:

- Create row-count and variable-count checks.
- Confirm required variables exist.
- Check ranges, categories, duplicates, and missingness.
- Validate merge results.
- Use assertions carefully.
- Write a QA report.
- Classify issues as fatal errors, warnings, or unresolved concerns.
