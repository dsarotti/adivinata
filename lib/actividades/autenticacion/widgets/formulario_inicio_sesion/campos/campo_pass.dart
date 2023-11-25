import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controladores/controlador_formulario.dart';
import '../../../../../res/colores.dart';
import '../../../../../res/componentes/componentes_estaticos.dart';

class CampoPass extends StatelessWidget {
  const CampoPass({super.key});

  @override
  Widget build(BuildContext context) {
    ControladorFormularioLogin controlador =
        Get.find<ControladorFormularioLogin>();
    return Obx(
      () => TextFormField(
        obscureText: controlador.mostrarPass.value,
        autocorrect: false,
        controller: controlador.controllerPass,
        decoration: InputDecoration(
          prefixIconColor: Colores.primarioClaro,
          fillColor: Colors.white,
          filled: true,
          labelText: "Contraseña",
          labelStyle: const TextStyle(
            color: Colores.textoGris,
            fontSize: 30,
          ),
          floatingLabelStyle: const TextStyle(
              color: Colores.primarioOscuro,
              shadows: [ComponentesEstaticos.sombraTextoFino]),
          border: const OutlineInputBorder(
            borderRadius: ComponentesEstaticos.borderRadiusInterno,
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.lock,
            size: 40,
            color: Colores.textoGris,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controlador.mostrarPass.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              controlador.switchMostrarPass();
            },
          ),
        ),
      ),
    );
  }
}
