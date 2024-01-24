import 'package:adivinata/actividades/menu_principal/controlador/controlador_menu_principal.dart';
import 'package:adivinata/res/componentes/componentes_estaticos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.account_box),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Get.find<ControladorMenuPrincipal>().usuario.nombreUsuario!),
          )
        ],
      )
    );
  }
}