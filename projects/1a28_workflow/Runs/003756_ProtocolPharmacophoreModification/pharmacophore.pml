from pymol.cgo import *
from pymol import cmd
load /home/danieldh/ScipionUserData/projects/dcoid_1a28/Runs/000037_ProtImportPdb/extra/1a28.pdb, receptor
    #ligands

python
spherelist_Acceptor = [
    	ALPHA,   0.5,
	COLOR,    0.9,    0,    0,
	SPHERE,   22.993,   12.245,   54.695,  1.0,

	ALPHA,   0.5,
	COLOR,    0.9,    0,    0,
	SPHERE,   22.22,   6.451,   65.257,  1.0,


    ]

cmd.load_cgo(spherelist_Acceptor, 'Acceptor')
spherelist_Hydrophobe = [
    	ALPHA,   0.5,
	COLOR,    1,    0.9,    0,
	SPHERE,   23.302,   9.665000000000001,   59.799285714285716,  2.1524724511735878,


    ]

cmd.load_cgo(spherelist_Hydrophobe, 'Hydrophobe')

python end
