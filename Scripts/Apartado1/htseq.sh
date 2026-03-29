mkdir -p Output/htseq



for SRAid in SRR479052 SRR479054
do
    htseq-count \
        --format=bam \
        --stranded=no \
        --mode=intersection-nonempty \
        --minaqual=10 \
        --type=exon \
        --idattr=gene_id \
        --additional-attr=gene_name \
        Output/hisat2/${SRAid}.sorted.bam \
        Data/annotation/Homo_sapiens.GRCh38.109.chr21.gtf \
    > Output/htseq/${SRAid}.counts
done