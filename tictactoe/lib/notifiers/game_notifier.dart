import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/constants/enums.dart';

class GameNotifier with ChangeNotifier {
  Player _turn = Player.NONE;

  GameNotifier();

  Player get whoseTurn => _turn;

  updateTurn(Player turn) {
    _turn = turn;
    notifyListeners();
  }
}
