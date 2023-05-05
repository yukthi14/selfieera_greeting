import 'package:flutter/material.dart';
Color primaryColor = const Color(0xFFCADCED);
List<BoxShadow> coustomShadow=[
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: const Offset(-5,-5),
      blurRadius: 50
  ),
  BoxShadow(
      color: Colors.blue.withOpacity(.2),
      spreadRadius: 2,
      offset: const Offset(7,7),
      blurRadius: 10
  ),
];