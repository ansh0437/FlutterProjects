import 'package:flutter/cupertino.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';

class ScoreDTO {
  ScoreType scoreType;
  int score;

  ScoreDTO({@required this.scoreType, this.score = Ints.zero});

  Color boxColor() {
    return scoreType == ScoreType.Win
        ? AppColors.green
        : scoreType == ScoreType.Draw
            ? AppColors.accent
            : AppColors.redLight;
  }

  String displayType() {
    return scoreType == ScoreType.Win
        ? "Win"
        : scoreType == ScoreType.Draw
            ? "Draw"
            : "Lose";
  }
}
