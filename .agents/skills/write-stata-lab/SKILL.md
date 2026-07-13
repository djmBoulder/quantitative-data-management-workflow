# Write Stata Lab Skill

Use this skill when creating or revising a module `stata_lab.do`.

## Goals

- Teach one clear data workflow at a time.
- Keep the Stata lab parallel to the module R lab.
- Use synthetic data only, preferably files in `data/synthetic/`.
- Model reproducible habits: comments, relative paths, logs, and protected raw data.

## Stata Lab Pattern

Include:

- A clear title and purpose comment.
- `version`, `clear all`, and `set more off`.
- Relative paths stored in locals when helpful.
- Folder creation with `capture mkdir` when outputs are needed.
- A log file for substantive labs.
- Import or load commands using course data.
- Inspection or validation commands before saving outputs.
- Comments explaining why each step matters.
- A working or output file only when the module requires it.

## Teaching Expectations

- Explain mistakes students are likely to see, such as wrong working directory, bad paths, string/numeric type surprises, duplicate keys, or unmatched merges.
- Do not manually clean raw files.
- Do not use private, student, restricted, licensed, or confidential data.
- Keep command choices beginner-friendly unless the lesson has introduced the advanced option.

## Parallelism Check

Before finishing, compare with `r_lab.R`:

- Same dataset.
- Same conceptual task.
- Similar outputs.
- Similar checks.
- Similar comments about workflow decisions.
