rule genrich_control:
    input:
        treatment="output/mapped/{sample}.merged.bam",
        control=f"output/mapped/{samples.loc['control', 'sample']}"
    output:
        "output/genrich/{sample}_vscontrol.genrich.narrowPeak"
    params:
        extra=" -j -r "
    conda:
        "../envs/genrich.yaml"
    shell:
        "Genrich -t {input.treatment} -c {input.control} -o {output} {params.extra}"

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




