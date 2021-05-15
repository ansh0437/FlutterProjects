import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';

class Utils {
  static List<TextInputFormatter> onlyTextFormatter() {
    return [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))];
  }

  static double getWidth(BuildContext context,
          {double percentage = Percentage.hundred}) =>
      MediaQuery.of(context).size.width * percentage;

  static double getHeight(
    BuildContext context, {
    double percentage = Percentage.hundred,
  }) =>
      MediaQuery.of(context).size.height * percentage;

  static List<BoxShadow> boxShadow() {
    return [
      BoxShadow(
        color: AppColors.greyLight,
        offset: Offset(0.0, 1.0),
        blurRadius: Doubles.twentyFour,
      )
    ];
  }
}
