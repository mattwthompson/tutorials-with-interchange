# TODO: More elegantly loop over folders in this path

# pdb
wget https://raw.githubusercontent.com/gromacstutorials/gromacstutorials-inputs/main/level1/protein-in-electrolyte/1cta.pdb

# Convert the PDB file
yes 0 | gmx trjconv -f 1cta.pdb -s 1cta.pdb -o 1cta.gro -center -box 5 5 5

# Choose the force field
echo 1 | gmx pdb2gmx -f 1cta.gro -water spce -v -ignh -o unsolvated.gro

# Solvate the protein
gmx solvate -cs spc216.gro -cp unsolvated.gro -o solvated.gro -p topol.top
