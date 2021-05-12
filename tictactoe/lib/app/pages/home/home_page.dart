import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/widgets/curved_container.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/constants/pages.dart';
import 'package:tictactoe/constants/strings.dart';
import 'package:tictactoe/helpers/app_helper.dart';

import '../base/base_stateful.dart';

class HomePage extends BasePage {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void _gameWithAI() {
    showToast("Coming Soon...");
  }

  void _gameWithFriend() {
    pushPage(Pages.gameWithFriend);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = getWidth();
    double screenHeight = getHeight();

    return buildScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / Ints.three,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: HeaderCurvedContainer(),
                    child: Container(),
                  ),
                  Container(
                    width: screenWidth,
                    height: (screenHeight / Ints.three) - Doubles.fortyEight,
                    child: Center(
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
                  )
                ],
              ),
            ),
            SizedBox(height: Doubles.twentyFour),
            Text(
              "Choose your opponent",
              style: TextStyle(
                color: AppColors.black,
                fontSize: Doubles.twentyFour,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Doubles.thirty),
            ElevatedButton(
              onPressed: _gameWithAI,
              style: ElevatedButton.styleFrom(
                  primary: AppColors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Doubles.sixteen))),
              child: Container(
                width: screenWidth * Percentage.fifty,
                height: Doubles.fortyEight,
                child: Center(
                  child: Text(
                    "AI",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: Doubles.eighteen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Doubles.twentyFour),
            ElevatedButton(
              onPressed: _gameWithFriend,
              style: ElevatedButton.styleFrom(
                  primary: AppColors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Doubles.sixteen))),
              child: Container(
                width: screenWidth * Percentage.fifty,
                height: Doubles.fortyEight,
                child: Center(
                  child: Text(
                    "Friend",
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
    );
  }
}
