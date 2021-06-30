import 'dart:convert';

class Respuesta {

  String respuesta;
  bool correcta;
  Respuesta({
     this.respuesta,
     this.correcta,
  });


  Respuesta copyWith({
    String respuesta,
    bool correcta,
  }) {
    return Respuesta(
      respuesta: respuesta ?? this.respuesta,
      correcta: correcta ?? this.correcta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'respuesta': respuesta,
      'correcta': correcta,
    };
  }

  factory Respuesta.fromMap(Map<String, dynamic> map) {
    return Respuesta(
      respuesta: map['respuesta'],
      correcta: map['correcta'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Respuesta.fromJson(String source) => Respuesta.fromMap(json.decode(source));

  @override
  String toString() => 'Respuesta(respuesta: $respuesta, correcta: $correcta)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Respuesta &&
      other.respuesta == respuesta &&
      other.correcta == correcta;
  }

  @override
  int get hashCode => respuesta.hashCode ^ correcta.hashCode;
}
