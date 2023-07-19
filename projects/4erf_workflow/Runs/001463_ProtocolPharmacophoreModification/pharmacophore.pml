from pymol.cgo import *
from pymol import cmd
load /home/danieldh/ScipionUserData/projects/4erf_demo/Runs/001379_ProtExtractLigands/4erf.pdb, receptor
load /home/danieldh/ScipionUserData/projects/4erf_demo/Runs/001506_ProtocolPharmacophoreFiltering/ZINC00001019_0.sdf, ZINC00001019_0
disable ZINC00001019_0
load /home/danieldh/ScipionUserData/projects/4erf_demo/Runs/001506_ProtocolPharmacophoreFiltering/ZINC00001099_0.sdf, ZINC00001099_0
disable ZINC00001099_0
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
	SPHERE,   -37.79,   9.96,   -57.07,  2.0,


    ]

cmd.load_cgo(spherelist_Acceptor, 'Acceptor')
spherelist_Hydrophobe = [
    	ALPHA,   0.5,
	COLOR,    1,    0.9,    0,
	SPHERE,   -34.84375,   12.259625,   -53.59012500000001,  3.5209767776499152,


    ]

cmd.load_cgo(spherelist_Hydrophobe, 'Hydrophobe')

python end
