import os, sqlite3, sys

def cleanStrFromSqlite(sFile, cleanStr):
	conexion = sqlite3.connect(sFile)
	cursor = conexion.execute(f"PRAGMA table_info(Objects)")
	columnas = [columna[1] for columna in cursor.fetchall()]
	
	for columna in columnas:
		consulta = f"UPDATE Objects SET {columna} = REPLACE({columna}, ?, ?) WHERE {columna} LIKE ?"
		conexion.execute(consulta, (cleanStr, '', f'%{cleanStr}%'))
	conexion.commit()
	conexion.close()


def cleanSqlitesFromDir(myDir, cleanStr):
	for sfile in os.listdir(myDir):
		sfile = os.path.join(myDir, sfile)
		if sfile.endswith('.sqlite'):
			cleanStrFromSqlite(sfile, cleanStr)
		elif os.path.isdir(sfile):
			cleanSqlitesFromDir(sfile, cleanStr)


cleanStr = '/home/danieldh/ScipionUserData/projects/4erf_demo/'
myDir = os.getcwd() if not len(sys.argv) > 1 else sys.argv[1]

cleanSqlitesFromDir(myDir, cleanStr)
