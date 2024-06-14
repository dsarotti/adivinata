import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../model/usuario.dart';

/// ControladorFormularioRegistro es una clase que extiende GetxController
/// y gestiona la lógica para el formulario de registro de usuarios.
///
/// Esta clase proporciona funcionalidades para:
/// - Gestionar los datos del usuario, contraseña y correo electrónico.
/// - Alternar la visibilidad de la contraseña.
/// - Enviar el formulario de registro y manejar la navegación en caso de éxito o error.
class ControladorFormularioRegistro extends GetxController {
  /// El nombre de usuario ingresado por el usuario.
  String usuario = "";

  /// La contraseña ingresada por el usuario.
  String pass = "";

  /// El correo electrónico ingresado por el usuario.
  String email = "";

  /// Controla la visibilidad de la contraseña.
  RxBool mostrarPass = true.obs;

  /// Controlador del campo de texto del correo electrónico.
  TextEditingController controllerEmail = TextEditingController();

  /// Controlador del campo de texto del nombre de usuario.
  TextEditingController controllerUsuario = TextEditingController();

  /// Controlador del campo de texto de la contraseña.
  TextEditingController controllerPass = TextEditingController();

  /// Alterna entre mostrar u ocultar la contraseña.
  void switchMostrarPass() {
    mostrarPass.value = !mostrarPass.value;
  }

  /// Envía el formulario de registro utilizando la información proporcionada.
  ///
  /// Si el registro es exitoso, muestra un mensaje de éxito y cierra los overlays.
  /// Si falla, muestra un mensaje de error.
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
        controllerPass.text)) {
      Get.back(closeOverlays: true);
      Get.snackbar("Registro completado", "¡Enhorabuena! ¡Ya puedes iniciar sesión!");
    } else {
      Get.snackbar("Error", "Parece que ese usuario ya existe :(");
    }
  }
}
