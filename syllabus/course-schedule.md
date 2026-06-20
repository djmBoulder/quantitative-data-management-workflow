# Course Schedule

This schedule maps Modules 00-10 into a coherent sequence for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential. The sequence is designed primarily for a noncredit digital badge, but it can be adapted for a weekly seminar/lab, short bootcamp, or 1-credit graduate course.

## Module Sequence

| Module | Title | Main Focus | Typical Student Output |
| --- | --- | --- | --- |
| 00 | Orientation | Repository navigation, synthetic data, pathway selection, data safety, and capstone overview. | Setup check, repository tour note, pathway reflection, orientation checklist. |
| 01 | Project workflows and reproducibility | Folder structure, raw/working/output data, relative paths, scripts, logs, READMEs, and reproducible workflow habits. | Primary-pathway lab script, log evidence, working data copy, README draft, reflection. |
| 02 | Importing and inspecting data | CSV, Excel, Stata, and plain-text file concepts; import workflows; variable inspection; naming conventions. | Primary-pathway import lab, import inspection memo, name-change notes. |
| 03 | Data documentation, metadata, and codebooks | Data dictionaries, codebooks, labels, notes, derived-variable documentation, and known limitations. | Primary-pathway documentation lab, exported data dictionary, documentation memo. |
| 04 | Cleaning, typing, labeling, and recoding variables | Variable types, string cleaning, preserving source variables, derived variables, recodes, labels, and factor levels. | Primary-pathway cleaning lab, cleaning decision log, recode memo. |
| 05 | Missing data and analytic sample construction | Special missing codes, system missing values, missingness checks, row-wise missingness, sample flags, and sample-size tracking. | Primary-pathway missing-data lab, missing summary, sample construction table, analytic sample memo. |
| 06 | Reshaping and restructuring data | Wide and long formats, repeated measures, person-year data, stubs, IDs, time variables, and reshape validation. | Primary-pathway reshaping lab, long file, wide-again file, validation report, restructuring memo. |
| 07 | Combining datasets with append, joins, and merges | Append versus join, keys, duplicates, unmatched cases, merge diagnostics, and row-count checks. | Primary-pathway combining lab, appended file, merged file, diagnostics report, combination memo. |
| 08 | Quality assurance and validation checks | Required variables, row and variable counts, range checks, category checks, duplicate checks, missingness checks, merge validation, warnings, and fatal errors. | Primary-pathway QA lab, QA report, QA memo. |
| 09 | Reproducible outputs and handoff files | Analysis-ready datasets, clean exports, summary tables, codebooks, logs, handoff memos, and file provenance. | Primary-pathway output lab, analysis-ready output, summary table, codebook, log, handoff memo. |
| 10 | Capstone data management portfolio | Integration of course skills into one transparent workflow from raw synthetic inputs to analysis-ready data and documentation. | Capstone portfolio with script, analysis-ready dataset, codebook, QA evidence, workflow memo, and checks. |

## Format A: 10-Module Self-Paced Or Weekly Format

This format is recommended for the noncredit microcredential or digital badge. It can be delivered asynchronously, as a weekly seminar/lab series, or as a hybrid model with short synchronous support sessions.

| Week or Unit | Module | Suggested Focus | Estimated Student Time |
| --- | --- | --- | --- |
| 0 | 00 Orientation | Repository setup, pathway selection, synthetic data, and course expectations. | 1 to 2 hours |
| 1 | 01 Project workflows and reproducibility | Workflow structure, logs, raw/working/output data, and protected source files. | 3 to 4 hours |
| 2 | 02 Importing and inspecting data | Import CSV and Excel files, inspect variable names and types, save working copies. | 2 to 3 hours |
| 3 | 03 Data documentation | Labels, notes, codebooks, data dictionaries, and documentation memos. | 2 to 3 hours |
| 4 | 04 Cleaning and recoding | Type conversion, string cleaning, derived variables, labels, and recode checks. | 3 to 4 hours |
| 5 | 05 Missing data | Special codes, missingness summaries, complete-case flags, and analytic samples. | 3 to 4 hours |
| 6 | 06 Reshaping data | Wide/long structures, repeated measures, person-year data, and validation. | 2 to 3 hours |
| 7 | 07 Combining data | Append, merge/join, keys, duplicates, unmatched cases, and diagnostics. | 3 to 4 hours |
| 8 | 08 Quality assurance | Row counts, ranges, categories, duplicates, missingness, merge validation, and QA reports. | 2 to 3 hours |
| 9 | 09 Reproducible outputs | Analysis-ready data, summary tables, codebooks, logs, and handoff memos. | 2 to 3 hours |
| 10 | 10 Capstone portfolio | Complete final workflow and submit badge evidence. | 6 to 8 hours |

Recommended pacing notes:

- Modules 01-05 build core workflow and cleaning habits.
- Modules 06-08 introduce higher-risk transformations and validation.
- Module 09 prepares students to package outputs for another researcher.
- Module 10 should include time for revision after instructor feedback.

## Format B: Compressed Bootcamp Format

This format is appropriate for a short pre-semester or intersession bootcamp. It assumes focused work time, instructor support, and reduced time between assignments.

### Four-Day Bootcamp

| Day | Modules | Focus | Suggested Structure |
| --- | --- | --- | --- |
| Day 1 | 00, 01, 02 | Orientation, reproducible project structure, importing, and inspection. | Morning orientation and setup; afternoon import lab and troubleshooting. |
| Day 2 | 03, 04, 05 | Documentation, cleaning, recoding, missing data, and sample flags. | Morning documentation and cleaning; afternoon missing-data workflow. |
| Day 3 | 06, 07, 08 | Reshaping, combining files, and QA validation. | Morning reshaping and append/merge work; afternoon QA report development. |
| Day 4 | 09, 10 | Reproducible outputs, handoff files, capstone build time, and portfolio review. | Morning output packaging; afternoon capstone work session and submission guidance. |

### Two-Day Intensive Bootcamp

| Day | Modules | Focus | Suggested Structure |
| --- | --- | --- | --- |
| Day 1 | 00-05 | Setup, reproducible workflows, importing, documentation, cleaning, and missing data. | Instructor-led walkthroughs with shortened practice tasks. |
| Day 2 | 06-10 | Reshaping, combining, QA, outputs, and capstone portfolio. | Lab-heavy format with capstone started in class and completed after bootcamp. |

For a two-day intensive, instructors should consider requiring capstone submission after the bootcamp rather than by the end of the second day.

## Possible 1-Credit Graduate Course Adaptation

A 1-credit version could use the 10-module sequence over 10 to 15 weeks. Recommended additions include:

- weekly attendance or participation expectations,
- short synchronous lab meetings,
- instructor feedback on selected module assignments,
- peer review of workflow memos or QA reports,
- a graded capstone rubric,
- and a final capstone walkthrough or short presentation.

The 1-credit version should preserve the same pathway policy unless the offering explicitly requires both Stata and R. Students may complete the course through the Stata pathway, R pathway, or dual Stata/R pathway, with one primary pathway sufficient unless otherwise stated.

## Delivery Notes For Instructors

- Use only synthetic or publicly distributable teaching data.
- Keep student-facing files separate from instructor-facing `solution_notes.md`.
- Do not ask students to commit generated files from `data/working/`, `data/output/`, or `logs/` unless repository policy changes.
- Consider using an LMS or secure submission mechanism for generated outputs if students need to upload datasets or logs for review.
- Build in time for troubleshooting file paths, package installation, Stata availability, and GitHub basics.
