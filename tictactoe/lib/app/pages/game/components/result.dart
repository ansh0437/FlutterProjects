import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class Result extends BasePageStateless {
  @override
  Widget build(BuildContext context) {
    double screenWidth = getWidth(context);

    screenWidth =
        screenWidth <= Doubles.fiveTwenty ? screenWidth : Doubles.fourEighty;

    String winningMessage = context.select<GameNotifier, String>(
      (game) => game.winner,
    );

    return winningMessage == null || winningMessage.isEmpty
        ? Container()
        : Container(
            color: AppColors.greyTransparent,
            child: Center(
              child: Container(
                width: screenWidth * Percentage.eightyFive,
                padding: EdgeInsets.symmetric(
                  horizontal: Doubles.twelve,
                  vertical: Doubles.thirty,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(Doubles.sixteen),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Doubles.oneTwenty,
                      height: Doubles.oneTwenty,
                      child: SvgPicture.asset(AppIcon.winner),
                    ),
                    SizedBox(height: Doubles.twentyFour),
                    Container(
                      child: Text(
                        "Congrats! Ansh",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: Doubles.twentyFour,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: Doubles.twentyFour),
                    Container(
                      child: Text(
                        "You won this game...",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: Doubles.twentyFour,
                        ),
                      ),
                    ),
                    SizedBox(height: Doubles.twentyFour),
                    ElevatedButton(
                      onPressed: () {
                        GameNotifier game = context.read<GameNotifier>();
                        game.reloadBoard();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Doubles.sixteen),
                        ),
                      ),
                      child: Container(
                        width: Doubles.twoHundred,
                        height: Doubles.forty,
                        child: Center(
                          child: Text(
                            "Okay",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: Doubles.sixteen,
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
