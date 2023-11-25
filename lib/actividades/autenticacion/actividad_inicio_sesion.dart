import 'package:adivinata/actividades/autenticacion/controlador_formulario.dart';
import 'package:adivinata/actividades/autenticacion/login_header.dart';
import 'package:adivinata/res/colores.dart';
import 'package:adivinata/res/componentes/componentes_estaticos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActividadInicioSesion extends StatelessWidget {
  const ActividadInicioSesion({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            const LoginHeader(),
            Container(
              decoration: const BoxDecoration(
                color: Colores.primarioClaro,
                boxShadow: [ComponentesEstaticos.sombraContainersDefault],
                borderRadius: BorderRadius.all(ComponentesEstaticos.radioDefault),
              ),
              margin: ComponentesEstaticos.verticalMarginDefault,
              padding: ComponentesEstaticos.paddingDefault,
              width: Get.width*0.9,
              constraints: const BoxConstraints(
                minWidth: 200,
              ),
              child: Column(
                children: [
                  const Text(
                      style: TextStyle(
                        fontFamily: "Alice",
                        color: Colores.primarioOscuro,
                        fontSize: 40,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                        shadows: [ComponentesEstaticos.sombraTextoFino],
                      ),
                      "Iniciar sesión"),
                  Padding(
                    padding: ComponentesEstaticos.paddingDefault,
                    child: TextFormField(
                      autocorrect: false,
                      controller: Get.find<ControladorFormularioLogin>().controllerUsuario,
                      decoration: const InputDecoration(
                        labelText: "Usuario",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: ComponentesEstaticos.paddingDefault,
                    child: TextFormField(
                      controller: Get.find<ControladorFormularioLogin>().controllerPass,
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
