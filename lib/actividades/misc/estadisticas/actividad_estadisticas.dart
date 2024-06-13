import 'package:adivinata/res/componentes/widgets/header/login_header.dart';
import 'package:adivinata/res/componentes/widgets/navbar/footer_navbar.dart';
import 'package:flutter/material.dart';

class ActividadEstadisticas extends StatelessWidget {
  const ActividadEstadisticas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterNavbar(),
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: Column(
          children: [
            HeaderApp(),
          ],
        ),
      ),
    );
  }
}
