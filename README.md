# Using Interchange in existing engine tutorials

[Project page](https://openforcefield.atlassian.net/wiki/spaces/IN/pages/2758344711/Project+Plan+Common+workflow+conversion+via+Interchange)

## Status

### GROMACS

| Group | System | Status |
|--|--|--|
| Gravelle | Bulk salt solution | :x: |
| | Protein in electrolyte | :x: |
| | Stretching a polymer | :x: |
| | Solvation energy | :x: |
| Official | MD intro | :x: |
| | Membrane protein | :x: |
| Lemkul | Lysozyme in water | :x: |
| | Membrane protein | :x: |
| | Biphasic system | :x: |
| | Protein-ligand complex | :x: |
| | CO2 with virtual sites | :x: |


## Updates

09-18-2024: All Lemkul tutorials fail because `Interchange.from_gromacs` does not parse GROMACS topology files referencing `.itp` files or including virtual sites.

09-04-2024: All Gravelle tutorials fail because `Interchange.from_gromacs` does not parse GROMACS topology files referencing `.itp` files.

08-02-2024: All "official" GROMACS tutorials fail because `Interchange.from_gromacs` does not parse GROMACS topology files referencing `.itp` files.

## License

See LICENSE for details
