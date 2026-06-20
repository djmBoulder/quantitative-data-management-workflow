# 09 Reproducible Outputs Checklist

Use this checklist before submitting module 09 work.

## Pathway Use

Complete the required checks for your primary pathway script. Submit both Stata and R scripts only if you are completing the optional dual pathway or your instructor requires both.

## Workflow Setup

- [ ] I ran my script from the repository root.
- [ ] I used relative paths.
- [ ] I created output folders in the script if needed.
- [ ] I did not manually edit raw data.
- [ ] I did not manually edit generated output files.

## Analysis-Ready Dataset

- [ ] I imported the synthetic person-level CSV file.
- [ ] I standardized variable names.
- [ ] I cleaned or derived variables needed for the handoff dataset.
- [ ] I created an analytic sample flag before filtering.
- [ ] I documented any sample restrictions.
- [ ] I checked that the analysis-ready file has the expected rows and variables.
- [ ] I checked that respondent-year keys are not duplicated in the analysis-ready output.

## Exported Outputs

- [ ] I exported a clean analysis-ready dataset.
- [ ] I exported a CSV copy.
- [ ] I exported an additional useful format when appropriate.
- [ ] I created a descriptive table.
- [ ] I created a derived codebook or metadata file.
- [ ] I created a workflow log.
- [ ] I wrote a handoff memo.

## Documentation

- [ ] My memo identifies the source file.
- [ ] My memo identifies the script that created the outputs.
- [ ] My memo lists the generated output files.
- [ ] My memo explains sample construction.
- [ ] My memo documents known limitations.
- [ ] My codebook describes derived variables and coding decisions.

## Reproducibility Check

- [ ] I restarted my software or cleared the session.
- [ ] I reran the full script from the top.
- [ ] The script recreated the expected outputs.
- [ ] I did not rely on objects that were already open in memory.
- [ ] I kept generated files in ignored folders such as `data/output/` and `logs/`.
