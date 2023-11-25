import 'package:adivinata/actividades/autenticacion/controlador_formulario.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<ControladorFormularioLogin>(ControladorFormularioLogin(), permanent: false);
  }
}