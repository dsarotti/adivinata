import 'package:adivinata/model/usuario_app.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class ControladorMenuPrincipal extends GetxController{
  UsuarioApp usuario = UsuarioApp();

  compartir(){
      Share.share('juegazo https://enlace-a-playstore.com', subject: 'Mira lo que hice!');
  }
}