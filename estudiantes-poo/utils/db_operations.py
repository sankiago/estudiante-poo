import sqlite3
from   sqlite3  import Error

#Función conexión base de datos con devolución objeto conexion
def conexion_a_la_db(nombre):
  try:
    conexion = sqlite3.connect(nombre)
    return conexion
  except Error:
    print(Error)

def consultar_calificaciones(conexion, ordenar_por="Promedio", tipo_de_orden = "DESC"):
  sentencia_de_consulta = f'''SELECT
	identificacion as "Identificación",
	estudiantes.nombre as "Nombre",
  estudiantes.apellido as "Apellido",
	COUNT(identificacion) as "Cantidad de materias tomadas",
	SUM(materias.creditos) as "Cantidad de créditos acumulados",
	ROUND(SUM(notas_finales.nota * materias.creditos) / SUM(materias.creditos),2) as "Promedio"
	FROM notas_finales
	JOIN estudiantes 
		ON notas_finales.id_estudiante = estudiantes.identificacion
	JOIN materias
		ON notas_finales.id_materia = materias.id
	GROUP BY id_estudiante
	ORDER BY "{ordenar_por}" {tipo_de_orden}'''
  respuesta_consulta = conexion.cursor().execute(sentencia_de_consulta).fetchall()
  return respuesta_consulta