# Capstone Data Management Portfolio Rubric

This rubric evaluates the final capstone portfolio for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential. It is aligned with `syllabus/badge-competencies.md` and the capstone assignment in `assignments/capstone-data-management-portfolio.md`.

## Competency Levels

| Level | Meaning | Badge implication |
| --- | --- | --- |
| Complete / badge-ready | Evidence is complete, reproducible, clearly documented, and appropriate for early graduate social science data work. | Competency is met. |
| Minor revision needed | Evidence is mostly complete, but one or more small issues need clarification, correction, or additional documentation. | Competency can be met after targeted revision. |
| Major revision needed | Evidence is incomplete, inconsistent, not reproducible, or missing important checks or documentation. | Competency is not yet met; substantial revision is required. |
| Not yet demonstrated | Evidence is absent, unrelated, unsafe, or does not address the competency. | Competency is not met. |

The recommended badge standard is complete/incomplete with revision allowed. A portfolio is badge-ready when all core competency areas are rated **Complete / badge-ready** or, at instructor discretion, when only minor nonblocking issues remain and are documented for future improvement.

## Capstone Rubric

| Evaluation area | Complete / badge-ready | Minor revision needed | Major revision needed | Not yet demonstrated |
| --- | --- | --- | --- | --- |
| Reproducibility | Script runs from the repository root or documented setup, uses relative paths, creates needed folders, and regenerates outputs without manual steps. | Script mostly runs, but small setup details, folder creation, or rerun instructions need clarification. | Script requires undocumented manual setup, hard-coded local conditions, or does not reliably regenerate key outputs. | No runnable script is submitted, or the workflow cannot be connected to submitted outputs. |
| Project organization | Portfolio files are clearly named, source, working, output, and documentation roles are distinguishable, and generated files are handled according to repository policy. | Organization is mostly clear, but one or two filenames, folder choices, or submission notes are confusing. | Files are scattered, ambiguously named, or generated files are mixed with source files in ways that make review difficult. | Portfolio organization is absent or prevents evaluation. |
| Code clarity | Code is readable, commented where helpful, organized in logical sections, and understandable to a beginner peer or instructor. | Code is mostly understandable but needs clearer section headings, comments, or removal of unused fragments. | Code is difficult to follow, contains unexplained blocks, or mixes exploratory and final workflow code without guidance. | Code is missing or unrelated to the submitted outputs. |
| Data integrity and raw data protection | Workflow uses approved synthetic data, preserves raw inputs, avoids manual edits, and creates derived or working files through code. | Raw data protection is mostly clear, but documentation should state more explicitly how source files were protected. | Workflow risks overwriting source data, uses unclear inputs, or does not distinguish raw and generated files. | Raw data were manually edited, unapproved data were used, or data provenance cannot be determined. |
| Documentation and metadata | Data dictionary or codebook explains key source variables, derived variables, coding decisions, values, and known limitations. | Documentation is usable but missing a few variable descriptions, source notes, or limitation statements. | Documentation is too thin to support reuse or omits major derived variables or coding decisions. | No data dictionary or codebook is submitted. |
| Cleaning and recoding variables | Cleaning and recoding are scripted, source variables are preserved or clearly referenced, derived variables are named transparently, and recodes are checked. | Cleaning is mostly sound, but one or two recode decisions need clearer justification or validation. | Important cleaning decisions are undocumented, source meaning is obscured, or validation is missing for key recodes. | Cleaning and recoding evidence is absent or not connected to the final dataset. |
| Missing data handling | Special missing codes are identified, converted or documented appropriately, missingness is summarized, and analytic sample decisions are explicit. | Missing-data handling is mostly clear but needs a stronger summary, table, or explanation of one rule. | Special codes or missing values are handled inconsistently, sample restrictions are unclear, or cases are silently dropped. | Missing-data handling is not demonstrated. |
| Merge/append accuracy | Appends, merges, or joins include key checks, duplicate checks, row-count checks, match/unmatched diagnostics, and documented decisions. | Combining evidence is mostly complete but needs clearer row-count documentation or explanation of unmatched cases. | Append or merge operations are performed without adequate key, duplicate, unmatched-record, or row-count checks. | Combining datasets is not demonstrated when required. |
| Quality assurance checks | QA report or checklist covers required variables, row counts, ranges/categories, duplicates, missingness, merge results, warnings, and unresolved issues. | QA evidence is mostly complete but should label warnings, fatal checks, or unresolved issues more clearly. | QA evidence is partial, superficial, or does not show results of checks. | QA evidence is missing. |
| Output quality | Analysis-ready dataset, summary table or supporting outputs, codebook, QA report, and log/memo are generated by the script and ready for handoff. | Outputs are usable but need minor filename, format, or documentation improvements. | Outputs are incomplete, manually edited, not clearly generated from code, or not analysis-ready for the stated purpose. | Required outputs are missing. |
| Workflow memo | Memo clearly explains source files, pathway, outputs, cleaning decisions, missing-data rules, append/merge checks, sample restrictions, QA results, limitations, and rerun guidance. | Memo is generally clear but omits one or two important details. | Memo is vague, too short, or does not explain major data decisions or QA evidence. | Workflow memo is missing. |
| Readiness for future quantitative methods coursework | Portfolio shows habits needed for later methods work: reproducible preparation, defensible analytic sample construction, checked joins, documented variables, and handoff readiness. | Portfolio is mostly ready but needs minor polish before use in a later methods or research-team context. | Portfolio would be risky to use for later analysis without substantial cleanup, documentation, or validation. | Portfolio does not demonstrate readiness for later quantitative methods work. |

## Badge-Ready Decision Rule

A portfolio is normally badge-ready when:

- the required capstone evidence is submitted,
- all core competency areas are rated **Complete / badge-ready**,
- or any remaining **Minor revision needed** items are nonblocking and addressed through instructor-approved notes.

A portfolio should not be marked badge-ready if any core competency area is rated **Major revision needed** or **Not yet demonstrated**.

## Pathway-Specific Review

For the Stata pathway, reviewers should expect one complete `.do` file plus Stata-generated evidence such as logs, `.dta` or CSV outputs, exported codebooks, QA reports, and merge diagnostics.

For the R pathway, reviewers should expect one complete `.R` script plus R-generated evidence such as logs or text records, CSV/RDS/Stata-compatible outputs, codebooks, QA reports, and join diagnostics.

For the dual Stata/R pathway, reviewers should evaluate whether both workflows implement the same major data decisions. The two scripts do not need to be line-by-line identical, but they should use the same source data, document the same cleaning and sample rules, and produce comparable final outputs.

## Common Reasons For Revision

Return a portfolio for revision if:

- the script does not run and the issue is not documented,
- absolute paths make the workflow computer-specific,
- raw synthetic files were manually edited,
- unapproved real, private, restricted, licensed, confidential, or student data were used,
- generated outputs cannot be traced to the submitted script,
- missing-data decisions are unclear,
- observations are dropped without sample flags or documentation,
- merge or append diagnostics are missing,
- QA checks are absent or only asserted without evidence,
- or the workflow memo is too vague for another researcher to understand.

## Relationship To Badge Competencies

This rubric operationalizes the competency areas in `syllabus/badge-competencies.md`:

- project organization and reproducibility,
- importing and inspecting data,
- documentation and metadata,
- cleaning and recoding variables,
- missing data and analytic sample construction,
- reshaping evidence where required,
- combining datasets,
- quality assurance,
- reproducible outputs,
- workflow memo and capstone portfolio.

Module 06 reshaping evidence may be evaluated through the capstone or through Module 06 assignment evidence, depending on instructor requirements.
