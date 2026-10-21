# 05 Missing Data and Analytic Sample Construction Lesson

Examples below use the variables and the R dataset `survey_missing` created in this module’s lab. Run the lab setup and import/cleaning sections before trying individual examples.

## Why This Skill Matters

Missing data can change the meaning of an analysis. If cases disappear from a table or model without explanation, another researcher cannot tell whether the sample changed because of a deliberate decision or because the software silently removed incomplete records.

Missing-data work is not only technical. It is also a documentation task. You need to explain which values were treated as missing, which cases were included, which cases were excluded, and how the sample size changed.

## Conceptual Overview

### System Missing Values

A system missing value is the software's built-in way to represent missing data.

**Stata:**

```stata
* Stata: System Missing Values.
.
```

Stata's numeric missing values are the system missing value `.` and the extended missing values `.a` through `.z`. Extended values can distinguish documented missing reasons, but they are still missing values. Stata represents a missing string value with the empty string `""`.

**R:**

```r
# R: System Missing Values.
NA
```

R has typed missing values internally, but beginners usually see `NA` as the main missing-data marker.

### Special Missing-Value Codes

Many datasets use numeric or text codes for missing values before the data reach your software. Examples include:

```text
-8 = not asked
-9 = refused or unknown
99 = invalid code
999 = out of range or missing
DK = don't know
N/A = not applicable
Not asked = skipped question
```

These are not automatically missing in every software environment. You must identify and recode them deliberately.

### User-Defined Missing Codes

User-defined missing codes are codes chosen by a dataset creator or researcher to represent missing reasons. For example, one project might use:

- `-8` for not asked,
- `-9` for refused,
- `999` for invalid or out-of-range.

In Stata, extended missing values such as `.a` and `.b` can preserve different reasons. In R, you usually need a separate reason variable, a labelled workflow, or a clearly documented data dictionary.

### Stata Missing Values Versus R `NA`

Stata and R handle missing values differently.

In Stata:

- Numeric missing values are ordered above every nonmissing number. Their order begins with `.`, followed by `.a` through `.z`.
- Extended missing values remain missing even though they are distinct and ordered.
- A condition such as `income > 50000` can therefore include observations whose numeric `income` is missing.
- Use `missing(variable)` and `!missing(variable)` as clear tests for missingness and nonmissingness. These functions also work for string variables, whose missing value is `""`.

In R:

- `NA` represents a missing value.
- Most ordinary comparisons involving `NA` return `NA`, rather than `TRUE` or `FALSE`.
- An expression such as `x == NA` does not test whether `x` is missing.
- Use `is.na(x)` and `!is.na(x)` to test missingness and nonmissingness.

The following parallel examples retain observations above a numeric threshold while explicitly excluding missing values.

**Stata:**

```stata
* Exclude Stata numeric missing values before retaining higher incomes.
keep if household_income_num > 50000 & !missing(household_income_num)
```

**R:**

```r
# Exclude R NA values explicitly while retaining higher incomes.
survey_above_50000 <- survey_missing |>
  dplyr::filter(household_income_num > 50000 & !is.na(household_income_num))
```

> **Tip:** In Stata, numeric missing values have an ordering that can make them satisfy an inequality unless you exclude them. In R, a comparison involving `NA` generally propagates `NA`, so handle missingness explicitly in either workflow.

## Identifying Impossible or Out-of-Range Values

Some values are not missing codes at first glance, but they are impossible or out of range.

In the synthetic data:

- `age` includes `999`, which is not a plausible respondent age.
- `physical_activity_days` can include `eight`, which is not valid for a 0 to 7 day measure.
- `hours_worked` can include `forty`, which is text rather than numeric.

Out-of-range values should be documented and usually recoded before analysis.

## Variable-by-Variable Missingness

Start by checking missingness for each key variable. This answers:

- Which variables have missing values?
- Which variables have special codes?
- Which variables need cleaning before missingness can be assessed?

**Stata:**

```stata
* Stata: Variable-by-Variable Missingness.
misstable summarize
tabulate gender, missing
codebook age
```

**R:**

```r
# R: Variable-by-Variable Missingness.
colSums(is.na(survey_missing))
summary(survey_missing)
table(survey_missing$gender, useNA = "ifany")
```

## Row-Wise Missingness

Variable-level missingness is not enough. You also need to know how many missing values each row has across the variables required for a task.

**Stata:**

```stata
* Stata: Row-Wise Missingness.
egen rowmiss_core = rowmiss(age_clean gender_clean health_ord household_income_num)
```

**R:**

```r
# R: Row-Wise Missingness.
rowmiss_core <- rowSums(is.na(survey_missing[c("age_clean", "gender_clean", "health_ord", "household_income_num")]))
```

Row-wise missingness helps you build complete-case indicators and analytic sample flags.

## Complete-Case Indicators

A complete-case indicator marks whether a row has nonmissing values for a set of required variables.

For example:

```text
complete_case_core = 1 if age, gender, health, income, and survey weight are nonmissing
complete_case_core = 0 otherwise
```

Complete-case indicators should be documented because the chosen variables define the sample.

## Analytic Sample Flags

An analytic sample flag marks whether a row is included in a particular analysis.

An analytic sample is not simply "all complete cases." You may also require:

- age within a valid range,
- nonmissing key variables,
- positive survey weights,
- plausible values for needed measures.

The labs create:

```text
analytic_sample_flag
```

This is a transparent teaching example, not the only possible sample definition.

## Tracking Sample Size Changes

Never report only the final sample size. Track how many rows remain after each decision.

A sample construction table might include:

```text
Step 1: imported rows
Step 2: valid age
Step 3: nonmissing core variables
Step 4: positive survey weight
Step 5: final analytic sample
```

This helps readers see where cases are excluded.

## Avoiding Silent Case Deletion

Silent case deletion happens when software drops incomplete rows during a model, table, or graph without showing the sample change clearly.

To avoid this:

- create explicit sample flags,
- count cases before and after restrictions,
- keep excluded records in the working file,
- document the inclusion and exclusion criteria,
- use R's `filter()` or Stata's `keep if` only after creating and saving a sample flag.

## Practice Task

Complete the lab for your primary pathway:

- Stata pathway: `stata_lab.do`
- R pathway: `r_lab.R`

Optional dual-pathway practice: complete both labs if you choose extra practice moving between research teams that use different software.

The labs recode special missing codes to system missing values, check missingness, create row-wise missing counts, build complete-case and analytic-sample flags, and write sample construction reports. Review the parallel lab conceptually even if you submit work in only one pathway.

## Common Errors

- Using `x == NA` in R instead of `is.na(x)`.
- Forgetting that Stata missing numeric values sort high.
- Recoding special missing codes without documenting the original meaning.
- Dropping rows before creating a sample flag.
- Reporting a final sample size without tracking earlier steps.
- Applying different inclusion rules in Stata and R.

## Competency Checklist

By the end of this module, you should be able to:

- Identify system missing values and special missing codes.
- Recode special missing codes to system missing values.
- Check missingness by variable and by row.
- Create complete-case indicators.
- Create analytic sample flags.
- Track sample size changes across decisions.
- Document inclusion and exclusion criteria.
