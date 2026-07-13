# Write R Lab Skill

Use this skill when creating or revising a module `r_lab.R`.

## Goals

- Teach one clear data workflow at a time.
- Keep the R lab parallel to the module Stata lab.
- Use synthetic data only, preferably files in `data/synthetic/`.
- Model reproducible habits: comments, relative paths, scripts, and protected raw data.

## R Lab Pattern

Include:

- A clear title and purpose comment.
- Relative paths with `file.path()` when helpful.
- Folder creation with `dir.create()` when outputs are needed.
- A simple text log or printed output for substantive labs.
- Import or load commands using course data.
- Inspection or validation steps before saving outputs.
- Comments explaining why each step matters.
- A working or output file only when the module requires it.

## Teaching Expectations

- Prefer beginner-friendly base R unless the module explicitly introduces a package.
- If using packages, name why they are used and keep them parallel to Stata concepts.
- Explain common errors, such as wrong working directory, missing files, object name typos, string/numeric type surprises, duplicate keys, or unmatched joins.
- Do not manually clean raw files.
- Do not use private, student, restricted, licensed, or confidential data.

## Parallelism Check

Before finishing, compare with `stata_lab.do`:

- Same dataset.
- Same conceptual task.
- Similar outputs.
- Similar checks.
- Similar comments about workflow decisions.
