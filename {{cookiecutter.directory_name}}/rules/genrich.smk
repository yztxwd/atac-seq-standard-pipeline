rule genrich:
    input:
        treatment="output/mapped/{sample}-{rep}.merge.sortName.bam",
    output:
        "output/genrich/{sample}-{rep}.genrich.narrowPeak"
    params:
        extra=config["genrich"]
    conda:
        "../envs/genrich.yaml"
    shell:
        "Genrich -t {input.treatment} -o {output} {params.extra}"




