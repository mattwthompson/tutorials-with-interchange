tleap -s -f seq.in > seq.out

wget -nc https://ambermd.org/tutorials/advanced/tutorial27/files/Ag_Cell_P1_100.pdb

PropPDB -p Ag_Cell_P1_100.pdb -o Ag_s100_2048.pdb -ix 8 -iy 8 -iz 8

cat ace-ala7-nme.pdb Ag_s100_2048.pdb > pro_metal.pdb

pdb4amber -i pro_metal.pdb -o pro_metal_renum.pdb

wget -nc https://ambermd.org/tutorials/advanced/tutorial27/files/pro_metal_adjust.pdb

tleap -s -f pro_metal_tleap.in > pro_metal_tleap.out

sander -O -i pro_metal_min.in -o pro_metal_min.out -p pro_metal.prmtop -c pro_metal.inpcrd -r pro_metal_min.rst -ref pro_metal.inpcrd

sander -O -i pro_metal_heat.in -o pro_metal_heat.out -p pro_metal.prmtop -c pro_metal_min.rst -r pro_metal_heat.rst -x heat.netcdf -ref pro_metal_min.rst

sander -O -i pro_metal_prod.in -o pro_metal_prod.out -p pro_metal.prmtop -c pro_metal_heat.rst -r pro_metal_prod.rst -x prod.netcdf -ref pro_metal_heat.rst
