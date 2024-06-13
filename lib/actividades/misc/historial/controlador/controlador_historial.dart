import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:adivinata/model/partida.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/colores.dart';
import '../../../../res/componentes/componentes_estaticos.dart';

class ControladorHistorial extends GetxController{
  RxList<Widget> widgetList =  <Widget>[].obs;


  buildListaPartidas(List<Partida> partidas){
    for (Partida partida in partidas){
      widgetList.addAll ([
            Text(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colores.primarioOscuro,
                  fontSize: 25,
                  shadows: [ComponentesEstaticos.sombraTextoFino],
                ),
                "id partida: ${partida.id}"),
            Text(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colores.primarioOscuro,
                  fontSize: 25,
                  shadows: [ComponentesEstaticos.sombraTextoFino],
                ),
                "palabra:  ${partida.palabra}"),
            Text(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colores.primarioOscuro,
                  fontSize: 25,
                  shadows: [ComponentesEstaticos.sombraTextoFino],
                ),
                "intentos:  ${partida.intentos}"),
            Container(height:1 ,width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colores.primarioOscuro)
              ),
            )
          ],
      );
    }
  }
  @override
  void onInit() async {
    List<Partida> partidas = await Get.find<AdivinataServicio>().dbHelper.getPartidasList();
    buildListaPartidas(partidas);
    super.onInit();
  }

  // @override
  // void onClose() {
  //   widgetList.clear();
  //   super.onClose();
  // }
}