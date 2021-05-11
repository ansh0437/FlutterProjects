import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/widgets/curved_container.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/constants/strings.dart';

import '../base/base_stateful.dart';

class SplashPage extends BasePage {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  void _startGame() {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = getWidth();
    double screenHeight = getHeight();

    return buildScaffold(
      darkStatusBar: true,
      body: SafeArea(
        child: Container(
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPaint(
                painter: HeaderCurvedContainer(),
                child: Container(
                  width: screenWidth,
                  height: screenHeight / Ints.three,
                  padding: EdgeInsets.only(top: Doubles.forty),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppIcon.logo,
                        width: Doubles.sixtyFour,
                        height: Doubles.sixtyFour,
                      ),
                      SizedBox(height: Doubles.eight),
                      Text(
                        Strings.appName,
                        style: TextStyle(
                          fontSize: Doubles.twentyFour,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Doubles.fortyEight),
              ElevatedButton(
                onPressed: _startGame,
                style: ElevatedButton.styleFrom(
                    primary: AppColors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Doubles.sixteen))),
                child: Container(
                  width: screenWidth - (screenWidth / Ints.four),
                  height: Doubles.fortyEight,
                  child: Center(
                    child: Text(
                      "Start Game",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Doubles.eighteen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
