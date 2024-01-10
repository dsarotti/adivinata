import 'package:adivinata/actividades/registro/formulario_registro/forumario_registro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colores.dart';
import '../../res/componentes/componentes_estaticos.dart';
import '../autenticacion/widgets/login_header.dart';

class ActividadRegistro extends StatelessWidget {
  const ActividadRegistro({super.key});

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
                child: const Column(
                  children: [
                    FormularioRegistro(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
