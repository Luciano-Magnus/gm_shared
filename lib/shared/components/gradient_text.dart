import 'package:flutter/material.dart';
import 'package:gm_shared/app/utils/colors/colors_app.dart';
import 'package:gradient_text/gradient_text.dart';

class GradientTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double paddignLeft;
  final double paddignTop;
  final double paddignBottom;
  final double paddignRight;
  final Color primaryColor;
  final Color secundaryColor;

  GradientTextWidget(
    this.text,
    this.primaryColor,
    this.secundaryColor, {
    this.fontSize,
    this.textAlign,
    this.paddignLeft,
    this.paddignTop,
    this.paddignBottom,
    this.paddignRight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: paddignLeft ?? 0,
        right: paddignRight ?? 0,
        bottom: paddignBottom ?? 0,
        top: paddignTop ?? 0,
      ),
      child: GradientText(
        text,
        gradient: ColorsApp().liner(primaryColor, secundaryColor),
        style: TextStyle(fontSize: fontSize ?? 16),
        textAlign: textAlign ?? TextAlign.start,
      ),
    );
  }
}
