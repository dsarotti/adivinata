import 'package:adivinata/actividades/registro/controlador/controlador_formulario_registro.dart';
import 'package:get/get.dart';

class RegistroBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControladorFormularioRegistro>(ControladorFormularioRegistro(), permanent: false);
  }
}
