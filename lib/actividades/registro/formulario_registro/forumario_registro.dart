import 'package:adivinata/actividades/registro/campos/campo_email_registro.dart';
import 'package:flutter/material.dart';
import '../campos/campo_usuario_registro.dart';
import '../campos/campo_pass_registro.dart';
import '../../../../../res/componentes/widgets/botones/boton_texto_interno.dart';
import '../../../../../res/colores.dart';
import '../../../../../res/componentes/componentes_estaticos.dart';

class FormularioRegistro extends StatelessWidget {
  const FormularioRegistro({super.key});

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
            "Registrarse"),
        const Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: CampoUsuarioRegistro(),
        ),
        const Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: CampoEmailRegistro(),
        ),
        const Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: CampoPassRegistro(),
        ),
        Padding(
          padding: ComponentesEstaticos.paddingDefault,
          child: BotonTextoInterno(
            texto: "Enviar",
            onPressed: () => {
              //TODO: botón enviar datos de registro
            },
          ),
        ),
      ],
    );
  }
}
