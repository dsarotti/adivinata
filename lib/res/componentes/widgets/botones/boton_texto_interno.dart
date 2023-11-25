import 'package:flutter/material.dart';
import '../../../colores.dart';
import '../../componentes_estaticos.dart';

class BotonTextoInterno extends StatelessWidget {
  const BotonTextoInterno(
      {super.key, required this.texto, required this.onPressed});

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
          const RoundedRectangleBorder(
              borderRadius: ComponentesEstaticos.borderRadiusInterno),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 50),
        ),
      ),
      onPressed: () => {FocusScope.of(context).unfocus(), onPressed},
      child: Text(
        style: const TextStyle(
          fontFamily: "Alice",
          fontSize: 25,
          shadows: [ComponentesEstaticos.sombraTextoFino],
        ),
        texto,
      ),
    );
  }
}
