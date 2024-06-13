import 'package:adivinata/actividades/menu_principal/controlador/controlador_menu_principal.dart';
import 'package:adivinata/res/colores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      decoration: const ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: ()=> Get.toNamed("/perfil"),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colores.primarioOscuro,
                  ),
                  Text(
                    "Perfil",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colores.primarioOscuro,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: ()=> Get.toNamed("historial"),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 50,
                    color: Colores.primarioOscuro,
                  ),
                  Text(
                    "Historial",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colores.primarioOscuro,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: ()=> Get.find<ControladorMenuPrincipal>().compartir(),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.share,
                    size: 50,
                    color: Colores.primarioOscuro,
                  ),
                  Text(
                    "Compartir",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colores.primarioOscuro,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
