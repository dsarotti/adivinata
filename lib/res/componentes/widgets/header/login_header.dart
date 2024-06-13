import 'package:adivinata/actividades/adivinata/servicio/adivinata_servicio.dart';
import 'package:adivinata/actividades/menu_principal/controlador/controlador_menu_principal.dart';
import 'package:adivinata/res/colores.dart';
import 'package:adivinata/res/componentes/componentes_estaticos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.log("RUTA: ${Get.currentRoute}");
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [ComponentesEstaticos.sombraContainersDefault],
        color: Get.theme.colorScheme.inversePrimary,
        borderRadius: const BorderRadius.only(
          bottomLeft: ComponentesEstaticos.radioContenedor,
          bottomRight: ComponentesEstaticos.radioContenedor,
        ),
      ),
      height: 120,
      width: Get.width,
      child: Row(
        children: [
          if(!["menu_principal","inicio_sesion","/registro"].contains(Get.currentRoute))
            ...{
             Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: ComponentesEstaticos.radioContenedor),
                      color: Colores.acierto,
                    ),
                    child: const Icon(size: 45, color: Colores.primarioClaro, Icons.arrow_back),
                  ),
                ),
              )
            },
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                      size: 70,
                      color: Colores.primarioOscuro,
                      Icons.account_box),
                ),
                Text(
                  Get.find<ControladorMenuPrincipal>().usuario.nombreUsuario!,
                  style: const TextStyle(
                    color: Colores.primarioOscuro,
                    fontSize: 50,
                    shadows: [ComponentesEstaticos.sombraTextoFino],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex:1,
            //TODO: Convertir este container en un InkWell para cerrar sesión
            child: InkWell(
              onTap: () {
                  Get.find<AdivinataServicio>().logout();
              },
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: ComponentesEstaticos.radioContenedor),
                  color: Colores.acierto,
                ),
                child: const Icon(
                  size: 45,
                  color: Colores.primarioClaro,
                    Icons.logout),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
