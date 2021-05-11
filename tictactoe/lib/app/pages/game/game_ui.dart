import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/helpers/app_helper.dart';

class GameBox extends BasePageStateless {
  final double width;
  final double height;

  GameBox({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    double boxWidth =
        (width >= Doubles.threeSixty ? Doubles.threeSixty : width) -
            Doubles.twentyFour;
    double boxHeight =
        (height >= Doubles.threeSixty ? Doubles.threeSixty : height) -
            Doubles.twentyFour;

    double cellWidth = boxWidth / Ints.three;
    double cellHeight = boxHeight / Ints.three;

    printLog("width: $width, height: $height");
    printLog("boxWidth: $boxWidth, boxHeight: $boxHeight");
    printLog("cellWidth: $cellWidth, cellHeight: $cellHeight");

    return Container(
      width: boxWidth,
      height: boxHeight,
      margin: EdgeInsets.all(Doubles.sixteen),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.purpleDark,
          width: Doubles.one,
        ),
        borderRadius: BorderRadius.circular(Doubles.zero),
      ),
      child: GridView.builder(
        itemCount: Ints.nine,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Ints.three,
        ),
        itemBuilder: (BuildContext context, int index) =>
            _BoxCell(showCross: index % 2 == 0),
      ),
    );
  }
}

class _BoxCell extends BasePageStateless {
  // final double width;
  // final double height;

  final bool showCross;

  final SvgPicture _crossIcon = SvgPicture.asset(AppIcon.cross,
      width: Doubles.thirtySix, height: Doubles.thirtySix);

  final SvgPicture _circleIcon = SvgPicture.asset(AppIcon.circle,
      width: Doubles.forty, height: Doubles.forty);

  // _BoxCell({this.width, this.height});
  _BoxCell({this.showCross});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // width: width,
        // height: height,
        decoration: BoxDecoration(
          // color: AppColors.purpleLightest,
          border: Border.all(color: AppColors.purpleDark),
        ),
        child: Center(child: showCross ? _crossIcon : _circleIcon),
      ),
    );
  }
}
