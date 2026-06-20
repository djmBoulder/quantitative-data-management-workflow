# 03 Data Documentation, Metadata, and Codebooks Lesson

## Why This Skill Matters

Data are not self-explanatory. A column called `age` is easier to understand than a column called `v3`, but even `age` leaves questions: age at what time, measured in what units, and how are missing values coded?

Documentation is part of reproducible research because it explains what the data contain and what decisions were made. Without documentation, another researcher may not know whether a value is a real answer, a missing code, an error, or a derived category.

Good documentation helps:

- collaborators understand the dataset,
- instructors or advisors review your workflow,
- your future self remember decisions,
- analysts use the correct variables,
- reviewers evaluate whether data preparation was defensible.

## Conceptual Overview

### Metadata

Metadata are data about data. They describe the source, structure, meaning, and limitations of a dataset.

Examples include:

- unit of observation,
- source file,
- variable descriptions,
- coding schemes,
- missing-value codes,
- known limitations,
- date prepared,
- scripts used to prepare the data.

### Data Dictionaries

A data dictionary is usually a table that describes variables. A beginner-friendly data dictionary might include:

- variable name,
- variable label or description,
- source variable,
- type,
- allowed values or coding notes,
- missing-value notes,
- whether the variable is raw or derived.

For this course, the starting reference is:

`data/synthetic/data-dictionary.md`

In the labs, you will export a smaller module-specific data dictionary for the documented working file.

### Codebooks

A codebook is broader than a variable list. It may include the unit of observation, sampling notes, coding schemes, frequencies, missingness, and notes about how variables should be used.

In Stata, `codebook` produces useful summaries of variables. In R, packages such as `skimr` can help produce overview summaries, but a codebook still requires human explanation.

### README Files

A README explains how to understand and use a project or dataset. A good dataset README answers:

- What is the dataset?
- Where did it come from?
- What is the unit of observation?
- Which scripts created the working file?
- Which data dictionary or codebook should users read?
- What are the known limitations?

### Variable Names and Naming Conventions

Variable names should be readable and consistent. In this course, use lowercase snake case:

```text
respondent_id
race_ethnicity
self_rated_health
survey_weight
```

Good names reduce confusion, but they do not replace labels or codebooks.

### Variable Labels

A variable label is a short description attached to a variable.

For example, `self_rated_health` might have the label:

```text
Self-rated general health
```

Variable labels are useful because they travel with the dataset in Stata and can be stored as attributes in R, but they should be brief. Use the data dictionary for longer notes.

### Value Labels

A value label explains what coded values mean.

For example, a derived variable `gender_doc` might use:

```text
1 = Female
2 = Male
3 = Nonbinary
9 = Missing or not reported
```

Value labels are especially useful when a variable is stored as a number but represents categories.

### Notes About Derived Variables

A derived variable is created from one or more existing variables. For example, a lab might create `analytic_sample_demo` from `age` and `gender_doc`.

Every derived variable should document:

- source variables,
- coding rules,
- missing-value decisions,
- why the variable was created.

### Coding Decisions

Documentation should explain decisions, not just results. If you convert `FEMALE`, `female`, and `Female` into one category, write that down. If `-9` means refused or unknown, write that down. If `999` is treated as an invalid age, write that down.

### Inclusion and Exclusion Criteria

An analytic sample is the set of observations included in a particular analysis. Inclusion and exclusion criteria explain who is included and who is left out.

For this module, the labs create a demonstration variable:

`analytic_sample_demo`

It is only a documentation example. Later modules will teach missing data and analytic sample construction in more depth.

### Known Data Limitations

Known limitations are not failures. They are facts users need to know. The synthetic data include intentional teaching issues, including:

- inconsistent capitalization,
- special missing codes,
- numeric-looking values stored as strings,
- duplicate IDs,
- unmatched region keys for later merge practice.

Clear documentation should make these issues visible.

## Stata Documentation Workflow

Stata stores documentation inside `.dta` files through labels and notes.

Useful commands include:

```stata
describe
codebook
label data
label variable
label define
label values
labelbook
notes
order
compress
save
```

Example:

```stata
label data "Documented synthetic_gss_like person file"
label variable age "Respondent age in years"
notes age: Values -9 and 999 are special teaching codes and are not cleaned in this module.
```

For numeric categorical variables, you can define and attach value labels:

```stata
label define gender_doc_lbl 1 "Female" 2 "Male" 3 "Nonbinary" 9 "Missing or not reported"
label values gender_doc gender_doc_lbl
```

## R Documentation Workflow

R does not have one single built-in documentation system like Stata labels. Documentation usually combines:

- clear variable names,
- factor levels,
- attributes such as labels,
- separate data dictionaries,
- README files,
- script comments.

Useful functions and packages include:

```r
names()
dplyr::glimpse()
summary()
dplyr::rename()
dplyr::mutate()
factor()
dplyr::case_when()
haven
skimr::skim()
write.csv()
```

Example:

```r
survey_doc <- survey_raw |>
  dplyr::rename(year = `Survey Year`) |>
  dplyr::mutate(
    gender_doc = dplyr::case_when(
      tolower(trimws(Gender)) == "female" ~ 1,
      tolower(trimws(Gender)) == "male" ~ 2,
      tolower(trimws(Gender)) == "nonbinary" ~ 3,
      TRUE ~ 9
    ),
    gender_doc = factor(
      gender_doc,
      levels = c(1, 2, 3, 9),
      labels = c("Female", "Male", "Nonbinary", "Missing or not reported")
    )
  )
```

You can store short variable labels as attributes, but always pair them with an external data dictionary that another researcher can read outside R.

## Practice Task

Complete the lab for your primary pathway:

- Stata pathway: `stata_lab.do`
- R pathway: `r_lab.R`

Optional dual-pathway practice: complete both labs if your instructor requires it or if you want extra practice moving between research teams that use different software.

The labs import the synthetic survey file, standardize selected names, add labels and notes, create documented derived variables, write a small data dictionary, and save documented working files. Review the parallel lab conceptually even if you submit work in only one pathway.

## Common Errors

- Writing labels that are too vague to help another researcher.
- Forgetting to document the source variable for a derived variable.
- Treating missing codes as cleaned values without explaining the decision.
- Creating value labels in one software environment but not documenting them elsewhere.
- Using a codebook to hide known data limitations.
- Forgetting that a README, data dictionary, and script comments each serve different purposes.

## Competency Checklist

By the end of this module, you should be able to:

- Explain why documentation is part of reproducibility.
- Create variable labels and value labels where appropriate.
- Write notes about source files and coding decisions.
- Document a derived variable.
- Document simple inclusion/exclusion criteria.
- Create a simple data dictionary file.
- Save a documented working copy without changing raw data.
