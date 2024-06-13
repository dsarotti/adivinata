import 'package:adivinata/res/componentes/widgets/botones/boton_seleccion_juego.dart';
import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:adivinata/res/componentes/widgets/navbar/footer_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActividadMenuPrincipal extends StatelessWidget {
  const ActividadMenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterNavbar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderApp(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BotonSeleccionjuego(
                            texto: "Partida clásica",
                            icono: Icons.text_fields,
                            onPressed: () => Get.toNamed('/palabra_aleatoria'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BotonSeleccionjuego(texto: "Contrarreloj", icono: Icons.timer, onPressed: () => {Get.toNamed('/palabra_aleatoria_tiempo')}),
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
