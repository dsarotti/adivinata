import 'package:adivinata/actividades/partidas/controlador_partida/controlador_palabra_aleatoria.dart';
import 'package:adivinata/actividades/partidas/palabra_aleatoria_tiempo/controlador/controlador_tiempo.dart';
import 'package:adivinata/res/componentes/widgets/botones/boton_texto_interno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VictoriaTiempoDialog extends StatelessWidget {
  const VictoriaTiempoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ControladorTiempo>().detenerCuentaAtras();
    return SimpleDialog(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.celebration_outlined,
                color: Colors.yellow,
                size: 40,
              ),
              Text(
                "Victoria!",
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                Icons.celebration_outlined,
                color: Colors.yellow,
                size: 40,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "¡Enhorabuena, has acertado!",
                style: TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                "¡En ${60 - Get.find<ControladorTiempo>().tiempoRestante.value} segundos!",
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const Text(
                "Te echas otra?",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BotonTextoInterno(
              text: "Si",
              onPressed: () {
                Get.find<ControladorPalabraAleatoria>().reiniciarPartidaDesdeDialogo();
                Get.find<ControladorTiempo>().reiniciarCuentaAtras();
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BotonTextoInterno(
              text: "No",
              onPressed: () {
                Get.find<ControladorTiempo>().reiniciarCuentaAtras();
                Get.find<ControladorPalabraAleatoria>().salirAlMenu();
              }),
        ),
      ],
    );
  }
}
