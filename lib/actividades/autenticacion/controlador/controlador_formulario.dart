import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
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

  void logIn()async{
    if(await Get.find<AdivinataServicio>().iniciarSesion(controllerUsuario.value.text, controllerPass.value.text)){
      Get.offNamed('menu_principal');
    }else{
      Get.snackbar("Error de inicio de sesión", "Combinación de usuario y contraseña equivocada");
    }
  }
}