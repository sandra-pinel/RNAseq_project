

# -------------------------
# FASTQC
# -------------------------

mkdir -p Output/fastqc
fastqc Data/raw_data/*.fastq -o Output/fastqc

# -------------------------
# FASTQSCREEN
# -------------------------

mkdir -p Output/fastqscreen

if [ ! -f Output/fastqscreen/FastQ_Screen_Genomews ]
do 
    fastq_screen --get_genomes --outdir Output/fastqscreen
done


fastq_screen \
--conf Output/fastqscreen/FastQ_Screen_Genomes/fastq_screen.conf \
--outdir Output/fastqscreen \
Data/raw_data/*.fastq