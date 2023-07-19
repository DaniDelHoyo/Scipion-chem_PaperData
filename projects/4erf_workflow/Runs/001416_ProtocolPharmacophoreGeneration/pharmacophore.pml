from pymol.cgo import *
from pymol import cmd
load /home/danieldh/ScipionUserData/projects/4erf_demo/Runs/001379_ProtExtractLigands/4erf.pdb, receptor
load /home/danieldh/ScipionUserData/projects/4erf_demo/Runs/001416_ProtocolPharmacophoreGeneration/extra/inputSmallMolecules/4erf_0R3-1.pdb, 4erf_0R3-1
disable 4erf_0R3-1
    #ligands

python
spherelist_Donor = [
    	ALPHA,   0.5,
	COLOR,    0,    0.9,    0,
	SPHERE,   -36.4595,   11.8,   -50.4845,  1.7215349255824026,


    ]

cmd.load_cgo(spherelist_Donor, 'Donor')
spherelist_Acceptor = [
    	ALPHA,   0.5,
	COLOR,    0.9,    0,    0,
	SPHERE,   -37.79,   9.9615,   -57.0745,  1.1290936630767177,


    ]

cmd.load_cgo(spherelist_Acceptor, 'Acceptor')
spherelist_Hydrophobe = [
    	ALPHA,   0.5,
	COLOR,    1,    0.9,    0,
	SPHERE,   -34.84375,   12.259625,   -53.59012500000001,  3.5209767776499152,


    ]

cmd.load_cgo(spherelist_Hydrophobe, 'Hydrophobe')
spherelist_Aromatic = [
    	ALPHA,   0.5,
	COLOR,    0.5,    0,    1,
	SPHERE,   -31.979666666666667,   10.4985,   -54.424166666666665,  1.0,


    ]

cmd.load_cgo(spherelist_Aromatic, 'Aromatic')

python end
