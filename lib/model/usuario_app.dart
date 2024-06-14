/// Clase que representa los datos del usuario de la aplicación.
class UsuarioApp {
  int? id; // Identificador único del usuario
  String? nombreUsuario; // Nombre de usuario del usuario
  String? correoElectronico; // Correo electrónico del usuario
  static final UsuarioApp _instancia = UsuarioApp._privateConstructor();

  /// Constructor privado para evitar instancias directas de UsuarioApp.
  UsuarioApp._privateConstructor();

  /// Método factory para obtener la instancia única de UsuarioApp.
  factory UsuarioApp() {
    return _instancia;
  }

  /// Método para olvidar los datos del usuario.
  ///
  /// Este método establece los campos [nombreUsuario] y [correoElectronico] a null,
  /// lo que simula el olvido de los datos del usuario en la sesión actual.
  void olvidar() {
    nombreUsuario = null;
    correoElectronico = null;
  }
}
