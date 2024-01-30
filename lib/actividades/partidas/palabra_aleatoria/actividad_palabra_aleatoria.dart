import 'package:adivinata/actividades/partidas/palabra_aleatoria/controlador/controlador_palabra_aleatoria.dart';
import 'package:adivinata/res/colores.dart';
import 'package:adivinata/res/componentes/componentes_estaticos.dart';
import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActividadPalabraAleatoria extends StatelessWidget {
  ActividadPalabraAleatoria({super.key});
  final ControladorPalabraAleatoria controlador = Get.find<ControladorPalabraAleatoria>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderApp(),
            Expanded(
              child: Obx(() {
                controlador.palabrasIntroducidas.value;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      ///establece el color de esta letra dependiendo del acierto o fallo
                      child: Text(
                        controlador.palabraAleatoria,
                        style: const TextStyle(
                          fontSize: 60,
                        ),
                      ),
                    ),
                    for (int i = controlador.palabrasIntroducidas.length - 1; i >= 0; i--)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              (i + 1).toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colores.primarioOscuro,
                                shadows: [ComponentesEstaticos.sombraTextoFino],
                              ),
                            ),
                          ),
                          for (int j = 0; j < controlador.palabrasIntroducidas[i].length; j++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2),
                              child: Container(
                                width: 40,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: ComponentesEstaticos.borderRadiusContenedor,
                                  boxShadow: [ComponentesEstaticos.sombraContainersDefault],

                                  ///establece el color del fondo dependiendo del acierto o fallo
                                  color: controlador.palabrasIntroducidas[i][j] ==
                                          (j < controlador.palabraAleatoria.length
                                              ? controlador.palabraAleatoria[j]
                                              : null)
                                      ? Colores.acierto
                                      : controlador.palabraAleatoria
                                              .contains(controlador.palabrasIntroducidas[i][j])
                                          ? Colores.aciertoParcial
                                          : Colores.fallo,
                                ),
                                child: Center(
                                  child: Text(
                                    controlador.palabrasIntroducidas[i][j],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 40,

                                      ///establece el color de esta letra fondo dependiendo del acierto o fallo
                                      color: controlador.palabrasIntroducidas[i][j] ==
                                              (j < controlador.palabraAleatoria.length
                                                  ? controlador.palabraAleatoria[j]
                                                  : null)
                                          ? Get.theme.colorScheme.inversePrimary
                                          : Colores.primarioOscuro,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
                        autocorrect: false,
                        controller: controlador.palabraActual,
                        onSubmitted: (value) => controlador.submit(value),
                        maxLength: controlador.palabraAleatoria.length,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colores.primarioOscuro,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          fillColor: Colores.primarioClaro,
                          filled: true,
                          hintText: "${controlador.palabraAleatoria.length} letras",
                          hintStyle: const TextStyle(
                            color: Colores.textoGris,
                            fontSize: 30,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: ComponentesEstaticos.borderRadiusInterno,
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
