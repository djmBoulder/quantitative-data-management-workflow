# 10 Capstone Data Management Portfolio Assignment

## Purpose

Create a transparent, reproducible workflow from approved source data to an analysis-ready dataset with documentation. Another researcher should be able to rerun your work and understand its decisions and limitations.

Use the guided labs as examples and write your own workflow memo; do not submit the unchanged example memo as your assessment.

The [full capstone assignment](../../assignments/capstone-data-management-portfolio.md) is the common reference for both data options, minimum workflow requirements, the memo prompt, and submission rules.

## Choose A Data Option

- **Option A: course-provided synthetic data.** Use the two `synthetic_gss_like` person-level files, regional context file, and dictionary in `data/synthetic/`. Append the person-level files and merge regional context, checking identifiers, duplicates, observation counts, and matched/unmatched cases. No proposal is required.
- **Option B: instructor-approved student-selected data.** Use publicly distributable data relevant to your research or methods coursework. Submit the [data proposal](../../assignments/capstone-data-proposal.md) in Canvas and obtain approval before beginning the capstone with those data. Document sources, versions, redistribution terms, project scope, and instructor access to the inputs.

Public access alone does not establish permission to redistribute data. Private, restricted, confidential, identifiable respondent data, student records, and data whose terms prohibit redistribution are not eligible. Keep student-selected data out of the course repositories. See the [data policy](../../syllabus/course-policies.md#capstone-data-options).

## Choose A Software Pathway

Submit one complete Stata do-file or R script in your primary pathway. The dual Stata/R pathway is optional and uses the same approved inputs and major decisions in both languages. Either data option works with either primary pathway.

## Required Workflow And Portfolio

For both options:

1. Import and inspect approved inputs from a documented project root using relative paths, preserving source files.
2. Perform meaningful, justified cleaning and recoding or variable derivation, with checks.
3. Assess missingness, handle special codes when present, and document findings even when no missing values occur.
4. Make analytic sample decisions explicit with a sample flag and observation counts.
5. Check identifiers, duplicates, required variables, valid values, and all applicable transformations.
6. Generate the analysis-ready dataset, codebook, QA report, and log from the script.
7. Write the workflow memo, usually 500–900 words, using the full assignment's prompt.

Submit the script, dataset, codebook, QA evidence, log, and memo in Canvas. For Option B, include the approved proposal, source documentation, and permitted input copies or the instructor-approved instructions for obtaining the exact inputs.

## Evidence For Reshape, Append, And Merge

All three skills remain required for the badge. Module 06 may provide reshaping evidence when it is not part of the capstone. Option A requires append and merge in the capstone itself.

For Option B, perform and check each operation that applies to the approved workflow. When reshaping, appending, or merging does not apply, explain why and cite the corresponding Module 06 or Module 07 assignment. Agree on the plan in the proposal, then identify the exact Canvas submission, filename, and script section in the final memo. The instructor must verify that the cited evidence demonstrates competency. All Module 00–09 assignments remain required.

## Before Submitting

Use the [Module 10 checklist](checklist.md) and the [capstone rubric](../../rubrics/capstone-rubric.md). Confirm that the instructor can rerun your script with the documented inputs, that outputs come from code, and that every required competency has evidence. Keep student-selected source files and generated working/output/log files out of the course repositories.

## Canvas Submission And Completion Policies

A passing capstone grade in Canvas records badge completion after the required module evidence demonstrates competency. The instructor then notifies the micro registrar to issue the badge. Two capstone revisions are allowed after the initial submission, within the course completion window. Complete all work by the Canvas cutoff, seven calendar days before CU's semester grade-submission deadline. Data approval does not extend that cutoff. No peer review is required. See the [course policies](../../syllabus/course-policies.md).
