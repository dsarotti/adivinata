import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.inversePrimary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      height: 120,
      width: Get.width,
      child: const FittedBox(
        child: Text(
          "@divinata",
          style: TextStyle(
              fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}
