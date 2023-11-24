import 'package:adivinata/res/colores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'actividades/autenticacion/home_screen.dart';

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
          name: '/home_screen',
          page: () => const HomeScreen(),
          title: 'Adivinata',
        ),
      ],
      initialRoute: '/home_screen',
      debugShowCheckedModeBanner: false,
      title:'Adivinata',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colores.primarioOscuro,
            onPrimary: Colores.primarioOscuro,
            inversePrimary: Colores.primarioClaro,
            secondary: Colores.primarioClaro,
            onSecondary: Colores.primarioClaro,
            error: Colores.fallo,
            onError: Colores.fallo,
            background: Colores.fondo,
            onBackground: Colores.fondo,
            surface: Colores.primarioOscuro,
            onSurface: Colores.primarioOscuro
        ),
        fontFamily: 'Alice',
      ),
    );
  }
}
