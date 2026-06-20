# 07 Combining Datasets with Append, Joins, and Merges Lesson

## Why This Skill Matters

Many social science projects use more than one data file. You might have survey responses from two years, a separate file with region-level information, or a lookup table that explains codes. Combining files is powerful, but risky. A bad merge can duplicate rows, drop cases, attach the wrong context, or hide unmatched records.

Safe data combination means checking keys, row counts, duplicates, and unmatched cases before trusting the result.

## Conceptual Overview

### Stacking Rows

Stacking rows means placing one dataset underneath another. This is called `append` in Stata and row binding in R.

Use stacking when files contain the same kind of observations and similar variables.

Example:

```text
2024 person survey rows
+ 2025 person survey rows
= appended person-year survey rows
```

After appending, the unit of observation is one person-year survey response.

### Joining Columns

Joining columns means adding variables from another dataset based on one or more key variables. This is called `merge` in Stata and a join in R.

Use joining when one file contains information that should be attached to another file.

Example:

```text
person survey rows + region-level context
= person survey rows with region median income and unemployment rate
```

## Append Versus Merge/Join

Append answers:

```text
How do I combine rows from compatible files?
```

Merge or join answers:

```text
How do I add columns from one file to matching rows in another file?
```

Do not use merge when you mean append. Do not use append when you need to match records by a key.

## Primary Keys and Foreign Keys

A primary key uniquely identifies rows in a dataset.

Examples:

- In a region context file, `region_clean` should identify one row per region.
- In a clean person-year file, `respondent_id` plus `year` should identify one row per person-year.

A foreign key is a variable in one dataset that refers to a primary key in another dataset.

Example:

- Person-level `region_clean` is a foreign key.
- Region context `region_clean` is the primary key.

## Merge and Join Relationships

### One-to-One

One row in the first file matches one row in the second file.

Example:

```text
person-year file + person-year weight file
```

Key:

```text
respondent_id + year
```

### Many-to-One

Many rows in the first file match one row in the second file.

Example:

```text
many person rows + one region row
```

Key:

```text
region_clean
```

### One-to-Many

One row in the first file matches many rows in the second file.

Example:

```text
one region row + many person rows
```

This is the same relationship viewed from the other side.

### Many-to-Many

Many rows in one file match many rows in another file.

Many-to-many merges are dangerous because they can multiply rows in ways that look successful but are logically wrong. If both datasets have duplicate keys, stop and investigate before joining.

## Checking IDs Before Combining

Before combining, ask:

- What is the unit of observation in each file?
- What key should uniquely identify rows?
- Does that key actually work?
- Are there duplicates?
- Are the key variables cleaned and spelled consistently?

In Stata:

```stata
isid respondent_id year
duplicates report respondent_id year
duplicates list respondent_id year
```

In R:

```r
any(duplicated(data[c("respondent_id", "year")]))
data |> count(respondent_id, year) |> filter(n > 1)
```

## Merge Indicators and Join Diagnostics

Stata creates `_merge` after a merge. It tells you whether each row came from the master file only, the using file only, or matched in both.

In R, joins do not automatically create `_merge`, so you need diagnostics such as:

- `anti_join()` for unmatched records,
- `semi_join()` for matched records,
- `full_join()` to see all records from both sides,
- row-count checks before and after joining.

## Unmatched Records

Unmatched records are not automatically errors. They are questions.

Examples:

- A person row has region `Mountain West`, but the context file has no matching region.
- The context file has `Territories`, but no person rows use it.

You should document unmatched cases and decide whether to clean keys, update the context file, or exclude unmatched records.

## Row-Count Checks

Always track rows before and after combining.

For an append:

```text
rows after append = rows in file A + rows in file B
```

For a many-to-one region join:

```text
rows after join should equal person rows
```

If row counts unexpectedly increase, you may have duplicate keys in the context file. If row counts decrease, you may have used an inner join or kept only matched records.

## Practice Task

Complete the lab for your primary pathway:

- Stata pathway: `stata_lab.do`
- R pathway: `r_lab.R`

Optional dual-pathway practice: complete both labs if your instructor requires it or if you want extra practice moving between research teams that use different software.

The labs append the 2024 and 2025 person files, diagnose duplicate person-year keys, attach region context, demonstrate one-to-one and one-to-many joins, and write a diagnostics report. Review the parallel lab conceptually even if you submit work in only one pathway.

## Common Errors

- Assuming `respondent_id` alone is unique across years.
- Ignoring a duplicate key because the join still ran.
- Joining on uncleaned region names.
- Keeping only matched records without realizing unmatched rows were dropped.
- Using many-to-many joins to make software stop complaining.
- Failing to document why unmatched cases remain.

## Competency Checklist

By the end of this module, you should be able to:

- Choose append or join based on the task.
- Identify primary and foreign keys.
- Check key uniqueness before combining.
- Diagnose duplicate records.
- Identify unmatched records.
- Interpret Stata `_merge` or R join diagnostics.
- Validate row counts after combining files.
- Document data combination decisions.
