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

### OpenMM

| Group | System | Status |
|--|--|--|
| Official | 1o9s_tip5p | :x: |
| | First simulation | :white_check_mark: |
| | hsp90 | :x: |
| | Protein in water | :warning: |

### LAMMPS

| Group | System | Status |
|--|--|--|
| Gravelle | Lennard-jones fluid | :x: |
| | Pulling on a carbon nanotube | :x: |
| | Water adsorption in silica | :x: |

### Amber

| Group | System | Status |
|--|--|--|
| Official | ff15ipq-m | :x: |
| | Pantetheine | :x: |
| | Ionic Liquid | :x: |
| | Protein on a metal surface | :x: |
| | PET | :x: |
| | Hydroxyapatite slab | :x: |
| | Relaxation of Implicit Solvent Systems | :x: |
| | Sustiva | :x: |
| | DNA-ligand system | :x: |
| | Fluorescent protein | :x: |
| | Metal Ion Modeling Tutorial | :x: |

## Updates

10-21-2024: LAMMPS tutorials fail because there is no LAMMPS reader in Interchange.

10-17-2024: OpenMM cookbook tutorials have mixed results, unable to load systems with virtual sites or properly processing bound metals.

09-18-2024: All Lemkul tutorials fail because `Interchange.from_gromacs` does not parse GROMACS topology files referencing `.itp` files or including virtual sites.

09-04-2024: All Gravelle tutorials fail because `Interchange.from_gromacs` does not parse GROMACS topology files referencing `.itp` files.

08-02-2024: All "official" GROMACS tutorials fail because `Interchange.from_gromacs` does not parse GROMACS topology files referencing `.itp` files.

## License

See LICENSE for details
