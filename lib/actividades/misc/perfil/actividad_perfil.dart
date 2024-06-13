import 'package:adivinata/model/usuario_app.dart';
import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:adivinata/res/componentes/widgets/navbar/footer_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colores.dart';
import '../../../res/componentes/componentes_estaticos.dart';

class ActividadPerfil extends StatelessWidget {
  const ActividadPerfil({super.key});

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
                    "Tu perfil"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colores.primarioOscuro,
                                    fontSize: 25,
                                    shadows: [ComponentesEstaticos.sombraTextoFino],
                                  ),
                                  "Nombre: ${UsuarioApp().nombreUsuario}"),
                              Text(
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colores.primarioOscuro,
                                    fontSize: 25,
                                    shadows: [ComponentesEstaticos.sombraTextoFino],
                                  ),
                                  "Apellidos:  ${UsuarioApp().apellidos??"n/a"}"),
                              Text(
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colores.primarioOscuro,
                                    fontSize: 25,
                                    shadows: [ComponentesEstaticos.sombraTextoFino],
                                  ),
                                  "Email:  ${UsuarioApp().correoElectronico}"),
                          ],
                          ),
                        ),
                      ],
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
