import 'package:flutter/material.dart';

//!AMACIMIZ RENKLERİ SİZELERİ THEMEDEN VEREREK KOD OPTİMİZASYONUNU ARTTIRMAK. LİGTH-DARK

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 93, 12, 242),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)))),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      colorScheme: ColorScheme.light(
        onSecondary: _lightColor.greenFetish,
      ),
      buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light()),
      checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
      })),
    );
  }
}

//todo: Classa dışarıdan erişilmemesi için private yaptık.
class _LightColor {
  final Color _textColor = Colors.redAccent;
  final Color greenFetish = const Color.fromARGB(225, 50, 210, 175);
}
