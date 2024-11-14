wget https://files.rcsb.org/download/1L2Y.pdb

pdb4amber 1l2y.pdb>1l2y.amber.pdb

tleap -f tleap.in > tleap.out

parmed tc5b.1l2y.parm7 -i parmed.in

sander -O -i min.in \
 -p tc5b.1l2y.hmass.parm7 -c tc5b.1l2y.rst7 -o min.out \
 -x min.crd -inf min.info -r min.rst7

sander -O -i heat.in \
 -p tc5b.1l2y.hmass.parm7 -c min.rst7 -ref min.rst7 \
 -o heat.out -x heat.crd -inf heat.info -r heat.rst7 \

