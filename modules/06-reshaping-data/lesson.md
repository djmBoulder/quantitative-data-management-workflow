# 06 Reshaping and Restructuring Data Lesson

## Why This Skill Matters

Data shape affects what you can easily describe, graph, merge, and analyze. The same information can be stored in different shapes, and neither shape is automatically better. The right shape depends on the task.

Reshaping is especially important for repeated measures, panel-style data, and person-year data. In those settings, the same person, place, organization, or country may appear in multiple time periods.

In this module, reshaping is the main skill. The synthetic repeated-measures file includes values such as `-8` and `-9`, but the labs do not fully clean those values. They carry the values through the reshape so you can focus on structure first. Later modules handle missing-data recoding, QA, and handoff documentation in more depth.

## Conceptual Overview

### Wide Data

In wide data, repeated measurements are stored in separate columns.

Example:

```text
respondent_id  health_2022  health_2023  health_2024
10001          4            3            5
```

Wide format is useful when:

- each row should show one case,
- you want to compare years side by side,
- you are creating a report or handoff file for inspection,
- repeated values are naturally read as columns.

### Long Data

In long data, repeated measurements are stacked into rows.

Example:

```text
respondent_id  year  health
10001          2022  4
10001          2023  3
10001          2024  5
```

Long format is useful when:

- the unit of observation is a case-time combination,
- you are working with repeated measures,
- you need person-year or panel-style data,
- you want to group, summarize, graph, or model values over time.

### Person-Year Data

Person-year data have one row per person per year. If 120 respondents are measured in 3 years, the long file should have:

```text
120 respondents * 3 years = 360 rows
```

The key should be:

```text
respondent_id + year
```

### Variable Stubs

A variable stub is the part of a repeated variable name that stays the same across time.

In this module:

```text
health_2022, health_2023, health_2024
```

have the stub:

```text
health
```

The suffixes `2022`, `2023`, and `2024` become the time variable after reshaping.

### ID Variables and Time Variables

An ID variable identifies the case. Here, the ID variable is:

```text
respondent_id
```

A time variable identifies the repeated occasion. Here, the time variable is:

```text
year
```

After reshaping long, `respondent_id` alone is no longer unique. The combination of `respondent_id` and `year` should be unique.

## Checking Before Reshaping

Before reshaping, check:

- row count,
- column names,
- duplicate respondent IDs,
- whether the ID variable is unique,
- whether repeated columns follow a consistent naming pattern.

If the ID variable is not unique in the wide file, reshaping may fail or create confusing results.

## Checking After Reshaping

After reshaping from wide to long, check:

- row count,
- unique key,
- number of years per respondent,
- whether repeated measures landed in the correct columns.

For this module:

```text
wide rows = 120
years = 3
expected long rows = 360
```

After reshaping back to wide, check that the row count returns to 120.

These checks become part of your capstone habits. If you ever restructure data for a final portfolio, your memo should explain the unit of observation before and after reshaping and show evidence that the key and row counts still make sense.

## Stata Workflow

Stata uses `reshape long` and `reshape wide`.

A one-variable preview can help you see the basic idea before reshaping multiple stubs. The full lab reshapes `health`, `activity_days`, and `hours_worked` together.

Wide to long:

```stata
reshape long health_ activity_days_ hours_worked_, i(respondent_id) j(year)
```

After this command, the year suffix becomes the `year` variable. The lab then renames the reshaped variables to remove the trailing underscore.

Long to wide:

```stata
reshape wide health activity_days hours_worked, i(respondent_id gender region) j(year)
```

Use checks such as:

```stata
isid respondent_id
duplicates report respondent_id
isid respondent_id year
bysort respondent_id: assert _N == 3
```

## R Workflow

R uses `pivot_longer()` and `pivot_wider()` from `tidyr`.

The R lab first shows a one-measure preview with `names_to` and `values_to`, then uses the `.value` pattern to reshape multiple repeated-measure stubs at once.

Wide to long:

```r
long_data <- wide_data |>
  tidyr::pivot_longer(
    cols = matches("^(health|activity_days|hours_worked)_\\d{4}$"),
    names_to = c(".value", "year"),
    names_pattern = "(health|activity_days|hours_worked)_(\\d{4})"
  )
```

Long to wide:

```r
wide_again <- long_data |>
  tidyr::pivot_wider(
    id_cols = c(respondent_id, gender, region),
    names_from = year,
    values_from = c(health, activity_days, hours_worked)
  )
```

Use checks such as:

```r
stopifnot(!any(duplicated(wide_data$respondent_id)))
stopifnot(nrow(long_data) == nrow(wide_data) * 3)
stopifnot(nrow(dplyr::distinct(long_data, respondent_id, year)) == nrow(long_data))
```

## Practice Task

Complete the lab for your primary pathway:

- Stata pathway: `stata_lab.do`
- R pathway: `r_lab.R`

Optional dual-pathway practice: complete both labs if your instructor requires it or if you want extra practice moving between research teams that use different software.

The labs reshape the synthetic repeated-measures file from wide to long and back to wide, then write validation reports. Review the parallel lab conceptually even if you submit work in only one pathway.

## Common Errors

- Reshaping before checking duplicate IDs.
- Forgetting that `respondent_id` alone is not unique after reshaping long.
- Confusing variable stubs with time suffixes.
- Losing time-invariant variables such as gender and region.
- Forgetting to validate row counts.
- Assuming the reshaped result is correct because the command ran.
- Recoding missing values and reshaping in the same step without explaining both decisions.
- Forgetting that the capstone reviewer needs evidence of row-count and key checks, not just a saved output file.

## Competency Checklist

By the end of this module, you should be able to:

- Identify wide and long data.
- Explain the unit of observation before and after reshaping.
- Identify ID variables, time variables, and variable stubs.
- Reshape wide data to long data.
- Reshape long data back to wide data.
- Validate row counts and unique keys.
- Document restructuring decisions.
- Explain how reshaping evidence could appear in a capstone QA report or workflow memo.
