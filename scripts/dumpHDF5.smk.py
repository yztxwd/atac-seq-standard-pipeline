#!/usr/bin/python3.6

import sys, os, re
import numpyArrayDict as nad

description = """dumpHDF5_smk.py

snakemake version of dumpHDF5_smk.py
dump the 1-based bedgraph file into the HDF5 database

Example:
    rule dump_HDF5:
        input:
            "

@Copyright 2020, Jianyu Yang, Southern Medical University
"""

# Read in snakemake parameters
filenames = snakemake.input.samples
database = snakemake.output[0]
specie = snakemake.params.specie
collect = snakemake.params.collect
collectDatabase = snakemake.params.collectDatabase

# extract source name
pattern = re.compile(r"output/mapped/([A-Za-z0-9_]+).merged.coverage.1b.bg")
sources = [pattern.match(f).groups()[0] + "_coverage" for f in filenames]

index = 0
for i in filenames:
    currNad = nad.numpyArrayDict(specie=specie).create_dict_fromfile(i)
    currNad.dump_hdf5(database, sources[index])
    if collect:
        currNad.dump_hdf5(collectDatabase, sources[index])
    index += 1

