import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:get/get.dart';

class AdivinataServicioBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdivinataServicio>(AdivinataServicio(), permanent: true);
  }
}
