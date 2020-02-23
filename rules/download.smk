rule download:
    params:
        command=lambda wildcards: downloads.loc[wildcards.data, 'command']
    output:
        "data/{data, .+.fq.gz}"
    shell:
        "{params.command}"
