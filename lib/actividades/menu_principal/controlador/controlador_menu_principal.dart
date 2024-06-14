import 'package:adivinata/model/usuario_app.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

/// ControladorMenuPrincipal es una clase que extiende GetxController
/// y gestiona la lógica para el menú principal de la aplicación.
///
/// Esta clase proporciona funcionalidades para:
/// - Gestionar la información del usuario actual.
/// - Compartir el enlace de la aplicación.
class ControladorMenuPrincipal extends GetxController {
  /// Instancia del usuario actual.
  UsuarioApp usuario = UsuarioApp();

  /// Comparte el enlace de la aplicación usando el paquete Share.
  ///
  /// Envía un mensaje con un enlace a la tienda de aplicaciones y un asunto.
  void compartir() {
    Share.share('¡Juegazo! https://enlace-a-playstore.com', subject: '¡Mira lo que hice!');
  }
}
