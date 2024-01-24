import 'package:adivinata/actividades/autenticacion/widgets/formulario_inicio_sesion/formulario_inicio_sesion.dart';
import 'package:adivinata/actividades/autenticacion/widgets/login_header.dart';
import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colores.dart';
import '../../res/componentes/componentes_estaticos.dart';

class ActividadMenuPrincipal extends StatelessWidget {
  const ActividadMenuPrincipal({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderApp(),
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
          ],
        ),
      ),
    );
  }
}
