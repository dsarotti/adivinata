import 'package:adivinata/actividades/partidas/controlador_partida/controlador_palabra_aleatoria.dart';
import 'package:adivinata/actividades/partidas/palabra_aleatoria_tiempo/controlador/controlador_tiempo.dart';
import 'package:get/get.dart';

class PalabraAleatoriaTiempoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControladorPalabraAleatoria>(ControladorPalabraAleatoria(), permanent: false);
    Get.put<ControladorTiempo>(ControladorTiempo(),permanent: false);
  }


}
