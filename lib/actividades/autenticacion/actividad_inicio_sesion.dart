import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';

import '../../res/componentes/widgets/botones/boton_texto_interno.dart';
import 'widgets/formulario_inicio_sesion/formulario_inicio_sesion.dart';
import 'widgets/login_header.dart';
import '../../res/colores.dart';
import '../../res/componentes/componentes_estaticos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActividadInicioSesion extends StatelessWidget {
  const ActividadInicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const LoginHeader(),
            Padding(
              padding: ComponentesEstaticos.paddingBody,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colores.primarioClaro,
                  boxShadow: [ComponentesEstaticos.sombraContainersDefault],
                  borderRadius: ComponentesEstaticos.borderRadiusContenedor,
                ),
                padding: ComponentesEstaticos.paddingDefault,
                width: Get.width * 0.9,
                constraints: const BoxConstraints(
                  minWidth: 200,
                ),
                child: const FormularioInicioSesion(),
              ),
            ),
            Padding(
              padding: ComponentesEstaticos.paddingBody,
              child: Row(
                children: [
                  Expanded(
                    child: BotonTextoInterno(
                      text: "Registrarse",
                      onPressed: ((){Get.toNamed('/registro');}),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: ComponentesEstaticos.paddingBody,
              child: Row(
                children: [
                  Expanded(
                    child: BotonTextoInterno(
                      text: "Olvidé mi contraseña",
                      onPressed: () => Get.find<AdivinataServicio>().dbHelper.borrardb(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
