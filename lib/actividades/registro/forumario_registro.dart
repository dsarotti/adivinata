import 'package:flutter/material.dart';
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
              letterSpacing: 2,
              shadows: [ComponentesEstaticos.sombraTextoFino],
            ),
            "Iniciar sesión"),
        const Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: CampoUsuario(),
        ),
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
            texto: "Iniciar sesión",
            onPressed: () => {},
          ),
        ),
      ],
    );
  }
}
