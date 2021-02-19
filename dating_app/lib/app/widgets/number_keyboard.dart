import 'package:dating_app/app/pages/base/base_stateless.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:dating_app/constants/strings.dart';
import 'package:flutter/material.dart';

class NumberKeyboard extends BasePageStateless {
  // NumberKeyboard({
  //   @required this.width,
  //   @required this.height,
  // })  : assert(width >= Doubles.twoHundred && width <= Doubles.threeSixty),
  //       assert(height >= Doubles.twoHundred && height <= Doubles.threeSixty);

  NumberKeyboard({
    @required this.width,
    @required this.height,
    this.onNumberClick,
    this.onNumberClear,
    this.onSubmitClick,
  });

  final double width;
  final double height;

  final Function onNumberClick;
  final Function onNumberClear;
  final Function onSubmitClick;

  // double get boxWidth => // Doubles.twoEighty;
  // width >= Doubles.twoHundred && width <= Doubles.threeSixty
  //     ? width
  //     : Doubles.threeTwenty;

  // double get boxHeight => // Doubles.twoEighty;
  // height >= Doubles.twoHundred && height <= Doubles.threeSixty
  //     ? height
  //     : Doubles.threeTwenty;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.red,
          width: Doubles.two,
        ),
        borderRadius: BorderRadius.circular(Doubles.sixteen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRow([Strings.one, Strings.two, Strings.three]),
          _buildRow([Strings.four, Strings.five, Strings.six]),
          _buildRow([Strings.seven, Strings.eight, Strings.nine]),
          _buildCustomRow(),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> numbers) {
    double mainHeight = height * Percentage.twentyFive - Doubles.four;

    double numWidth = width * Percentage.thirty;
    double numHeight = mainHeight * Percentage.eighty;

    return Container(
      width: width,
      height: mainHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var num in numbers)
            _buildNumber(
              numWidth: numWidth,
              numHeight: numHeight,
              number: num,
            ),
        ],
      ),
    );
  }

  Widget _buildCustomRow() {
    double mainHeight = height * Percentage.twentyFive - Doubles.four;

    double numWidth = width * Percentage.thirty;
    double numHeight = mainHeight * Percentage.eighty;

    return Container(
      width: width,
      height: mainHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildClearButton(
            numWidth: numWidth,
            numHeight: numHeight,
          ),
          _buildNumber(
            numWidth: numWidth,
            numHeight: numHeight,
            number: Strings.zero,
          ),
          _buildSubmitButton(
            numWidth: numWidth,
            numHeight: numHeight,
          ),
        ],
      ),
    );
  }

  Widget _buildNumber({
    double numWidth,
    double numHeight,
    String number,
  }) {
    return InkWell(
      onTap: () {
        if (onNumberClick != null) {
          onNumberClick(number);
        }
      },
      customBorder: CircleBorder(),
      splashColor: AppColors.redLight,
      child: Container(
        width: numWidth,
        height: numHeight,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontSize: Doubles.twentyFour,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton({double numWidth, double numHeight}) {
    return InkWell(
      onTap: () {
        if (onNumberClear != null) {
          onNumberClear();
        }
      },
      customBorder: CircleBorder(),
      splashColor: AppColors.redLight,
      child: Container(
        width: numWidth,
        height: numHeight,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Center(
          child: Icon(
            Icons.backspace,
            color: AppColors.black,
            size: Doubles.twentyFour,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton({double numWidth, double numHeight}) {
    return InkWell(
      onTap: () {
        if (onSubmitClick != null) {
          onSubmitClick();
        }
      },
      customBorder: CircleBorder(),
      splashColor: AppColors.redLight,
      child: Container(
        width: numWidth,
        height: numHeight,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Center(
          child: Icon(
            Icons.check_circle,
            color: AppColors.black,
            size: Doubles.thirty,
          ),
        ),
      ),
    );
  }
}
