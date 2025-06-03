from flask import Flask, jsonify, request

app = Flask(__name__)

# Datos simulados
usuarios = [{"id": 1, "nombre": "Juan"}, {"id": 2, "nombre": "Ana"}]


@app.route("/usuarios", methods=["GET"])
def obtener_usuarios():
    return jsonify(usuarios)


@app.route("/usuarios/<int:id>", methods=["GET"])
def obtener_usuario(id):
    usuario = next((u for u in usuarios if u["id"] == id), None)
    return jsonify(usuario) if usuario else ("Usuario no encontrado", 404)


@app.route("/usuarios", methods=["POST"])
def crear_usuario():
    nuevo = request.get_json()
    usuarios.append(nuevo)
    return jsonify(nuevo), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
