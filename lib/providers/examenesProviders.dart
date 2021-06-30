import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tabbar/models/pregunta.dart';
import 'package:tabbar/models/respuesta.dart';

class _ExamenesProviders{

  List<dynamic> respuestas = [];

  _ExamenesProviders();

  Future<List<dynamic>> cargarDatos() async{
    final respuesta = await rootBundle.loadString("data/examenes.json");
    Map info = json.decode(respuesta); 
    respuestas =  info['respuestas'];
    return respuestas;
  }

  Future<Pregunta> devolverUnaRespuesta() async{
   
    final respuesta = await rootBundle.loadString("data/examenes.json");
    Map info = json.decode(respuesta); 
    Pregunta pregunta = Pregunta.fromMap(info);
    print(pregunta);
    return pregunta;
  }

}

final examenesProvider = _ExamenesProviders();