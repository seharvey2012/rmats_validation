Description of files:

1. rna_seq_splicing_pipelin_up_to_filtering.sh

Hardcoded shell script for differential gene expression and alternative splicing pipeline
for an HTE sample set which contains the following samples:

HTE1 = WT replicate 1
HTE2 = KD replicate 1
HTE3 = WT replicate 2
HTE4 = KD replicate 2

2. MASTER_RMATS_VALIDATION_SCRIPT_CLEANUP

Jupyter notebook where I have applied a variety of cutoffs and filters to try to improve
rMATS false positive rate. Also contains my conclusions.

3. rmats_validation_analysis.xlsx

Excel file where I manually annotated IGV screenshots of sampled splicing events after
different cutoffs to identify which cutoffs yield the lowest false positive rate.
