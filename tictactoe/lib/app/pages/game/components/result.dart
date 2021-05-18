import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/constants/strings.dart';
import 'package:tictactoe/helpers/app_helper.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class Result extends BasePageStateless {
  @override
  Widget build(BuildContext context) {
    PlayerType winningType = context.select<GameNotifier, PlayerType>(
      (game) => game.winnerType,
    );
    return winningType == PlayerType.NONE ? Container() : _ResultBox();
  }
}

class _ResultBox extends BasePageStateless {
  @override
  Widget build(BuildContext context) {
    double screenWidth = getWidth(context);

    screenWidth =
        screenWidth <= Doubles.fiveTwenty ? screenWidth : Doubles.fourEighty;

    GameNotifier game = context.read<GameNotifier>();

    PlayerType winnerType = game.winnerType;

    Color bgColor = AppColors.white;
    String title = Strings.empty;

    if (game.gameType == GameType.AI) {
      if (winnerType == PlayerType.ONE) {
        bgColor = AppColors.winner;
        title = "Congrats! ${game.playerOne.name} you won";
      } else if (winnerType == PlayerType.TWO) {
        bgColor = AppColors.loser;
        title = "Sorry! ${game.playerOne.name} you lost";
      } else if (winnerType == PlayerType.DRAW) {
        bgColor = AppColors.draw;
        title = "It's A Draw";
      }
    } else {
      if (winnerType == PlayerType.ONE) {
        bgColor = AppColors.winner;
        title = "Congrats! ${game.playerOne.name} you won";
      } else if (winnerType == PlayerType.TWO) {
        bgColor = AppColors.winner;
        title = "Congrats! ${game.playerTwo.name} you won";
      } else if (winnerType == PlayerType.DRAW) {
        bgColor = AppColors.draw;
        title = "It's A Draw";
      }
    }

    return Container(
      color: AppColors.greyTransparent,
      child: Center(
        child: Container(
          width: screenWidth * Percentage.eightyFive,
          padding: EdgeInsets.symmetric(
            horizontal: Doubles.twelve,
            vertical: Doubles.twentyFour,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(Doubles.sixteen),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Doubles.oneSixty,
                height: Doubles.oneTwenty,
                child: SvgPicture.asset(AppIcon.gameOver),
              ),
              Container(
                margin: EdgeInsets.only(top: Doubles.sixteen),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: Doubles.twentyFour,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Doubles.eight),
                padding: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
                child: Text(
                  "Do you want to play this game again?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: Doubles.twenty,
                  ),
                ),
              ),
              SizedBox(height: Doubles.twentyFour),
              ElevatedButton(
                onPressed: () {
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
                      "Play Again",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Doubles.sixteen,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Doubles.four),
              ElevatedButton(
                onPressed: () {
                  closePage(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Doubles.sixteen),
                  ),
                ),
                child: Container(
                  width: Doubles.twoHundred,
                  height: Doubles.forty,
                  child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(
                        color: AppColors.black,
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
