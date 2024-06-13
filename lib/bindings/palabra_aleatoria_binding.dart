import 'package:adivinata/actividades/partidas/controlador_partida/controlador_palabra_aleatoria.dart';
import 'package:get/get.dart';

class PalabraAleatoriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControladorPalabraAleatoria>(ControladorPalabraAleatoria(),
        permanent: false);
  }


}
