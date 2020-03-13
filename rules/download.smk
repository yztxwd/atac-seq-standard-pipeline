rule download:
    params:
        ftp=lambda wildcards: downloads.loc[wildcards.accession, 'ftp']
    output:
        sra=temp("data/{accession}.sra"),
        r1=temp("data/{accession}_1.fastq.gz"),
        r2=temp("data/{accession}_2.fastq.gz"),
    conda:
        "../envs/sra-tools.yaml"
    shell:
        """
        curl -L {params.ftp} -o {output.sra}
        fastq-dump --split-3 {output.sra} --outdir data/
        gzip data/{wildcards.accession}_1.fastq
        gzip data/{wildcards.accession}_2.fastq
        """
