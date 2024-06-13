import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:adivinata/actividades/partidas/dialogos/victoria_dialogo.dart';
import 'package:adivinata/actividades/partidas/dialogos/victoria_tiempo_dialogo.dart';
import 'package:adivinata/model/usuario_app.dart';
import 'package:adivinata/res/palabras.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/partida.dart';

class ControladorPalabraAleatoria extends GetxController {
  RxString palabraAleatoria = Palabras.obtenerPalabraAleatoria().obs;

  ///Controlador del campo de texto en curso
  TextEditingController palabraActual = TextEditingController();

  ///Lista observable de las palabras que ya se han introducido
  RxList<String> palabrasIntroducidas = List<String>.empty(growable: true).obs;

  void reiniciarPartidaDesdeDialogo(){
    palabraActual.text="";
    palabrasIntroducidas.clear();
    palabrasIntroducidas.refresh();
    palabraAleatoria.value = Palabras.obtenerPalabraAleatoria();
    palabraAleatoria.refresh();
    Get.back();
    Get.log("La palabra es $palabraAleatoria");

  }

  void salirAlMenu(){
    Get.offNamed("/menu_principal");
    Get.find<ControladorPalabraAleatoria>().palabrasIntroducidas.close();
    Get.delete<ControladorPalabraAleatoria>();
  }

  void submit(String cadena) {
    palabrasIntroducidas.add(cadena);
    palabraActual.clear();
  }

  @override
  void onReady() {
    Get.log("la palabra es $palabraAleatoria");
    super.onReady();
  }

  iniciarListener(){
    palabrasIntroducidas.stream.listen((event) {
      if(palabrasIntroducidas.isNotEmpty) {
        if (event.last.compareTo(palabraAleatoria.value) == 0 ) {
          if(Get.currentRoute.compareTo("/palabra_aleatoria")==0) {
            AdivinataServicio svc = Get.find<AdivinataServicio>();
            Partida partida = Partida(null, UsuarioApp().id!, event.last, palabrasIntroducidas.length);
            svc.dbHelper.insertPartida(partida);
            Get.dialog(const VictoriaDialog());
          }else if(Get.currentRoute.compareTo("/palabra_aleatoria_tiempo")==0){
            Get.dialog(const VictoriaTiempoDialog());
          }
        }
      }
    });
  }
  @override
  void onInit() {
   iniciarListener();
    super.onInit();
  }

}
