import 'package:adivinata/actividades/menu_principal/controlador/controlador_menu_principal.dart';
import 'package:get/get.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControladorMenuPrincipal>(ControladorMenuPrincipal(),
        permanent: true);
  }
}
