import 'package:flutter/material.dart';
import '../../componentes_estaticos.dart';

class BotonTextoInterno extends StatelessWidget {
  const BotonTextoInterno(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        style: const TextStyle(
          fontFamily: "Alice",
          fontSize: 25,
          shadows: [ComponentesEstaticos.sombraTextoFino],
        ),
        text,
      ),
    );
  }
}
