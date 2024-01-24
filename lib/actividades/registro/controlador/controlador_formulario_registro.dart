import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControladorFormularioRegistro extends GetxController {
  String usuario = "";
  String pass = "";
  RxBool mostrarPass = true.obs;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  /// Alterna entre mostrar u ocultar contraseña
  void switchMostrarPass() {
    mostrarPass.value = !mostrarPass.value;
  }

  void enviarFormularioRegistro(){
    //TODO registrar usuario enviando el formulario de registro.
    
    Get.back();
  }

}