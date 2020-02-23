rule idr:
    input:
        samples=lambda wildcards: expand("output/genrich/{samples}.genrich.narrowPeak", samples=list(samples.loc[wildcards.condition, 'sample']))
    output:
        "output/idr/{condition}.idr.peaks"
    params:
        extra=""
    conda:
        "../envs/idr.yaml"
    shell:
        "idr --samples {input} --input-file-type narrowPeak --output-file {output} {params.extra}"


