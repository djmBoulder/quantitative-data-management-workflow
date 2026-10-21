# Reading The Course Code

The code records research decisions: which observations are included, how variables are coded, how files are combined, and how those decisions are checked. You do not need to write software tools or learn database programming to complete this course.

Run a lab from the top, then revisit one section at a time. A later example may use a dataset or variable created earlier. Comments explain the purpose of each step. The complete labs supply the imports, packages, and output folders that short lesson excerpts may assume.

## R Datasets And Variables

A data frame is a dataset arranged in rows and columns. In this course, a row is an observation and a column is a variable. A name such as `survey_raw` refers to a dataset held in R's memory; it does not refer to a file until you read or save one.

```r
# Read the synthetic survey and keep its original variable names.
survey_raw <- read.csv(
  "data/synthetic/synthetic_gss_like_person_2024.csv", check.names = FALSE
)
# Inspect one variable and then a small set of variables.
summary(survey_raw$age)
head(survey_raw[c("age", "Gender", "region")])
```

| Notation | How to read it |
| --- | --- |
| `<-` | Store the result under this name. |
| `survey_raw$age` | The age variable in the survey dataset. |
| `survey_raw[c("age", "region")]` | Select these two variables. `c()` combines the supplied values or names. |
| `==`, `!=` | Equals, does not equal. |
| `&`, `\|` | And, or, applied to each observation. |
| `%in% c(-9, 999)` | Is the value one of these listed codes? |
| `NA` | Missing value. Use `is.na()` to test for it. |
| `NA_real_`, `NA_character_` | A missing number or missing text value, when a function needs the type specified. |
| `TRUE`, `FALSE` | A condition is met or not met. |
| `package::function()` | Use this named function from this package. |

`janitor::clean_names()` standardizes variable names to lowercase words separated by underscores. It changes names, not data values. The labs then explicitly rename `survey_year` to `year`.

## R Steps For Data Management

The symbol `|>` means “take the result from the previous step and use it here.” It is available in R 4.1.0 and later. The course uses it to arrange operations in the order you read them.

```r
# Create a cleaned age variable while preserving the source age.
survey_clean <- survey_raw |>
  dplyr::mutate(age_clean = dplyr::if_else(age %in% c(-9, 999), NA_real_, age))
```

Here `mutate()` creates or changes variables. `if_else(condition, yes, no)` chooses the value for each observation. Other recurring functions are `filter()` to retain observations, `select()` to retain or rename variables, `count()` to make frequency counts, and `summarise()` to calculate descriptive statistics. `group_by()` applies a subsequent calculation within groups; `ungroup()` ends that grouping.

For several recoding rules, `case_when()` reads from top to bottom. In each line, `~` separates a condition from its assigned value. The first true condition wins.

```r
# Recode age into categories; invalid and missing ages remain missing.
survey_clean <- survey_clean |>
  dplyr::mutate(age_group = dplyr::case_when(
    age_clean >= 18 & age_clean <= 29 ~ "18-29",
    age_clean >= 30 & age_clean <= 44 ~ "30-44",
    age_clean >= 45 & age_clean <= 64 ~ "45-64",
    age_clean >= 65 & age_clean <= 89 ~ "65+",
    TRUE ~ NA_character_
  ))
```

A `factor()` records categorical levels and their labels. Use an ordered factor only when the substantive categories have an order. Nonresponse is not the highest category on a health or agreement scale.

## Stata Notation In The Labs

Stata usually works with one dataset in memory. `generate` creates a variable; `replace` changes its values. `if` restricts a command to observations meeting a condition.

```stata
* Create an age variable without changing the source values.
generate age_clean = age
replace age_clean = . if inlist(age_clean, -9, 999)
```

| Notation or command | Purpose |
| --- | --- |
| `.` and `.a`–`.z` | Numeric missing values. They sort above ordinary numbers; use `!missing(x)` when needed. |
| `""` | Missing string value. |
| `_N` | Number of observations, or number in the current `by` group. |
| `_n` | Observation's position, or position within the current `by` group. |
| `local` | Store a value or path for reuse within the running do-file. Run the setup and its dependent lines together. |
| `///` | Continue the command on the next line. |
| `preserve` / `restore` | Temporarily change the data, then return to the saved state in memory. |
| `capture` | Allow an expected error, such as creating a folder that already exists. Do not use it to hide a failed data check. |

## Checks And Reports

Stata's `assert` and R's `stopifnot()` stop execution when a required condition fails. They help prevent a dataset with an unexpected structure from becoming an analysis input. Frequency tables, duplicate listings, missing-value counts, and merge indicators are equally important: completing a script without an error does not prove that every research decision is correct.

Some lab sections write logs, codebooks, and short reports. Treat these as supplied reporting templates at first; concentrate on whether the recorded decisions and results accurately describe your data. The instructor's test scripts in `code/` contain additional automation that is not a student programming requirement.

If R stops while a `sink()` log is open, run `sink()` to close that log, or restart R before rerunning the lab. Each lab closes its log on normal completion.
