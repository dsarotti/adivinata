import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:adivinata/actividades/partidas/dialogos/victoria_dialogo.dart';
import 'package:adivinata/actividades/partidas/dialogos/victoria_tiempo_dialogo.dart';
import 'package:adivinata/model/usuario_app.dart';
import 'package:adivinata/res/palabras.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/partida.dart';

/// ControladorPalabraAleatoria es una clase que extiende GetxController
/// y gestiona la lógica para una actividad de adivinación de palabras.
///
/// Esta clase proporciona funcionalidades para:
/// - Obtener y gestionar una palabra aleatoria.
/// - Controlar un campo de texto donde el usuario introduce palabras.
/// - Mantener una lista observable de palabras introducidas.
/// - Reiniciar la partida.
/// - Salir al menú principal.
/// - Gestionar la lógica de envío de palabras y comprobar si coinciden con la palabra aleatoria.
/// - Escuchar cambios en la lista de palabras introducidas para determinar si el usuario ha ganado.
class ControladorPalabraAleatoria extends GetxController {
  RxString palabraAleatoria = Palabras.obtenerPalabraAleatoria().obs;

  /// Controlador del campo de texto en curso
  TextEditingController palabraActual = TextEditingController();

  /// Lista observable de las palabras que ya se han introducido
  RxList<String> palabrasIntroducidas = List<String>.empty(growable: true).obs;

  /// Reinicia la partida desde el diálogo de victoria.
  void reiniciarPartidaDesdeDialogo(){
    palabraActual.text = "";
    palabrasIntroducidas.clear();
    palabrasIntroducidas.refresh();
    palabraAleatoria.value = Palabras.obtenerPalabraAleatoria();
    palabraAleatoria.refresh();
    Get.back();
    Get.log("La palabra es $palabraAleatoria");
  }

  /// Sale al menú principal.
  void salirAlMenu(){
    Get.offNamed("/menu_principal");
    Get.find<ControladorPalabraAleatoria>().palabrasIntroducidas.close();
    Get.delete<ControladorPalabraAleatoria>();
  }

  /// Añade una palabra introducida a la lista y limpia el campo de texto.
  ///
  /// @param cadena La palabra introducida por el usuario.
  void submit(String cadena) {
    palabrasIntroducidas.add(cadena);
    palabraActual.clear();
  }

  @override
  void onReady() {
    Get.log("La palabra es $palabraAleatoria");
    super.onReady();
  }

  /// Inicia un listener para escuchar cambios en la lista de palabras introducidas.
  void iniciarListener(){
    palabrasIntroducidas.stream.listen((event) {
      if(palabrasIntroducidas.isNotEmpty) {
        if (event.last.compareTo(palabraAleatoria.value) == 0 ) {
          if(Get.currentRoute.compareTo("/palabra_aleatoria") == 0) {
            AdivinataServicio svc = Get.find<AdivinataServicio>();
            Partida partida = Partida(null, UsuarioApp().id!, event.last, palabrasIntroducidas.length);
            svc.dbHelper.insertPartida(partida);
            Get.dialog(const VictoriaDialog());
          } else if(Get.currentRoute.compareTo("/palabra_aleatoria_tiempo") == 0){
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
