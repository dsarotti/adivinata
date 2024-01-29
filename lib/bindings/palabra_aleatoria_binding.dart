import 'package:adivinata/actividades/menu_principal/controlador/controlador_menu_principal.dart';
import 'package:adivinata/actividades/partidas/palabra_aleatoria/controlador/controlador_palabra_aleatoria.dart';
import 'package:get/get.dart';

class PalabraAleatoriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControladorPalabraAleatoria>(ControladorPalabraAleatoria(),
        permanent: false);
  }


}
