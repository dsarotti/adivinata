import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ControladorFormularioLogin es una clase que extiende GetxController
/// y gestiona la lógica para el formulario de inicio de sesión.
///
/// Esta clase proporciona funcionalidades para:
/// - Gestionar los datos del usuario y la contraseña.
/// - Alternar la visibilidad de la contraseña.
/// - Iniciar sesión y manejar la navegación en caso de éxito o error.
class ControladorFormularioLogin extends GetxController {
  /// El nombre de usuario ingresado por el usuario.
  String usuario = "";

  /// La contraseña ingresada por el usuario.
  String pass = "";

  /// Controla la visibilidad de la contraseña.
  RxBool mostrarPass = true.obs;

  /// Controlador del campo de texto del nombre de usuario.
  TextEditingController controllerUsuario = TextEditingController();

  /// Controlador del campo de texto de la contraseña.
  TextEditingController controllerPass = TextEditingController();

  /// Alterna entre mostrar u ocultar la contraseña.
  void switchMostrarPass() {
    mostrarPass.value = !mostrarPass.value;
  }

  /// Inicia sesión utilizando el nombre de usuario y la contraseña proporcionados.
  ///
  /// Si el inicio de sesión es exitoso, redirige al menú principal.
  /// Si falla, muestra un mensaje de error.
  void logIn() async {
    if (await Get.find<AdivinataServicio>().iniciarSesion(controllerUsuario.value.text, controllerPass.value.text)) {
      Get.offNamed('menu_principal');
    } else {
      Get.snackbar("Error de inicio de sesión", "Combinación de usuario y contraseña equivocada");
    }
  }
}
