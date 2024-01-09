import 'bindings/login_binding.dart';
import 'bindings/registro_binding.dart';
import 'res/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'actividades/autenticacion/actividad_inicio_sesion.dart';
import 'actividades/registro/actividad_registro.dart';

class Adivinata extends StatelessWidget {
  const Adivinata({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/inicio_sesion',
          page: () => const ActividadInicioSesion(),
          title: 'Adivinata',
          binding: LoginBinding(),
        ),
        GetPage (
          name: '/registro',
          page: () => const ActividadRegistro(),
          title: 'Registro',
          binding: RegistroBinding(),
        ),
      ],
      initialRoute: '/inicio_sesion',
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colores.primarioOscuro,
            onPrimary: Colores.primarioClaro,
            inversePrimary: Colores.primarioClaro,
            secondary: Colores.primarioClaro,
            onSecondary: Colores.primarioOscuro,
            error: Colores.fallo,
            onError: Colores.fallo,
            background: Colores.fondo,
            onBackground: Colores.fondo,
            surface: Colores.primarioOscuro,
            onSurface: Colores.primarioClaro),
        fontFamily: 'Alice',
      ),
    );
  }
}
