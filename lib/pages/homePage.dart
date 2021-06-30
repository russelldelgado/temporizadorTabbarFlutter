import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tabbar/models/pregunta.dart';
import 'package:tabbar/providers/examenesProviders.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool eleccion;
  

  @override
  void initState() {
    eleccion = true; 
    super.initState();
  }
 
  final duration = Duration(seconds: 1); 
  var swatch = Stopwatch();
  var temporizador = "00:00:00";


  void _startTimer(){
    Timer(duration, (){
      
      if(swatch.isRunning){
        _startTimer();
        setState(() {
                  temporizador = swatch.elapsed.inHours.toString().padLeft(2,"0") + ":"
                  + (swatch.elapsed.inMinutes % 60).toString().padLeft(2 , "0") + ":"
                  +  (swatch.elapsed.inSeconds % 60).toString().padLeft(2,"0");
                });
                 if(swatch.elapsed.inMinutes == 7 ){
                   swatch.stop();
                print("calculando los 7 minutos");
              }
      }

    });
  }

  void _startSwatch(){
    swatch.start();
    _startTimer();
  }

  void _stopSwatch(){

  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 2, child: Scaffold(
       appBar: AppBar(
         title: Text("HOME PAGE"),
         bottom: TabBar(
           tabs: [
             Text("izquierda"),
             Text("CRONOMETRO"),
           ],
           labelPadding: EdgeInsets.only(bottom: 10),
         ),
       ),
       body: TabBarView(children: [
         _pregunta(),
         //Center(child: Text("IZQUIERDO"),),
         Center(child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(temporizador),  
             ElevatedButton(
               child: Text("START"),
             onPressed: (){
               print("INICIANDO TEMPORIZADOR");
               _startSwatch();
             },
            
           ),
           
           ]
         ),),
       ]),
    ),);
  }

  Widget _pregunta(){


    return FutureBuilder(
      future: examenesProvider.devolverUnaRespuesta() ,
      builder: (context, snapshot) {

            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }else{
              print("DATOS ");
              print(snapshot.data);
              return _preguntaBienBonita(snapshot.data);

            }

             
            },);
  }

  Widget _preguntaBienBonita(Pregunta pregunta){
    return ListTile(
      title: Text(pregunta.pregunta),
      subtitle: ListView.builder(
        itemCount: pregunta.respuestas.length,
        itemBuilder: (context, index) {
                      return SwitchListTile(
                        title: Text(pregunta.respuestas[index].respuesta),
                        value: eleccion, 
                        
                        onChanged: (value) {
                          print(value);
                            eleccion = value;
                         },);
                    },),
    );
  }

}