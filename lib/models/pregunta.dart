import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tabbar/models/respuesta.dart';

class Pregunta {

  String tipo;

  String pregunta;

  List<Respuesta> respuestas;

  bool correcta;
  Pregunta({
     this.tipo,
     this.pregunta,
     this.respuestas,
     this.correcta,
  });

  



  Pregunta copyWith({
    String tipo,
    String pregunta,
    List<Respuesta> respuestas,
    bool correcta,
  }) {
    return Pregunta(
      tipo: tipo ?? this.tipo,
      pregunta: pregunta ?? this.pregunta,
      respuestas: respuestas ?? this.respuestas,
      correcta: correcta ?? this.correcta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'pregunta': pregunta,
      'respuestas': respuestas?.map((x) => x.toMap())?.toList(),
      'correcta': correcta,
    };
  }

  factory Pregunta.fromMap(Map<String, dynamic> map) {
    return Pregunta(
      tipo: map['tipo'],
      pregunta: map['pregunta'],
      respuestas: List<Respuesta>.from(map['respuestas']?.map((x) => Respuesta.fromMap(x))),
      correcta: map['correcta'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pregunta.fromJson(String source) => Pregunta.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pregunta(tipo: $tipo, pregunta: $pregunta, respuestas: $respuestas, correcta: $correcta)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Pregunta &&
      other.tipo == tipo &&
      other.pregunta == pregunta &&
      listEquals(other.respuestas, respuestas) &&
      other.correcta == correcta;
  }

  @override
  int get hashCode {
    return tipo.hashCode ^
      pregunta.hashCode ^
      respuestas.hashCode ^
      correcta.hashCode;
  }
}
