mkdir -p Output/multiqc

multiqc \
    Output/fastqc \
    Output/fastqscreen \
    Output/trimmomatic \
    Output/hisat2 \
    Output/htseq \
    -o Output/multiqc