import 'package:flutter/material.dart';

class ColorsApp {
  static const primaryColor = Colors.black;
  static final secundaryColor = Colors.grey[900];
  static const appBarColor = Colors.black87;
  static const textColor = Colors.white;
  static const actionsTextColor = Colors.black;
  static const xboxColor = Colors.green;
  static const psColor = Colors.blue;
  static const pcColor = Colors.red;
  LinearGradient liner(color1, color2){
    return  LinearGradient(
      colors: <Color>[color1, color2],
    );
  }
}
