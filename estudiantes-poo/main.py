import eel
from   utils import conexion_a_la_db, consultar_calificaciones

conexion = conexion_a_la_db("./db-estudiantes.sqlite")
conexion.execute("select * from estudiantes")
@eel.expose
def consultar_clasificacion_general(parametro_de_orden = None, tipo_de_orden = None):
    return consultar_calificaciones(conexion, parametro_de_orden, tipo_de_orden)

# Inicializar interfaz gráfica
eel.init('gui')
eel.start('home.html', mode="firefox")