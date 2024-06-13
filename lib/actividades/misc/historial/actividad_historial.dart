import 'package:adivinata/actividades/misc/historial/controlador/controlador_historial.dart';
import 'package:adivinata/res/colores.dart';
import 'package:adivinata/res/componentes/componentes_estaticos.dart';
import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:adivinata/res/componentes/widgets/navbar/footer_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActividadHistorial extends StatelessWidget {
  const ActividadHistorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterNavbar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderApp(),
            Container(
              decoration: const BoxDecoration(
                color: Colores.primarioClaro,
                boxShadow: [ComponentesEstaticos.sombraContainersDefault],
                borderRadius: ComponentesEstaticos.borderRadiusContenedor,
              ),
              margin: ComponentesEstaticos.paddingDefault,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: Get.width * 0.9,
              constraints: const BoxConstraints(
                minWidth: 200,
              ),
              child:  Column(
                children: [const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colores.primarioOscuro,
                      fontSize: 40,
                      shadows: [ComponentesEstaticos.sombraTextoFino],
                    ),
                    "Historial"),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Obx(() {
                      Get.find<ControladorHistorial>().widgetList.length;
                      return SizedBox(
                        width: context.width,
                        height: context.height/2,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                              Get.find<ControladorHistorial>().widgetList,
                          ),
                        ),
                      );
                    }
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
