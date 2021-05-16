import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/helpers/dialog_helper.dart';
import 'package:tictactoe/helpers/utils.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class Board extends BasePageStateless {
  final borderSide = BorderSide(color: AppColors.black, width: Doubles.two);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameNotifier>(
      builder: (context, game, child) {
        Future.delayed(
          Duration(microseconds: 100),
          () {
            Player winner = game.checkWinner();
            String message = "";
            if (winner != null) {
              if (winner == Player.ONE) {
                message = "Game won by '${game.playerOneName}'";
                game.playerOneWins++;
              } else if (winner == Player.TWO) {
                message = "Game won by '${game.playerTwoName}'";
                game.playerTwoWins++;
              } else if (winner == Player.DRAW) {
                message = "Game is a draw.";
              }
            }
            if (message.isNotEmpty) {
              DialogHelper.instance.showWinner(
                context: context,
                message: message,
                okClick: () => game.reloadBoard(),
              );
            } else {
              game.playAIMove();
            }
          },
        );

        return Container(
          child: Center(
            child: LayoutBuilder(builder: (context, constraints) {
              double boxWidth = constraints.maxWidth >= Doubles.threeSixty
                  ? Doubles.threeTwenty
                  : constraints.maxWidth;

              double boxHeight = constraints.maxHeight >= Doubles.threeSixty
                  ? Doubles.threeTwenty
                  : constraints.maxHeight;

              return Container(
                width: boxWidth,
                height: boxHeight,
                padding: EdgeInsets.all(Doubles.eight),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border:
                      Border.all(color: AppColors.black, width: Doubles.two),
                  borderRadius: BorderRadius.circular(Doubles.thirtySix),
                  boxShadow: Utils.boxShadow(),
                ),
                child: GridView.builder(
                  itemCount: Ints.nine,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Ints.three,
                  ),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => game.playMove(index),
                      child: Container(
                        padding: EdgeInsets.all(Doubles.twentyFour),
                        decoration: BoxDecoration(
                          border: Border(
                            top: _topBorder(index),
                            right: _rightBorder(index),
                          ),
                        ),
                        child: game.cellIcon(index),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }

  BorderSide _topBorder(int index) {
    return (index == 3 ||
            index == 4 ||
            index == 5 ||
            index == 6 ||
            index == 7 ||
            index == 8)
        ? borderSide
        : BorderSide.none;
  }

  BorderSide _rightBorder(int index) {
    return (index == 0 ||
            index == 1 ||
            index == 3 ||
            index == 4 ||
            index == 6 ||
            index == 7)
        ? borderSide
        : BorderSide.none;
  }
}
