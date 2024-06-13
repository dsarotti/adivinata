import 'package:adivinata/model/usuario.dart';
import 'package:adivinata/model/usuario_app.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';

class AdivinataServicio extends GetxService {
  final DatabaseHelper dbHelper = DatabaseHelper();


  Future<bool> iniciarSesion(String nombreUsuario, String pass) async {
    int? id = await dbHelper.login(nombreUsuario, pass);
    if (id != null) {
      Usuario? usuario = await dbHelper.getUsuario(id);
      if (usuario != null) {
        UsuarioApp().id=id;
        UsuarioApp().nombreUsuario= usuario.nombreUsuario;
        UsuarioApp().correoElectronico = usuario.correoElectronico;
        return true;
      }
    }
    return false;
  }

  Future<bool> registrarse (Usuario usuario, pass) async {
    return await dbHelper.registro(usuario, pass);
  }

  logout() {
    UsuarioApp().id=null;
    UsuarioApp().nombreUsuario=null;
    UsuarioApp().correoElectronico = null;
    Get.offAllNamed("/inicio_sesion");
  }



}