class UsuarioApp {
  int? id;
  String? nombreUsuario;
  String? correoElectronico;
  static final UsuarioApp _instancia = UsuarioApp._privateConstructor();

  // Constructor privado para evitar instancias directas
  UsuarioApp._privateConstructor();

  factory UsuarioApp() {
    return _instancia;
  }

  void olvidar(){
    nombreUsuario=null;
    correoElectronico=null;
  }
}
