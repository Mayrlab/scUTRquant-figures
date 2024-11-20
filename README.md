[![DOI](https://zenodo.org/badge/431515147.svg)](https://zenodo.org/badge/latestdoi/431515147)

## Overview

This repository contains most of the scripts used to generate figures for
[*Fansler et al., bioRxiv, 2023*](https://www.biorxiv.org/content/10.1101/2021.11.22.469635v2).

Additional figures were separately generated in the related repositories:

- Human 3' cleavage site analysis: [repository](https://github.com/Mayrlab/hcl-analysis) ([DOI](https://doi.org/10.5281/zenodo.10892182))
- Mouse 3' cleavage site analysis: [repository](https://github.com/Mayrlab/mca-analysis) ([DOI](https://doi.org/10.5281/zenodo.10892186))
- 3'UTR analysis of Perturb-seq data: [repository](https://github.com/Mayrlab/gwps-sq) ([DOI](https://doi.org/10.5281/zenodo.10895730))


## Organization
The folders in the repository have the following purposes:

- `envs` - Conda environment YAML files for recreating the execution environment
- `figures` - source code for generating figures and associated analysis
- `metadata` - *input* information used by some scripts
- `numbers` - source code for generating numbers used in the manuscript
- `tables` - source code for generating supplementary data and intermediate tables

Input data files to these scripts are [deposited to figshare](https://doi.org/10.6084/m9.figshare.25529632).

### Source Code
The primary source code is found in the `figures` and `tables` folders. 
Files are named to correspond with the figures they generate. HTML renders
of the RMarkdown files.

### Execution Environments
The R instances used to execute the files was captured both in the rendered RMDs themselves
(see **Runtime Details** section in HTMLs) and provided as YAML files in the `envs` folder.

To recreate on arbitrary platforms (Linux or MacOS), we recommend using 
[Micromamba](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html#)
and the minimal YAML (`*.min.yaml`):

```bash
micromamba create -n bioc_3_16 -f envs/bioc_3_16.min.yaml
micromamba activate bioc_3_16
```

A fully-solved environment capture is also provided (`*.full.yaml`). This is only 
expected to recreate on the **osx-64** platform and is primarly intended for *exact* 
replication and a statement of record.
