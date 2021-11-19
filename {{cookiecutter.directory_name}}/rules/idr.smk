rule idr:
    input:
        samples=lambda wildcards: expand("output/genrich/{sample}-{rep}.genrich.narrowPeak", **wildcards, rep = ["rep1", "rep2"])
    output:
        "output/idr/{sample}.idr.peaks"
    params:
        extra=""
    conda:
        "../envs/idr.yaml"
    shell:
        "idr --samples {input} --input-file-type narrowPeak --output-file {output} {params.extra}"


