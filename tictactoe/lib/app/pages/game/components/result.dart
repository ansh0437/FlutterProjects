import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
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
                width: screenWidth * Percentage.ninety,
                height: Doubles.twoForty,
                padding: EdgeInsets.all(Doubles.eight),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(Doubles.twentyFour),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        winningMessage,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: Doubles.twentyFour,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GameNotifier game = context.read<GameNotifier>();
                        game.reloadBoard();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Doubles.eight),
                        ),
                      ),
                      child: Container(
                        width: Doubles.eighty,
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
