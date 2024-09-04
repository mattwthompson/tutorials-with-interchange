# pdb
mkdir input/
wget -P input/ https://gitlab.com/gromacs/online-tutorials/md-intro-tutorial/-/raw/main/data/input/1fjs.pdb
wget -P input/ https://gitlab.com/gromacs/online-tutorials/md-intro-tutorial/-/raw/main/data/input/emin-charmm.mdp

# "Clean" the PDB file
grep -v HETATM input/1fjs.pdb > 1fjs_protein_tmp.pdb
grep -v CONECT 1fjs_protein_tmp.pdb > 1fjs_protein.pdb

# Choose the force field
gmx pdb2gmx -f 1fjs_protein.pdb -o 1fjs_processed.gro -water tip3p -ff "charmm27" 

# Define the simulation box
gmx editconf -f 1fjs_processed.gro -o 1fjs_newbox.gro -c -d 1.0 -bt dodecahedron

# Fill the box with water
gmx solvate -cp 1fjs_newbox.gro -cs spc216.gro -o 1fjs_solv.gro -p topol.top

# Prepare inputs for "gmx genion"
touch ions.mdp
gmx grompp -f ions.mdp -c 1fjs_solv.gro -p topol.top -o ions.tpr

printf "SOL\n" | gmx genion -s ions.tpr -o 1fjs_solv_ions.gro -conc 0.15 -p \
    topol.top -pname NA -nname CL -neutral

# Energy minimisation
gmx grompp -f input/emin-charmm.mdp -c 1fjs_solv_ions.gro -p topol.top -o em.tpr
gmx mdrun -v -deffnm em
