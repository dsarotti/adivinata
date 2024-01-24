import 'package:adivinata/model/usuario_app.dart';
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

  void logIn(){
    //TODO: intentar inicio de sesión, obtener datos del usuario de la BD.
    //Temporalmente el login es Dante - abc123.
    if(controllerUsuario.value.text=="Dante"&&controllerPass.value.text =="abc123."){
      String correoElectronico = "dante@dante.com";

      //Establece el usuario de la app.
      //TODO: serializar el usuario y guardarlo en sharedPreferences
      UsuarioApp().setUsuario(usuario, correoElectronico);
      Get.offNamed('menu_principal');
    }
  }
}