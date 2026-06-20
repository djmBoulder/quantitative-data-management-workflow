# synthetic_gss_like Data Dictionary

This dictionary describes the planned clean variable names for the `synthetic_gss_like` teaching files. The raw CSV headers intentionally use inconsistent capitalization, spaces, and punctuation so students can practice cleaning names during import.

## Person-Level Files

Files:

- `synthetic_gss_like_person_2024.csv`
- `synthetic_gss_like_person_2024.xlsx`
- `synthetic_gss_like_person_2025.csv`

Unit of observation: one survey response in one year.

The Excel file is generated from the same synthetic 2024 person-level data as `synthetic_gss_like_person_2024.csv`. It exists so Module 02 can teach Excel import workflows in Stata and R.

Generated Stata `.dta` versions may be created locally in `data/synthetic/stata/` by running `code/stata/create-synthetic-data.do`. Those `.dta` files are regenerated convenience files and are not tracked in Git.

Recommended unique key after cleaning: `respondent_id` plus `year`. The 2024 file intentionally includes a duplicate `respondent_id` so students can practice duplicate checks.

| Clean variable name | Example raw CSV header | Description | Planned type after cleaning | Intentional teaching issues |
| --- | --- | --- | --- | --- |
| `respondent_id` | `Respondent ID` | Synthetic respondent identifier. | Integer | Duplicate ID appears in the 2024 file. IDs may repeat across years, so use `respondent_id` plus `year` for person-year checks. |
| `year` | `Survey Year` | Survey year. | Integer | Stored cleanly, but students should confirm it after import. |
| `age` | `age` | Respondent age in years. | Numeric | Includes special codes such as `-9` and `999`. |
| `gender` | `Gender` | Self-reported gender category. | Categorical string or labeled factor | Includes inconsistent capitalization, blanks, and special missing codes. |
| `race_ethnicity` | `Race / ethnicity` | Broad race and ethnicity category. | Categorical string or labeled factor | Includes inconsistent capitalization and `-8` or `-9` special missing codes. |
| `education` | `education` | Highest education category. | Ordered categorical variable | Includes inconsistent capitalization and numeric-looking special codes such as `99`. |
| `marital_status` | `Marital Status` | Current marital status. | Categorical string or labeled factor | Includes blanks, inconsistent capitalization, and special missing labels. |
| `region` | `region` | Respondent region. | Categorical string | Includes extra spaces, inconsistent capitalization, and region values that do not match the context file until cleaned. |
| `employment_status` | `employment status` | Main employment category. | Categorical string or labeled factor | Includes inconsistent capitalization and special missing codes. |
| `hours_worked` | `hours_worked` | Hours worked in the last week. | Numeric | Includes numeric strings, `N/A`, `forty`, `-8`, and `-9`. |
| `household_income` | `Household Income` | Approximate annual household income. | Numeric after cleaning | Includes dollar signs, commas, blanks, `Not asked`, `-8`, and `999999`. |
| `self_rated_health` | `Self Rated Health` | Self-rated health category. | Ordered categorical variable | Includes inconsistent capitalization, `DK`, and `-9`. |
| `smoking_status` | `smoking_status` | Current smoking status. | Categorical string or labeled factor | Includes inconsistent capitalization and special missing codes. |
| `physical_activity_days` | `Physical Activity Days` | Days of physical activity in the last week. | Numeric integer from 0 to 7 | Includes `eight`, `Not asked`, and `-9`. |
| `survey_weight` | `survey weight` | Synthetic survey weight. | Numeric | Includes blanks, `-9`, and comma decimal strings such as `1,25`. |
| `interview_mode` | `Interview Mode` | Mode of survey interview. | Categorical string | Extra practice variable for cleaning labels and capitalization. |

## Region-Level Context File

File:

- `synthetic_gss_like_region_context.csv`

Unit of observation: one region.

Recommended merge key after cleaning: `region`.

| Clean variable name | Example raw CSV header | Description | Planned type after cleaning | Intentional teaching issues |
| --- | --- | --- | --- | --- |
| `region` | `Region Name` | Region name used for merging. | Categorical string | Some person-level values are lower case, padded with spaces, or unmatched before cleaning. |
| `region_median_income` | `Region Median Income` | Synthetic region-level median income. | Numeric | Includes a dollar sign and comma formatting in the CSV. |
| `region_unemployment_rate` | `Region Unemployment Rate` | Synthetic unemployment rate for the region. | Numeric | Stored as a percentage-style string in the CSV. |
| `urbanicity_index` | `Urbanicity Index` | Synthetic index from 0 to 100. | Numeric | Students should confirm range and type. |
| `census_division` | `Census Division` | Broad contextual division label. | Categorical string | Includes one context-only row not matched by the person-level data. |

## Repeated-Measures Wide File

File:

- `synthetic_gss_like_repeated_measures_wide.csv`

Unit of observation before reshaping: one respondent.

Unit of observation after reshaping long: one respondent-year.

Recommended wide key: `respondent_id`.

Recommended long key: `respondent_id` plus `year`.

This file is dedicated to Module 06 reshaping practice. It is intentionally separate from the person-level append files and region-level merge file used in later modules. The repeated-measures values include special missing codes, but Module 06 focuses on restructuring and validation; missing-data recoding is handled in later modules.

| Variable or stub | Description | Planned type after cleaning | Reshaping role |
| --- | --- | --- | --- |
| `respondent_id` | Synthetic respondent identifier. | Integer | ID variable for reshaping. |
| `gender` | Raw self-reported gender from the 2024 person file. | Categorical string | Time-invariant descriptor retained during reshaping. |
| `region` | Raw respondent region from the 2024 person file. | Categorical string | Time-invariant descriptor retained during reshaping. |
| `health_2022`, `health_2023`, `health_2024` | Synthetic self-rated health codes across years. | Numeric category | Repeated-measure stub for reshape practice. |
| `activity_days_2022`, `activity_days_2023`, `activity_days_2024` | Synthetic physical activity days across years. | Numeric integer | Repeated-measure stub for reshape practice. |
| `hours_worked_2022`, `hours_worked_2023`, `hours_worked_2024` | Synthetic hours worked across years. | Numeric | Repeated-measure stub for reshape practice. |

## Special Missing Codes

The files use several special missing codes for teaching purposes:

- `-8`: not asked or skipped.
- `-9`: refused or unknown.
- `99` or `999`: invalid or out-of-range code for selected variables.
- Blank cells: missing after import.
- Text values such as `DK`, `N/A`, `Not asked`, and `Prefer not to answer`: string missing categories that need decisions before analysis.

Students should not automatically drop these values. They should document how each code is interpreted and whether it becomes missing, a valid category, or a reason for exclusion from an analytic sample.

## Suggested Teaching Sequence

1. Import the CSV files and inspect raw column names.
2. Clean variable names to the recommended names above.
3. Identify storage types and special missing codes.
4. Recode categorical values into consistent labels.
5. Convert numeric-looking strings to numeric values after handling special codes.
6. Check duplicate IDs in the 2024 person-level file.
7. Append the 2024 and 2025 person-level files.
8. Clean region keys and merge the region-level context file.
9. Validate row counts, unmatched keys, missingness, and value ranges.
10. Produce a documented handoff file and basic descriptive summary.
