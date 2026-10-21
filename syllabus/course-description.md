# Course Description

## Course Title

**Quantitative Data Management and Workflow for Social Scientists**

Institute of Behavioral Science, University of Colorado Boulder

## Credential Type

This curriculum is designed primarily as a noncredit graduate microcredential or digital badge. It may also be adapted for a short bootcamp, professional development workshop series, or 1-credit graduate course with additional contact hours, instructor feedback, and formal grading.

## Intended Audience

The primary audience is incoming or early-stage graduate students in sociology, political science, geography, economics, education, communication, public health, environmental studies, and related social science fields. The course assumes limited prior coding experience, but it is also useful for students who have used Stata or R informally and want a more reproducible workflow.

The course is especially appropriate for students preparing to enter required statistics, research design, econometrics, quantitative methods, or applied data analysis sequences.

## Rationale

Graduate social science students often begin quantitative methods training before they have a stable workflow for importing, cleaning, documenting, checking, and handing off data. This creates avoidable problems: data files are edited manually, cleaning decisions are not recorded, missing values are handled inconsistently, merges are not checked, and final analytic files cannot be recreated.

This microcredential addresses those early workflow gaps. It teaches students to treat data wrangling as part of research design and reproducible scholarship rather than as a set of last-minute technical chores. Students practice defensible data management using synthetic survey-style data that contain realistic teaching problems without exposing private, restricted, licensed, confidential, or student data.

## Relationship To Graduate Quantitative Methods Preparation

The course prepares students for graduate-level quantitative methods by giving them a practical foundation in data management before they begin heavier modeling work. By the end of the microcredential, students should be better prepared to:

- receive unfamiliar datasets from instructors, advisors, research teams, or public sources,
- understand the difference between raw, working, output, and analysis-ready data,
- document variable meanings and coding decisions,
- construct transparent analytic samples,
- verify appends, merges, reshaping, and missing-data decisions,
- and produce data files that can support later descriptive or statistical analysis.

The course does not teach statistical modeling. Instead, it teaches the workflow habits that make later statistical modeling more credible.

## Stata/R Parallel Structure

Each module includes parallel Stata and R materials:

- `stata_lab.do` for students working in Stata,
- `r_lab.R` for students working in R,
- and lessons, assignments, and checklists for students.

Students may complete the microcredential through a Stata pathway, an R pathway, or a dual Stata/R pathway. All students should understand both pathways conceptually, but graded work is required only in one primary pathway. The dual pathway is recommended for students who want extra practice or expect to move between research teams using different software.

## Expected Time Commitment

The current module estimates total approximately **36 to 48 hours** of student work in one primary software pathway, depending on prior experience and delivery format. This total includes orientation, Modules 01–09, and the capstone; see the [course schedule](course-schedule.md) for the module-by-module estimates.

Typical time expectations:

- Orientation: 1 to 2 hours.
- Technical modules: 3 to 5 hours each, totaling 29 to 38 hours across Modules 01–09.
- Capstone portfolio: 6 to 8 hours.

Students completing the optional dual Stata/R pathway should expect additional time because they are translating the same workflow across two software environments.

## Course Materials

The repository includes:

- module READMEs,
- student-facing lessons,
- Stata labs,
- R labs,
- assignments,
- competency checklists,
- synthetic teaching data documentation,
- shared resources,
- syllabus and assessment documents,
- and capstone/rubric materials.

All examples use synthetic teaching data from the `synthetic_gss_like` data structure or other publicly distributable materials approved by the instructor.

## Final Capstone Portfolio

The final assessment is a capstone data management portfolio. Students use course-provided synthetic data or instructor-approved publicly distributable data relevant to their own work to produce a transparent, reproducible, analysis-ready dataset with documentation. Student-selected data require the [proposal](../assignments/capstone-data-proposal.md) and approval before capstone work begins. Both options use the same rubric. Module 06 can provide reshape evidence when it is not part of the capstone; for an inapplicable append or merge in an approved student-selected project, Module 07 can provide the corresponding evidence. All module assignments remain required. See the [capstone assignment](../assignments/capstone-data-management-portfolio.md).

The portfolio requires:

- one reproducible Stata do-file or R script for the student's primary pathway, or both scripts for a dual-pathway submission,
- an analysis-ready dataset,
- a data dictionary or codebook,
- a QA checklist or QA report,
- a brief workflow memo,
- and evidence that the student checked appends, merges, missing data, variable coding, and sample restrictions.

The capstone is intended to serve as badge evidence that students can manage social science data responsibly before beginning analysis.

## Noncredit Badge Pathway

Students enroll in the scaffolded Canvas course, submit assignments there, and receive instructor feedback and grades. All Module 00–09 assignments count as required badge evidence, followed by the Module 10 capstone portfolio.

The self-paced completion window begins at registration and ends seven calendar days before CU's semester grade-submission deadline. The instructor posts the actual cutoff in Canvas each semester. Students may submit two capstone revisions after the initial submission within this window. No peer review is required, and the dual Stata/R pathway is optional.

A passing capstone grade in Canvas records badge completion after the required course evidence demonstrates the competencies. The instructor then notifies the micro registrar to issue the badge and submits student grades to the registrar by CU's deadline. See the [course policies](course-policies.md).

## Possible 1-Credit Adaptation

The curriculum can be adapted into a 1-credit graduate course by adding scheduled meetings, instructor feedback, graded participation, and more formal assessment.

Possible additions for a 1-credit version include:

- weekly seminar or lab meetings,
- short reflection or discussion prompts,
- instructor review of selected module assignments,
- a graded capstone rubric,
- and a final portfolio presentation or walkthrough.

For a 1-credit adaptation, IBS and the academic unit should determine credit-specific grading basis, contact-hour expectations, transcript language, and enrollment eligibility. The course follows the [course policies](course-policies.md), including optional dual-pathway work and no required peer review.
