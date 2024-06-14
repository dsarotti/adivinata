import 'package:adivinata/model/usuario.dart';
import 'package:adivinata/model/usuario_app.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';

/// AdivinataServicio es una clase que extiende GetxService y gestiona la lógica
/// relacionada con la autenticación de usuarios y el manejo de sesiones.
///
/// Esta clase proporciona funcionalidades para:
/// - Iniciar sesión de un usuario.
/// - Registrar un nuevo usuario.
/// - Cerrar sesión del usuario actual.
class AdivinataServicio extends GetxService {
  final DatabaseHelper dbHelper = DatabaseHelper();

  /// Inicia sesión para un usuario con el nombre de usuario y contraseña proporcionados.
  ///
  /// @param nombreUsuario El nombre de usuario.
  /// @param pass La contraseña.
  /// @return Un Future que resuelve a true si la sesión se inició correctamente, de lo contrario, false.
  Future<bool> iniciarSesion(String nombreUsuario, String pass) async {
    int? id = await dbHelper.login(nombreUsuario, pass);
    if (id != null) {
      Usuario? usuario = await dbHelper.getUsuario(id);
      if (usuario != null) {
        UsuarioApp().id = id;
        UsuarioApp().nombreUsuario = usuario.nombreUsuario;
        UsuarioApp().correoElectronico = usuario.correoElectronico;
        return true;
      }
    }
    return false;
  }

  /// Registra un nuevo usuario con la información proporcionada.
  ///
  /// @param usuario El objeto Usuario con la información del usuario.
  /// @param pass La contraseña del usuario.
  /// @return Un Future que resuelve a true si el registro fue exitoso, de lo contrario, false.
  Future<bool> registrarse(Usuario usuario, String pass) async {
    return await dbHelper.registro(usuario, pass);
  }

  /// Cierra la sesión del usuario actual y redirige a la pantalla de inicio de sesión.
  void logout() {
    UsuarioApp().id = null;
    UsuarioApp().nombreUsuario = null;
    UsuarioApp().correoElectronico = null;
    Get.offAllNamed("/inicio_sesion");
  }
}