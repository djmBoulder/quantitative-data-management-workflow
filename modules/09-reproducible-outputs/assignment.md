# 09 Reproducible Outputs Assignment

## Purpose

The goal of this assignment is to practice creating a reproducible handoff package. A handoff package should help another researcher understand what files were created, what source data were used, what decisions were made, and how to regenerate the outputs.

You will use synthetic data only. Do not use private, student, restricted, licensed, or confidential data.

## Data

Use:

- `data/synthetic/synthetic_gss_like_person_2024.csv`
- `data/synthetic/data-dictionary.md`

Run your script from the repository root so all paths can be relative.

## Tasks

1. Import the synthetic person-level CSV file.
2. Standardize variable names.
3. Create cleaned versions of selected variables needed for a basic handoff dataset.
4. Create an analytic sample flag that identifies rows with valid core variables.
5. Export an analysis-ready dataset.
6. Export a clean CSV copy of the analysis-ready dataset.
7. Export one additional format appropriate to your software, such as Stata `.dta`, RDS, or Excel.
8. Create a simple descriptive table using the analysis-ready dataset.
9. Create a derived codebook or metadata file describing the output variables.
10. Create a workflow log.
11. Write a short handoff memo that explains file provenance, sample construction, generated outputs, and known limitations.
12. Restart your software and rerun the script from the top.

## Expected Files

Submit your completed primary-pathway script file:

- Stata pathway: `modules/09-reproducible-outputs/stata_lab.do`
- R pathway: `modules/09-reproducible-outputs/r_lab.R`
- Dual pathway: both completed scripts.

Submit your written memo or include its text in your assignment response. Your generated output files should be reproducible from your scripts and should normally remain in ignored folders such as `data/output/` and `logs/`.

## Handoff Memo Prompt

Your handoff memo should answer:

- What source file did you use?
- What script created the outputs?
- What analysis-ready dataset did you create?
- What summary table did you create?
- What codebook or metadata file did you create?
- What sample restrictions did you apply?
- What known issues or limitations remain?
- What should a future collaborator do if the outputs need to change?

## Common Mistakes To Check

- Do not manually edit raw data or generated output files.
- Do not save only a dataset without documentation.
- Do not use file names such as `final_final`.
- Do not rely on objects already open in memory.
- Do not commit generated data from `data/output/`, `data/working/`, or `logs/`.

## Submission Checklist

Before submitting, confirm that:

- Your script runs from the repository root.
- Your script imports the synthetic source data.
- Your script creates output folders if needed.
- Your script creates an analysis-ready dataset.
- Your script creates a descriptive table.
- Your script creates a derived codebook or metadata file.
- Your script creates a workflow log.
- Your handoff memo explains provenance and sample restrictions.
- Your generated outputs can be recreated by rerunning your script.
