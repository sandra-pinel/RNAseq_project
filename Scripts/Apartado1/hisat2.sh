
mkdir -p Output/hisat2

# Genome reference indexing
hisat2-build --seed 123 -p 2 \
    Data/REFERENCE/Homo_sapiens.GRCh38.dna.chromosome.21.fa \
    Data/REFERENCE/chr21_hisat2_index


# Alignment + Samtools: SAM → BAM → sort → index

for SRAid in SRR479052 SRR479054
do
    hisat2 --new-summary \
        --summary-file Output/hisat2/${SRAid}.hisat2.summary \
        --seed 123 \
        --phred33 \
        -p 2 -k 1 \
        -x Data/REFERENCE/chr21_hisat2_index \
        -1 Output/trimmomatic/paired/${SRAid}_1_paired.fastq \
        -2 Output/trimmomatic/paired/${SRAid}_2_paired.fastq \
        -S Output/hisat2/${SRAid}.sam

    samtools view -b \
        Output/hisat2/${SRAid}.sam \
        > Output/hisat2/${SRAid}.bam

    samtools sort \
        Output/hisat2/${SRAid}.bam \
        -o Output/hisat2/${SRAid}.sorted.bam

    samtools index \
        Output/hisat2/${SRAid}.sorted.bam

done


