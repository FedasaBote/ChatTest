import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomButtonStyles {
  // Gradient button style
  static BoxDecoration get gradientPinkAToPinkADecoration => BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            18.h,
          ),
          topRight: Radius.circular(
            4.h,
          ),
          bottomLeft: Radius.circular(
            18.h,
          ),
          bottomRight: Radius.circular(
            16.h,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment(0.14, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.pinkA40001,
            appTheme.pinkA200,
          ],
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
