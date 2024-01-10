import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controlador/controlador_formulario_registro.dart';
import '../../../../../res/colores.dart';
import '../../../../../res/componentes/componentes_estaticos.dart';

class CampoPassRegistro extends StatelessWidget {
  const CampoPassRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    ControladorFormularioRegistro controlador = Get.find<ControladorFormularioRegistro>();
    return Obx(
      () => TextFormField(
        obscureText: controlador.mostrarPass.value,
        autocorrect: false,
        controller: controlador.controllerPass,
        style: const TextStyle(
          color: Colores.acierto,
        ),
        decoration: InputDecoration(
          prefixIconColor: Colores.primarioClaro,
          fillColor: Colors.white,
          filled: true,
          labelText: "Contraseña",
          labelStyle: const TextStyle(
            color: Colores.textoSobreClaro,
            fontSize: 30,
          ),
          floatingLabelStyle: const TextStyle(
              color: Colores.primarioOscuro,
              shadows: [ComponentesEstaticos.sombraTextoFino],
          ),
          border: const OutlineInputBorder(
            borderRadius: ComponentesEstaticos.borderRadiusInterno,
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.lock,
            size: 40,
            color: Colores.primarioOscuro,
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
