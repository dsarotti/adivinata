import '../../../res/componentes/componentes_estaticos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

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
      child: const FittedBox(
        child: Text(
          "Adivinata",
          style: TextStyle(
              fontWeight: FontWeight.w900,
            fontFamily: "Alice",
            shadows: [ComponentesEstaticos.sombraDefault],
          ),
        ),
      ),
    );
  }
}
