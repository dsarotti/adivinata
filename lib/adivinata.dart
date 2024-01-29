import 'package:adivinata/actividades/menu_principal/actividad_menu_principal.dart';
import 'package:adivinata/actividades/partidas/palabra_aleatoria/actividad_palabra_aleatoria.dart';
import 'package:adivinata/bindings/menu_binding.dart';
import 'package:adivinata/bindings/palabra_aleatoria_binding.dart';
import 'package:adivinata/model/usuario_app.dart';
import 'package:adivinata/res/componentes/componentes_estaticos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'actividades/autenticacion/actividad_inicio_sesion.dart';
import 'actividades/registro/actividad_registro.dart';
import 'bindings/login_binding.dart';
import 'bindings/registro_binding.dart';
import 'res/colores.dart';

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
        GetPage(
          name: '/registro',
          page: () => const ActividadRegistro(),
          title: 'Registro',
          binding: RegistroBinding(),
        ),
        GetPage(
          name: '/menu_principal',
          page: () => const ActividadMenuPrincipal(),
          title: 'Menu principal',
          binding: MenuBinding(),
        ),
        GetPage(
          name: '/palabra_aleatoria',
          page: () => ActividadPalabraAleatoria(),
          title: 'Palabra Aleatoria',
          binding: PalabraAleatoriaBinding(),
        ),
      ],
      //TODO: si hay usuario con sesion iniciada ir directamente al menu (implementar shared_preferences)
      initialRoute: UsuarioApp().nombreUsuario==null?'/inicio_sesion':'menu_principal',
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
          onSurface: Colores.primarioClaro,
        ),
        fontFamily: 'Alice',
        scaffoldBackgroundColor: Colores.fondo,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(5.0),
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
        ),
      ),
    );
  }
}
