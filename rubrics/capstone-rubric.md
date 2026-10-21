# Capstone Data Management Portfolio Rubric

This rubric evaluates the final capstone portfolio for the IBS CU Boulder **Quantitative Data Management and Workflow for Social Scientists** microcredential. It is aligned with `syllabus/badge-competencies.md` and the capstone assignment in `assignments/capstone-data-management-portfolio.md`.

## Competency Levels

| Level | Meaning | Badge implication |
| --- | --- | --- |
| Complete / badge-ready | Evidence is complete, reproducible, clearly documented, and appropriate for early graduate social science data work. | Competency is met. |
| Minor revision needed | Evidence is mostly complete, but one or more small issues need clarification, correction, or additional documentation. | Competency can be met after targeted revision. |
| Major revision needed | Evidence is incomplete, inconsistent, not reproducible, or missing important checks or documentation. | Competency is not yet met; substantial revision is required. |
| Not yet demonstrated | Evidence is absent, unrelated, unsafe, or does not address the competency. | Competency is not met. |

A passing capstone grade in Canvas records badge completion after the required module assignment evidence is complete. The instructor then notifies the micro registrar to issue the badge. Students may submit two capstone revisions after the initial submission within the [course completion window](../syllabus/course-policies.md#self-paced-completion-window). A portfolio is badge-ready when all core competency areas are rated **Complete / badge-ready** or, at instructor discretion, when only minor nonblocking issues remain and are documented for future improvement.

## Applying The Rubric To Both Data Options

Option A uses the course-provided synthetic files. Option B uses instructor-approved, publicly distributable student-selected data and an approved [proposal](../assignments/capstone-data-proposal.md). Check sources, versions, redistribution terms, approval, and access to exact inputs before assessing Option B. The same competency thresholds apply to both options.

Module 06 can provide reshaping evidence when reshaping is not part of the capstone. For Option B, Module 07 can provide append and/or merge evidence when the corresponding operation does not apply to the approved project. Review each skill separately, record the evidence location in Canvas, and verify the cited script, diagnostics, and explanation. All Module 00–09 assignments remain required. An omitted operation with missing or inadequate module evidence is **Not yet demonstrated** or requires revision; it is not an exemption from the competency. Applicable operations must be performed and checked in the capstone. Option A still requires append and merge in the capstone itself.

Evaluate identifiers, variables, sample rules, and checks appropriate to the approved data. The synthetic years, variable names, and regional merge do not define the requirements for Option B. A documented finding of no special missing codes or no missing values is acceptable when supported by inspection.

## Capstone Rubric

| Evaluation area | Complete / badge-ready | Minor revision needed | Major revision needed | Not yet demonstrated |
| --- | --- | --- | --- | --- |
| Reproducibility | Script runs from the repository root or documented setup, uses relative paths, creates needed folders, and regenerates outputs without manual steps. | Script mostly runs, but small setup details, folder creation, or rerun instructions need clarification. | Script requires undocumented manual setup, hard-coded local conditions, or does not reliably regenerate key outputs. | No runnable script is submitted, or the workflow cannot be connected to submitted outputs. |
| Project organization | Portfolio files are clearly named, source, working, output, and documentation roles are distinguishable, and generated files are handled according to repository policy. | Organization is mostly clear, but one or two filenames, folder choices, or submission notes are confusing. | Files are scattered, ambiguously named, or generated files are mixed with source files in ways that make review difficult. | Portfolio organization is absent or prevents evaluation. |
| Code clarity | Code is readable, commented where helpful, organized in logical sections, and understandable to a beginner peer or instructor. | Code is mostly understandable but needs clearer section headings, comments, or removal of unused fragments. | Code is difficult to follow, contains unexplained blocks, or mixes exploratory and final workflow code without guidance. | Code is missing or unrelated to the submitted outputs. |
| Data integrity and raw data protection | Workflow uses Option A synthetic data or approved Option B public data, documents sources and versions (and redistribution terms for Option B), preserves inputs, avoids manual edits, and creates working files through code. | Raw data protection is mostly clear, but documentation should state more explicitly how source files were protected. | Workflow risks overwriting source data, uses unclear inputs, or does not distinguish raw and generated files. | Raw data were manually edited, unapproved data were used, or data provenance cannot be determined. |
| Documentation and metadata | Data dictionary or codebook explains key source variables, derived variables, coding decisions, values, and known limitations. | Documentation is usable but missing a few variable descriptions, source notes, or limitation statements. | Documentation is too thin to support reuse or omits major derived variables or coding decisions. | No data dictionary or codebook is submitted. |
| Cleaning and recoding variables | Cleaning and recoding are scripted, source variables are preserved or clearly referenced, derived variables are named transparently, and recodes are checked. | Cleaning is mostly sound, but one or two recode decisions need clearer justification or validation. | Important cleaning decisions are undocumented, source meaning is obscured, or validation is missing for key recodes. | Cleaning and recoding evidence is absent or not connected to the final dataset. |
| Missing data handling | Missingness is assessed and summarized, special missing codes are handled when present, absence of missing values or special codes is documented when applicable, and analytic sample decisions are explicit. | Missing-data handling is mostly clear but needs a stronger summary, table, or explanation of one rule. | Special codes or missing values are handled inconsistently, sample restrictions are unclear, or cases are silently dropped. | Missing-data handling is not demonstrated. |
| Merge/append accuracy | Both append and merge competency are demonstrated with appropriate identifier, duplicate, observation-count, and match diagnostics and documented decisions. Evidence comes from the capstone or, for an inapplicable Option B operation, the approved Module 07 assignment. | The identified capstone/module evidence is mostly complete but needs clearer counts or explanations. | Capstone/module operations lack important diagnostics, or an applicable capstone operation is omitted. | A required append or merge skill has no usable capstone or approved Module 07 evidence. |
| Quality assurance checks | QA report covers required variables, observation counts, ranges/categories, identifiers, duplicates, missingness, sample rules, applicable transformations, warnings, and unresolved issues. It references approved Module 06/07 evidence for operations that do not apply. | QA evidence is mostly complete but should label warnings, fatal checks, or unresolved issues more clearly. | QA evidence is partial, superficial, or does not show results of checks. | QA evidence is missing. |
| Output quality | Analysis-ready data, supporting outputs, codebook, QA report, and log come from the script. The accompanying workflow memo makes the handoff understandable. | Outputs are usable but need minor filename, format, or documentation improvements. | Outputs are incomplete, manually edited, not clearly generated from code, or not analysis-ready for the stated purpose. | Required outputs are missing. |
| Workflow memo | Memo explains data option, source files and versions, pathway, outputs, decisions, sample rules, QA, limitations, and rerun guidance. For Option B it records approval and redistribution terms. Reshape/append/merge evidence locations and reasons for module-based evidence are explicit. | Memo is generally clear but omits one or two important details. | Memo is vague, too short, or does not explain major data decisions or QA evidence. | Workflow memo is missing. |
| Readiness for future quantitative methods coursework | Portfolio shows habits needed for later methods work: reproducible preparation, defensible analytic sample construction, demonstrated merge competency, documented variables, and handoff readiness. | Portfolio is mostly ready but needs minor polish before use in a later methods or research-team context. | Portfolio would be risky to use for later analysis without substantial cleanup, documentation, or validation. | Portfolio does not demonstrate readiness for later quantitative methods work. |

## Badge-Ready Decision Rule

A portfolio is normally badge-ready when:

- the required module assignments and capstone evidence are submitted in Canvas,
- all core competency areas are rated **Complete / badge-ready**,
- or any remaining **Minor revision needed** items are nonblocking and addressed through instructor-approved notes.

A portfolio should not be marked badge-ready if any core competency area is rated **Major revision needed** or **Not yet demonstrated**.

## Pathway-Specific Review

For the Stata pathway, reviewers should expect one complete `.do` file plus Stata-generated evidence such as logs, `.dta` or CSV outputs, exported codebooks, QA reports, and merge diagnostics.

For the R pathway, reviewers should expect one complete `.R` script plus R-generated evidence such as logs or text records, CSV/RDS/Stata-compatible outputs, codebooks, QA reports, and merge diagnostics.

For the dual Stata/R pathway, reviewers should evaluate whether both workflows implement the same major data decisions. The two scripts do not need to be line-by-line identical, but they should use the same source data, document the same cleaning and sample rules, and produce comparable final outputs.

## Common Reasons For Revision

Return a portfolio for revision if:

- the script does not run and the issue is not documented,
- absolute paths make the workflow computer-specific,
- source files were manually edited,
- Option B lacks instructor approval, documented redistribution terms, or access to the exact inputs,
- private, restricted, confidential, identifiable respondent data, student records, or data whose terms prohibit redistribution were used,
- generated outputs cannot be traced to the submitted script,
- missing-data decisions are unclear,
- observations are dropped without sample flags or documentation,
- an applicable capstone operation lacks diagnostics, or required reshape/append/merge evidence is absent from both the portfolio and approved module references,
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

Review reshape evidence in the capstone or Module 06. For an inapplicable Option B append or merge, review the approved Module 07 evidence. The evidence must meet the same competency threshold as capstone evidence; see the [badge competency matrix](../syllabus/badge-competencies.md).
