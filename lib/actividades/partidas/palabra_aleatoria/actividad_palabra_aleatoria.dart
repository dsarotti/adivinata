import 'package:adivinata/actividades/partidas/palabra_aleatoria/controlador/controlador_palabra_aleatoria.dart';
import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActividadPalabraAleatoria extends StatelessWidget {
  ActividadPalabraAleatoria({super.key});
 ControladorPalabraAleatoria controlador = Get.find<ControladorPalabraAleatoria>();
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
                Get.find<ControladorPalabraAleatoria>()
                    .palabrasIntroducidas
                    .value;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < Get.find<ControladorPalabraAleatoria>().palabraAleatoria.length; i++)
//                Get.find<ControladorPalabraAleatoria>().palabraAleatoria.length > i ? Get.find<ControladorPalabraAleatoria>().palabraAleatoria[i] : '';
                            (){
                              controlador.palabraActual.text.length> i? controlador.palabraActual.text[i]:"";
                            return Container(
                              width:40,
                              child: TextField(
                                controller: controlador.palabraActual,
                                readOnly: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                            }()
                            ,
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
                    ),
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
