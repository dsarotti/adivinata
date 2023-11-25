import 'package:flutter/material.dart';

final class ComponentesEstaticos{
  static const Shadow sombraDefault = Shadow(blurRadius: 8,color: Colors.black45,offset: Offset(0.2, 0.3));
  static const Shadow sombraTextoFino = Shadow(blurRadius: 6,color: Colors.black45,offset: Offset(0.5, 0.5));
  static const BoxShadow sombraContainersDefault = BoxShadow(blurRadius: 8,color: Colors.black45,offset: Offset(0.3, 0.3));
  static const Radius radioDefault = Radius.circular(20);
  static const EdgeInsetsGeometry verticalMarginDefault = EdgeInsets.symmetric(vertical: 40);
  static const EdgeInsetsGeometry paddingDefault = EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 20);
  const ComponentesEstaticos._();

}