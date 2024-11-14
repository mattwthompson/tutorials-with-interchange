# Relaxation of Implicit Solvent Systems

Source: https://ambermd.org/tutorials/basic/tutorial15/index.php#pdb

Modifications:

* Added `quit` line to `tleap.in` so it actually runs (code in tutorial crashes)
* Added ParmEd commands into a script so it can run
* Used `sander` instead of `pmemd.cuda`
* Used `gbsa=1`, unclear if that's recommended

Status: Not running 500,000 steps of MD on a laptop
