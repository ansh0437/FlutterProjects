import 'package:flutter/material.dart';

class AppColors {
  static const _blackPrimaryValue = 0xFF000000;

  static Color accent = _hexToColor("#03DAC5");

  static Color transparent = Colors.transparent;

  static Color white = Colors.white;
  static Color grey = Colors.grey.shade700;
  static Color greyLight = Colors.grey.shade500;
  static Color greyLightest = Colors.grey.shade200;
  static Color greyTransparent = Colors.grey.shade500.withOpacity(0.5);

  static List<Color> gradient = [Color(0xFF102A34), Color(0xFF2B5D79)];

  static Color red = _hexToColor("#871307");
  static Color redLight = _hexToColor("#F44336");
  static Color blue = _hexToColor("#00BEF5");
  static Color blueDarkest = _hexToColor("#0A1923");
  static Color green = _hexToColor("#83CE6E");
  static Color yellow = _hexToColor("#FFA000");

  static Color _hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static const MaterialColor black = const MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFFe0e0e0),
      100: Color(0xFFb3b3b3),
      200: Color(0xFF808080),
      300: Color(0xFF4d4d4d),
      400: Color(0xFF262626),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
}
