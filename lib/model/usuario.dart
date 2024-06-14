/// Clase que representa un usuario registrado en la aplicación.
class Usuario {
  int? id; // Identificador único del usuario
  String? nombreUsuario; // Nombre de usuario del usuario
  String? correoElectronico; // Correo electrónico del usuario

  /// Constructor de la clase Usuario.
  ///
  /// [id] es el identificador único del usuario.
  /// [nombreUsuario] es el nombre de usuario del usuario.
  /// [correoElectronico] es el correo electrónico del usuario.
  Usuario(this.id, this.nombreUsuario, this.correoElectronico);
}
