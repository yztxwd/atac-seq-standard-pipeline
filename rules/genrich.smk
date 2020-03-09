rule genrich:
    input:
        treatment="output/mapped/{sample}.merged.bam"
    output:
        "output/genrich/{sample}.genrich.narrowPeak"
    params:
        extra=" -j -r "
    conda:
        "../envs/genrich.yaml"
    shell:
        "Genrich -t {input.treatment} -o {output} {params.extra}"




