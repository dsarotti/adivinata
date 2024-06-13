import 'package:flutter/material.dart';

final class ComponentesEstaticos{
  ///sombras
  static const Shadow sombraDefault = Shadow(blurRadius: 8,color: Colors.black45,offset: Offset(0.3, 0.3));
  static const Shadow sombraTextoFino = Shadow(blurRadius: 4,color: Colors.black45,offset: Offset(1, 1));
  static const BoxShadow sombraContainersDefault = BoxShadow(blurRadius: 8,color: Colors.black45,offset: Offset(3, 3));

  ///radios
  static const Radius radioContenedor = Radius.circular(20);
  static const Radius radioInterno = Radius.circular(10);
  static const BorderRadius borderRadiusContenedor = BorderRadius.all(radioContenedor);
  static const BorderRadius borderRadiusInterno = BorderRadius.all(radioInterno);

  ///paddings y margins
  static const EdgeInsetsGeometry verticalMarginDefault = EdgeInsets.symmetric(vertical: 40);
  static const EdgeInsetsGeometry paddingDefault = EdgeInsets.only(bottom: 10,left: 10,right: 10,top: 20);
  static const EdgeInsetsGeometry paddingHorizontalBody = EdgeInsets.symmetric(horizontal: 40);
  static const EdgeInsetsGeometry paddingBody = EdgeInsets.only(top:40,left:40,right:40);

  ///clase no instanciable
  const ComponentesEstaticos._();

}