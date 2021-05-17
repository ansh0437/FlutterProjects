import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/data/models/player_model.dart';
import 'package:tictactoe/helpers/utils.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class Board extends BasePageStateless {
  @override
  Widget build(BuildContext context) {
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
              border: Border.all(color: AppColors.black, width: Doubles.two),
              borderRadius: BorderRadius.circular(Doubles.thirtySix),
              boxShadow: Utils.boxShadow(),
            ),
            child: GridView.builder(
              itemCount: Ints.nine,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Ints.three,
              ),
              itemBuilder: (_, index) => _Box(index),
            ),
          );
        }),
      ),
    );
  }
}

class _Box extends BasePageStateless {
  final borderSide = BorderSide(color: AppColors.black, width: Doubles.two);

  final int index;

  _Box(this.index);

  @override
  Widget build(BuildContext context) {
    Player player = context.select<GameNotifier, Player>(
      (game) => game.playerAt(index),
    );

    return InkWell(
      onTap: () {
        GameNotifier game = context.read<GameNotifier>();
        game.playMove(index);
      },
      child: Container(
        padding: EdgeInsets.all(Doubles.twentyFour),
        decoration: BoxDecoration(
          border: Border(
            top: _topBorder(index),
            right: _rightBorder(index),
          ),
        ),
        child: player != null ? player.icon : Container(),
      ),
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
