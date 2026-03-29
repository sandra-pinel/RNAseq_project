mkdir -p Output/trimmomatic/paired Output/trimmomatic/unpaired
mkdir -p Output/trimmomatic/paired/fastqc

for SRAid in SRR479052 SRR479054
do
    trimmomatic PE \
        -threads 4 \
        Data/raw_data/${SRAid}.chr21_1.fastq Data/raw_data/${SRAid}.chr21_2.fastq \
        Output/trimmomatic/paired/${SRAid}_1_paired.fastq Output/trimmomatic/unpaired/${SRAid}_1_unpaired.fastq \
        Output/trimmomatic/paired/${SRAid}_2_paired.fastq Output/trimmomatic/unpaired/${SRAid}_2_unpaired.fastq \
        ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
        LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
done


fastqc Output/trimmomatic/paired/*.fastq -o Output/trimmomatic/paired/fastqc
