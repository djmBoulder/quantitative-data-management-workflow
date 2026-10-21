# Code Compatibility And Teaching Conventions

Use this guide when maintaining or preparing the course. The student-facing setup guides and labs describe the software students need. Confirm the selected classroom environment before each offering.

## Software Compatibility

- All 11 R labs have been tested with R 4.4.2. The native `|>` syntax requires R 4.1.0 or later, but package compatibility may impose a higher minimum. Use a supported R release with compatible packages, and run the supplied checks in the actual teaching environment.
- All 11 Stata labs have been tested in Stata/SE 19.5 with `version 17` retained. This requests compatible command behavior; it does not establish that separate Stata 17 or 18 installations were tested. See [Stata version control](https://www.stata.com/manuals/pversion.pdf).
- The tested R package set includes dplyr 1.2.1, tidyr 1.3.2, stringr 1.6.0, readr 2.2.0, readxl 1.6.0, janitor 2.2.1, skimr 2.2.2, haven 2.5.5, and openxlsx 4.2.9. These record a tested environment, not a claim about the newest available versions.
- Run `code/r/check-r-dependencies.R`, `code/r/check-course-files.R`, and the R and Stata lab test scripts before delivery. An execution test does not replace review of the data decisions and outputs.

## Teaching Conventions

| Topic | Convention |
| --- | --- |
| Appending and merging | Use append, merge, identifiers, units of observation, and matched/unmatched cases. R examples use `bind_rows()` and base `merge()`, with explicit identifier checks and retention choices. |
| Recoding and selection | Use visible steps with `if_else()`, `na_if()`, `case_when()`, and `select()` as appropriate. Avoid introducing superseded interfaces as the primary method. |
| Missing values | Keep nonresponse separate from substantive categories. Use variable and observation missingness checks, and document sample restrictions. |
| Reshaping | Explain wide and long formats, the identifier, and the time variable before introducing `reshape`, `pivot_longer()`, or `pivot_wider()`. Check that values survive a round trip. |
| Duplicate observations | The synthetic examples set aside all records in unresolved duplicate respondent-year groups and document that restriction. Row order is not a justification for selecting one conflicting record. This demonstration rule is not a general research recommendation. |
| Merge checks | Check identifier uniqueness, counts, and match status. A matched contextual record can still have missing measurements. |
| Type conversion | Inspect unexpected text rather than forcing a conversion that could conceal a problem. |
| Exported data | Stata CSV exports use numeric codes with `nolabel`; the codebook explains them. Stata `.dta` outputs retain value labels. |
| Code explanations | Use sequential commented steps, name the dataset assumed by short excerpts, and explain the substantive purpose of each transformation. |

References: [dplyr functions](https://dplyr.tidyverse.org/reference/index.html), [R merge](https://stat.ethz.ch/R-manual/R-devel/library/base/html/merge.html), [Stata merge](https://www.stata.com/manuals/dmerge.pdf), [tidyr reshaping](https://tidyr.tidyverse.org/reference/pivot_longer.html).

## Output Checks

Prior validation found matching identifiers and values across the R and Stata Module 09 and capstone outputs, allowing for numeric storage rounding. It also checked reshape round trips, source-file preservation, and rejection of duplicate or missing region identifiers in the R capstone. Recheck these properties after changes to the code or teaching data.

These compatibility notes and the module solution notes are included for faculty review. Use the supplied checks when preparing an offering.
