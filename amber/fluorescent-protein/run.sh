wget -nc https://ambermd.org/tutorials/basic/tutorial5/files/1EMA.pdb

# pdb4amber -i 1EMA.pdb -o gfp.pdb --dry --reduce
wget -nc https://ambermd.org/tutorials/basic/tutorial5/files/gfp.pdb
wget -nc https://ambermd.org/tutorials/basic/tutorial5/files/CRO.cif

antechamber -fi ccif -i CRO.cif -bk CRO -fo ac -o cro.ac -c bcc -at amber

prepgen -i cro.ac -o cro.prepin -m cro.mc -rn CRO

parmchk2 -i cro.prepin -f prepi -o frcmod.cro -a Y -p $AMBERHOME/dat/leap/parm/parm10.dat

grep -v "ATTN" frcmod.cro > frcmod1.cro
parmchk2 -i cro.prepin -f prepi -o frcmod2.cro

tleap -f tleap.in

sander -O -i min.in -p gfp.parm7 -c gfp.rst7 -o min1.out -r min1.rst7
sander -O -i heat.in -p gfp.parm7 -c min1.rst7 -o heat.mdout -x heat.nc -r heat.rst7
sander -O -i md.in -p gfp.parm7 -c heat.rst7 -o md1.mdout -x md1.nc -r md1.rst7

