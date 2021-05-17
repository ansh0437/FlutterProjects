import 'package:flutter/material.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';

class Player {
  final PlayerType type;
  final String name;
  final PlayerIcon iconType;

  int wins = Ints.zero;

  Player({this.type, this.name, this.iconType});

  void updateWins() => wins++;

  String get gamesWon => "Wins: $wins";

  String get winningMessage => "Game won by $name";

  Widget get icon =>
      iconType == PlayerIcon.X ? AppIcon.crossIcon : AppIcon.circleIcon;

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) => other is Player && other.type == type;
}
