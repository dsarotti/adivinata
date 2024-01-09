import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControladorFormularioLogin extends GetxController {
  String usuario = "";
  String pass = "";
  RxBool mostrarPass = true.obs;

  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  /// Alterna entre mostrar u ocultar contraseña
  void switchMostrarPass() {
    mostrarPass.value = !mostrarPass.value;
  }
}