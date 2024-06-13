import 'package:get/get.dart';
import '../actividades/misc/historial/controlador/controlador_historial.dart';

class HistorialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControladorHistorial>(ControladorHistorial(), permanent: false);
  }
}