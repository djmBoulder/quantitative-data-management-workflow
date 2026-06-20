# 04 Cleaning, Typing, Labeling, and Recoding Variables Lesson

## Why This Skill Matters

Cleaning and recoding are central data management tasks because raw data rarely arrive ready for analysis. Survey data often include inconsistent capitalization, extra spaces, special missing codes, numeric values stored as text, and categories that need to be grouped for analysis.

Cleaning is not just "fixing" data. It is making transparent, documented decisions so another researcher can understand what changed and why.

Good cleaning workflows:

- preserve original variables,
- create clearly named derived variables,
- document coding decisions,
- check results after each major step,
- keep Stata and R workflows substantively parallel.

## Conceptual Overview

### Numeric Versus String Variables

A numeric variable stores numbers that software can use for arithmetic. Age, income, hours worked, and survey weights are often numeric.

A string variable stores text. Gender, region, education, and employment status often begin as strings.

Sometimes imported data look numeric but are actually strings. For example:

```text
"$176,000"
"Not asked"
"1,25"
"forty"
```

These values require cleaning before they can become numeric variables.

### Common Import Problems

The synthetic `synthetic_gss_like` data include several common problems:

- inconsistent capitalization such as `Female`, `female`, and `FEMALE`,
- extra whitespace such as ` SOUTH `,
- special missing codes such as `-8`, `-9`, `99`, and `999`,
- numeric-looking strings such as `hours_worked`,
- income values with dollar signs and commas,
- text values such as `N/A`, `Not asked`, `DK`, and `forty`.

The goal is not to hide these problems. The goal is to make decisions visible in code.

## Preserve Source Variables

Do not overwrite raw variables when cleaning. Instead, create new variables with transparent names.

For example:

```text
gender              raw source variable
gender_clean        cleaned derived variable
age                 raw source variable
age_clean           cleaned numeric age
age_group           derived age category
```

This makes it possible to compare the raw and cleaned versions and explain what changed.

## Standardizing Capitalization and Whitespace

Many categorical variables need string standardization before recoding.

In Stata, use:

```stata
gen gender_text = lower(trim(gender))
```

In R, use:

```r
gender_text <- stringr::str_to_lower(stringr::str_trim(gender))
```

Standardization makes values easier to compare, but it is still a decision. If you collapse `Female`, `female`, and `FEMALE`, document that choice.

## Converting Variable Types

Type conversion means changing how software stores a variable.

Common examples:

- string to numeric: `"42"` becomes `42`,
- numeric to string: `10001` becomes `"10001"`,
- string to categorical code: `"West"` becomes a labeled category,
- numeric code to label: `1` becomes `"Female"`.

In Stata, type conversion tools include:

```stata
destring
encode
decode
tostring
```

In R, common tools include:

```r
as.numeric()
as.character()
factor()
```

Type conversion should happen only after you understand special codes and nonnumeric text.

## Binary, Ordinal, and Categorical Variables

A binary variable has two meaningful categories, such as employed or not employed.

An ordinal variable has ordered categories, such as poor, fair, good, very good, excellent.

A categorical variable has groups that do not necessarily have a natural order, such as region.

Different variable types need different documentation:

- Binary variables need clear definitions of 0 and 1.
- Ordinal variables need ordered levels.
- Categorical variables need clear labels for each group.

## Recoding Continuous Variables into Categories

Sometimes a continuous or numeric variable is recoded into categories. For example, age can become:

```text
18-29
30-44
45-64
65+
```

This can make descriptive tables easier to read, but it also loses detail. Always document the cut points.

## Value Labels and Factor Levels

Stata uses value labels to attach text to numeric codes:

```stata
label define age_group_lbl 1 "18-29" 2 "30-44" 3 "45-64" 4 "65+"
label values age_group age_group_lbl
```

R often uses factors:

```r
age_group <- factor(age_group,
                    levels = c(1, 2, 3, 4),
                    labels = c("18-29", "30-44", "45-64", "65+"))
```

Labels and levels help make tables readable, but they do not replace written documentation.

## Transparent Naming Conventions

Derived variable names should signal what happened:

- `_clean` for cleaned versions of source variables,
- `_num` for numeric conversions,
- `_group` for grouped categories,
- `_flag` for binary indicators.

Examples:

```text
hours_worked_num
household_income_num
gender_clean
age_group
employed_flag
```

## Documenting Recode Decisions

Every recode should be documented with comments and, when appropriate, a decision log.

Good documentation explains:

- source variable,
- new variable,
- cleaning rule,
- missing-value rule,
- category labels,
- validation check.

For example:

```text
Source: age
New variable: age_clean
Rule: set -9 and 999 to missing; keep ages 18-89
Validation: assert nonmissing age_clean is between 18 and 89
```

## Stata Workflow

The Stata lab uses:

```stata
generate
replace
egen
recode
destring
encode
decode
tostring
lower()
upper()
trim()
label variable
label define
label values
tabulate
assert
```

The lab creates cleaned variables while preserving source variables.

## R Workflow

The R lab uses:

```r
mutate()
case_when()
if_else()
as.numeric()
as.character()
factor()
recode()
str_trim()
str_to_lower()
str_to_upper()
count()
janitor::tabyl()
stopifnot()
```

The R lab creates parallel cleaned variables and saves a decision log.

## Practice Task

Complete the lab for your primary pathway:

- Stata pathway: `stata_lab.do`
- R pathway: `r_lab.R`

Optional dual-pathway practice: complete both labs if your instructor requires it or if you want extra practice moving between research teams that use different software.

The labs import the synthetic survey file, create cleaned variables, apply labels or factor levels, validate recodes, and save cleaned working copies. Review the parallel lab conceptually even if you submit work in only one pathway.

## Common Errors

- Recoding into the original source variable.
- Forgetting that empty strings, `-8`, `-9`, `999`, and `DK` may need special handling.
- Using `as.numeric()` or `destring` before removing symbols such as `$` and `,`.
- Creating categories without checking all source values.
- Forgetting to compare raw and cleaned versions.
- Running validation checks only after saving the final file.

## Competency Checklist

By the end of this module, you should be able to:

- Preserve raw variables while creating derived variables.
- Clean strings by trimming spaces and standardizing capitalization.
- Convert numeric-looking strings into numeric variables.
- Create binary, ordinal, and categorical variables.
- Apply value labels or factor levels.
- Recode a continuous variable into categories.
- Document and validate recode decisions.
