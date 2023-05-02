// To parse this JSON data, do
//
//     final DerechosResponse = welcomeFromMap(jsonString);

import 'dart:convert';

class DerechosResponse {
    DerechosResponse({
        required this.descripcion,
        required this.nombre,
    });

    String descripcion;
    String nombre;

    factory DerechosResponse.fromJson(String str) => DerechosResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DerechosResponse.fromMap(Map<String, dynamic> json) => DerechosResponse(
        descripcion: json["descripcion"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "nombre": nombre,
    };
}
