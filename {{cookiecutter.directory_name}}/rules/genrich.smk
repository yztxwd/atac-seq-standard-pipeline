rule genrich_pe:
    input:
        treatment="output/mapped/{sample}-{rep}.merge.sortName.bam",
    output:
        "output/genrich/{sample}-{rep}.pe.genrich.narrowPeak"
    params:
        extra=config["genrich"]
    resources:
        mem=config["mem"]
    conda:
        "../envs/genrich.yaml"
    shell:
        "Genrich -t {input.treatment} -o {output} {params.extra}"

rule genrich_se:
    input:
        treatment="output/mapped/{sample}-{rep}.merge.sortName.bam",
    output:
        "output/genrich/{sample}-{rep}.se.genrich.narrowPeak"
    params:
        extra=config["genrich"] + " -y"
    resources:
        mem=config["mem"]
    conda:
        "../envs/genrich.yaml"
    shell:
        "Genrich -t {input.treatment} -o {output} {params.extra}"



