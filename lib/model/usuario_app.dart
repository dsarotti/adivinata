class UsuarioApp {
  String? nombreUsuario;
  String? correoElectronico;
  static final UsuarioApp _instancia = UsuarioApp._privateConstructor();

  // Constructor privado para evitar instancias directas
  UsuarioApp._privateConstructor();


  factory UsuarioApp() {
    return _instancia;
  }

  // Métodos para establecer y obtener información del usuario
  void setUsuario(String nombreUsuario, String correoElectronico) {
    this.nombreUsuario = nombreUsuario;
    this.correoElectronico = correoElectronico;
  }

  String? getNombreUsuario() {
    return nombreUsuario;
  }

  String? getCorreoElectronico() {
    return correoElectronico;
  }
}
