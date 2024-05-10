from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2

app = Flask(__name__)
CORS(app)
# Configuración de la base de datos
DATABASE = {
    'dbname': 'recetas_db',
    'user': 'postgres',
    'password': '1803',
    'host': 'localhost'
}

def get_db_connection():
    return psycopg2.connect(**DATABASE)

# Endpoint para agregar una nueva receta
@app.route('/recetas', methods=['POST'])
def agregar_receta():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Obtener los datos de la receta del cuerpo de la solicitud
        data = request.json
        nombre = data['nombre']
        ingredientes = data['ingredientes']
        instrucciones = data['instrucciones']

        # Insertar la receta en la base de datos
        cursor.execute("INSERT INTO recetas (nombre, ingredientes, instrucciones) VALUES (%s, %s, %s)", (nombre, ingredientes, instrucciones))
        conn.commit()

        return jsonify({'message': 'Receta agregada correctamente'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cursor.close()
        conn.close()

# Endpoint para obtener todas las recetas
@app.route('/recetas', methods=['GET'])
def obtener_recetas():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Obtener todas las recetas
        cursor.execute("SELECT * FROM recetas")
        recetas = cursor.fetchall()

        # Convertir las recetas a formato JSON
        recetas_json = []
        for receta in recetas:
            receta_json = {
                'id': receta[0],
                'nombre': receta[1],
                'ingredientes': receta[2],
                'instrucciones': receta[3]
            }
            recetas_json.append(receta_json)

        return jsonify(recetas_json)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    app.run(debug=True)
