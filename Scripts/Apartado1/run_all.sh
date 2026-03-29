#!/bin/bash
set -e  # para parar si algo falla

bash Scripts/Apartado1/fastqc.sh
bash Scripts/Apartado1/fastqscreen.sh
bash Scripts/Apartado1/trimmomatic.sh
bash Scripts/Apartado1/hisat2.sh
bash Scripts/Apartado1/htseq.sh
bash Scripts/Apartado1/multiqc.sh