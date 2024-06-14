import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:adivinata/model/partida.dart';
import 'package:adivinata/model/usuario_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/colores.dart';
import '../../../../res/componentes/componentes_estaticos.dart';

/// ControladorHistorial es una clase que extiende GetxController
/// y gestiona la lógica para mostrar el historial de partidas de un usuario.
///
/// Esta clase proporciona funcionalidades para:
/// - Construir una lista de widgets que representan las partidas.
/// - Filtrar las partidas del usuario actual.
/// - Inicializar la lista de partidas al iniciar el controlador.
class ControladorHistorial extends GetxController {
  /// Lista observable de widgets que representan las partidas.
  RxList<Widget> widgetList = <Widget>[].obs;

  /// Construye una lista de widgets a partir de una lista de partidas.
  ///
  /// @param partidas La lista de partidas a mostrar.
  void buildListaPartidas(List<Partida> partidas) {
    for (Partida partida in partidas) {
      widgetList.addAll([
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
            "id usuario: ${partida.usuarioId}"),
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
        Container(
          height: 1,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colores.primarioOscuro)
          ),
        ),
      ]);
    }
  }

  @override
  void onInit() async {
    // Obtiene la lista de partidas desde el servicio.
    List<Partida> partidas = await Get.find<AdivinataServicio>().dbHelper.getPartidasList();

    // Filtra las partidas para que solo incluyan las del usuario actual.
    partidas.removeWhere((partida) => partida.usuarioId != UsuarioApp().id);

    // Construye la lista de widgets a partir de las partidas filtradas.
    buildListaPartidas(partidas);

    super.onInit();
  }
}
