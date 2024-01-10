import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controlador/controlador_formulario_registro.dart';
import '../../../../../res/colores.dart';
import '../../../../../res/componentes/componentes_estaticos.dart';

class CampoUsuarioRegistro extends StatelessWidget {
  const CampoUsuarioRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    ControladorFormularioRegistro controlador =
        Get.find<ControladorFormularioRegistro>();
    return TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
      controller: controlador.controllerUsuario,
      style: const TextStyle(
        color: Colores.acierto,
      ),
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "Usuario",
        labelStyle: TextStyle(
          color: Colores.textoSobreClaro,
          fontSize: 30,
        ),
        floatingLabelStyle: TextStyle(
            color: Colores.primarioOscuro,
            shadows: [ComponentesEstaticos.sombraTextoFino]),
        border: OutlineInputBorder(
          borderRadius: ComponentesEstaticos.borderRadiusInterno,
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.account_circle,
          size: 40,
          color: Colores.primarioOscuro,
        ),
      ),
    );
  }
}
