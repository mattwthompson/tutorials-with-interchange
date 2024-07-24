# Create the configuration file
wget https://raw.githubusercontent.com/gromacstutorials/gromacstutorials-inputs/main/level3/solvation-energy/preparation/FJEW_allatom_optimised_geometry.pdb

yes 0 | gmx trjconv -f FJEW_allatom_optimised_geometry.pdb -s FJEW_allatom_optimised_geometry.pdb -o hbc.gro -box 3 3 3 -center

# Create the topology file
cat > topol.top << EOF
#include "ff/gromos54a7_atb.ff/forcefield.itp"
#include "ff/FJEW_GROMACS_G54A7FF_allatom.itp"

[ system ]
Single HBC molecule

[ molecules ]
FJEW 1
EOF

mkdir -p ff
wget https://raw.githubusercontent.com/gromacstutorials/gromacstutorials-inputs/main/level3/solvation-energy/preparation/ff-itp.zip
unzip -o ff-itp.zip -d ff/
