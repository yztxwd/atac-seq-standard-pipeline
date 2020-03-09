# dump per base coverage into the HDF5 file
rule dumpHDF5:
    input:
        samples=expand("output/mapped/{samples}.merged.coverage.1b.bg", samples=list(samples["sample"].values))
    output:
        "output/coverage.h5"
    params:
        specie="mouse",
        collect=config["dump"]["collect"],
        collectDatabase=config["dump"]["collectDatabase"]
    conda:
        "../envs/py3.yaml"
    script:
        "../scripts/dumpHDF5.smk.py"