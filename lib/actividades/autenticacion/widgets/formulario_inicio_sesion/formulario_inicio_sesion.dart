import 'package:adivinata/actividades/autenticacion/controlador/controlador_formulario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'campos/campo_usuario.dart';
import 'campos/campo_pass.dart';
import '../../../../res/componentes/widgets/botones/boton_texto_interno.dart';
import '../../../../res/colores.dart';
import '../../../../res/componentes/componentes_estaticos.dart';

class FormularioInicioSesion extends StatelessWidget {
  const FormularioInicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
            style: TextStyle(
              color: Colores.primarioOscuro,
              fontSize: 40,
              shadows: [ComponentesEstaticos.sombraTextoFino],
            ),
            "Iniciar sesión"),
        const Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: CampoUsuario(),
        ),
        const Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: CampoPass(),
        ),
        Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: BotonTextoInterno(
            text: "Iniciar sesión",
            onPressed: () => {Get.find<ControladorFormularioLogin>().logIn()},
          ),
        ),
      ],
    );
  }
}
