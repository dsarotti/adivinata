import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/usuario.dart';

class ControladorFormularioRegistro extends GetxController {
  String usuario = "";
  String pass = "";
  String email = "";
  RxBool mostrarPass = true.obs;

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  /// Alterna entre mostrar u ocultar contraseña
  void switchMostrarPass() {
    mostrarPass.value = !mostrarPass.value;
  }

  void enviarFormularioRegistro() async {
    usuario = controllerUsuario.text;
    email = controllerEmail.text;
    pass = controllerPass.text;
    if (await Get.find<AdivinataServicio>().registrarse(
        Usuario(
          null,
          controllerUsuario.text,
          controllerEmail.text,
        ),
        controllerPass.text)){
      Get.back(closeOverlays: true);
      Get.snackbar("Registro completado", "Enhorabuena! Ya puedes iniciar sesión!");
    }else{
      Get.snackbar("Error", "Parece que ese usuario ya existe :(");
    }
  }
}
