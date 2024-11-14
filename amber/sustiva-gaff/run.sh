wget -nc https://ambermd.org/tutorials/basic/tutorial4b/files/sustiva.pdb

reduce sustiva.pdb > sustiva_h.pdb  

wget -nc https://ambermd.org/tutorials/basic/tutorial4b/files/sustiva_new.pdb

antechamber -i sustiva_new.pdb -fi pdb -o sustiva.mol2 -fo mol2 -c bcc -s 2

parmchk2 -i sustiva.mol2 -f mol2 -o sustiva.frcmod

tleap -f tleap.in

wget -nc https://ambermd.org/tutorials/basic/tutorial4b/files/1FKO_trunc_sus.pdb

tleap -f tleap2.in

sander -O -i min.in -o 1FKO_sus_min.out -p 1FKO_sus.prmtop -c 1FKO_sus.rst7  -r 1FKO_sus_min.ncrst  &

ambpdb -p 1FKO_sus.prmtop -c 1FKO_sus_min.ncrst > 1FKO_sus_min.pdb

sander -O -i eq.in -o 1FKO_sus_eq.out -p 1FKO_sus.prmtop -c 1FKO_sus_min.ncrst  -r 1FKO_sus_eq.rst -x 1FKO_sus_eq.nc &

