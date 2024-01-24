import 'package:adivinata/res/componentes/componentes_estaticos.dart';
import 'package:flutter/material.dart';

class BotonSeleccionjuego extends StatelessWidget {
  const BotonSeleccionjuego({super.key, required this.texto, required this.icono, required this.onPressed});
  final String texto;
  final IconData icono;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff455243),
          boxShadow: const [ComponentesEstaticos.sombraContainersDefault],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              texto,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(

                fontSize: 20,
                fontWeight: FontWeight.w500,
                shadows: [ComponentesEstaticos.sombraTextoFino]
              ),
            ),
            Icon(
                icono,
              size: 45,
              shadows: const [ComponentesEstaticos.sombraTextoFino],
            ),
          ],
        ),
      ),
    );
  }
}
