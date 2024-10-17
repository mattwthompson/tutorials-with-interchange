# !wget https://files.rcsb.org/download/1AKI.pdb
# %env INTERCHANGE_EXPERIMENTAL=1

from openmm.app import *
from openmm import *
from openmm.unit import *
from sys import stdout

from openff.interchange import Interchange


pdb = PDBFile("1AKI.pdb")

# Specify the forcefield
forcefield = ForceField('amber14-all.xml', 'amber14/tip3pfb.xml')

modeller = Modeller(pdb.topology, pdb.positions)
modeller.deleteWater()
residues=modeller.addHydrogens(forcefield)

modeller.addSolvent(forcefield, padding=1.0*nanometer)

system = forcefield.createSystem(modeller.topology, nonbondedMethod=PME, nonbondedCutoff=1.0*nanometer, constraints=HBonds)
integrator = LangevinMiddleIntegrator(300*kelvin, 1/picosecond, 0.004*picoseconds)
simulation = Simulation(modeller.topology, system, integrator)
simulation.context.setPositions(modeller.positions)

Interchange.from_openmm(topology=modeller.topology, system=system)