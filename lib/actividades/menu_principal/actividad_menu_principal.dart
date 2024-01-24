import 'package:adivinata/res/componentes/widgets/botones/boton_seleccion_juego.dart';
import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:flutter/material.dart';

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
                          texto: "Palabra Aleatoria",
                          icono: Icons.today,
                          onPressed: () => {
                            //TODO: ir a juego Palabra Aleatoria
                          }),
                      BotonSeleccionjuego(
                          texto: "Temas",
                          icono: Icons.book_sharp,
                          onPressed: () => {
                            //TODO: ir a juego Temas
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BotonSeleccionjuego(
                          texto: "Contrarreloj",
                          icono: Icons.timer,
                          onPressed: () => {
                            //TODO: ir a juego Contrarrelog
                          }),
                      BotonSeleccionjuego(
                          texto: "Anagrama",
                          icono: Icons.compare_arrows,
                          onPressed: () => {
                            //TODO: ir a juego Anagrama
                          }),
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
