rule download:
    input:
        command=lambda wildcards: downloads.loc[wildcards.data, 'command']
    output:
        "data/{data, *.fq.gz}"
    shell:
        "{input}"
