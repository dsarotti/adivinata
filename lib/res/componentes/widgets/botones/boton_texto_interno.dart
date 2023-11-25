import 'package:flutter/material.dart';

import '../../../colores.dart';
import '../../componentes_estaticos.dart';

class BotonTextoInterno extends StatelessWidget {
  const BotonTextoInterno({super.key,required this.texto, required this.onPressed});

  final String texto;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Colores.primarioClaro,
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Colores.acierto,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(borderRadius: ComponentesEstaticos.borderRadiusInterno),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        style: const TextStyle(
          fontFamily: "Alice",
          fontSize: 30,
          shadows: [ComponentesEstaticos.sombraTextoFino],
        ),
        texto,
      ),
    );
  }
}
