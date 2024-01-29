
import 'package:adivinata/res/palabras.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControladorPalabraAleatoria extends GetxController{
  final String palabraAleatoria=Palabras.obtenerPalabraAleatoria();

  ///Controlador del campo de texto en curso
  TextEditingController palabraActual = TextEditingController();

  ///Lista observable de las palabras que ya se han introducido
  RxList<String> palabrasIntroducidas = List<String>.empty(growable: true).obs;


  @override
  void onClose() {
    ///Al salir de la partida se limpian los campos.
    palabraActual.clear();
    palabrasIntroducidas.value.clear();

    super.onClose();
  }
}