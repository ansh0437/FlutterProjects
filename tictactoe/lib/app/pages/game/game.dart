import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/helpers/app_helper.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class Game {
  static Game get instance => new Game._();

  final SvgPicture playerOneIcon = SvgPicture.asset(AppIcon.cross,
      width: Doubles.twentySix, height: Doubles.twentySix);

  final SvgPicture playerTwoIcon = SvgPicture.asset(AppIcon.circle,
      width: Doubles.thirty, height: Doubles.thirty);

  final List<List<int>> _winningConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  String playerOneName = "Player One";
  String playerTwoName = "Player Two";

  int playerOneWins = Ints.zero;
  int playerTwoWins = Ints.zero;

  List<Player> _board = List.generate(9, (idx) => Player.NONE);

  // List<List<Player>> _boardMatrix = [[]];

  Player _whoseTurn = Player.ONE;

  int _playedCount = Ints.zero;

  // GameNotifier gameNotifier;

  Game._();

  Player get currentPlayer => _whoseTurn;

  // void addGameNotifier(GameNotifier notifier) {
  //   gameNotifier = notifier;
  // }

  Widget cellIcon(int index) {
    Player player = _board[index];
    return player == Player.ONE
        ? playerOneIcon
        : player == Player.TWO
            ? playerTwoIcon
            : Container();
  }

  void onRefreshBoard() {
    _board.clear();
    _board = List.generate(9, (idx) => Player.NONE);
    _whoseTurn = Player.ONE;
    _playedCount = Ints.zero;
  }

  bool notOccupied(int index) {
    return _board[index] == Player.NONE;
  }

  bool playMove(int index) {
    _board[index] = _whoseTurn;

    if (_playedCount != 8) {
      _changeTurn();
    }

    _playedCount += Ints.one;

    return true;
  }

  String checkWinner() {
    String message = "";
    Player winner = Player.NONE;

    if (_playedCount < Ints.four) {
      return message;
    }

    for (List<int> list in _winningConditions) {
      if (_board[list[0]] != Player.NONE &&
          _board[list[0]] == _board[list[1]] &&
          _board[list[0]] == _board[list[2]]) {
        winner = _board[list[0]];
        break;
      }
    }

    if (winner == Player.ONE) {
      playerOneWins += 1;
      message = "Game won by '$playerOneName'";
    } else if (winner == Player.TWO) {
      playerTwoWins += 1;
      message = "Game won by '$playerTwoName'";
    } else if (winner == Player.NONE && _playedCount == 9) {
      message = "Game is a draw.";
    }

    return message;
  }

  // bool _boardFull() {
  //   for (Player player in _board) {
  //     if (player == Player.NONE) {
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  void _changeTurn() {
    _whoseTurn = _whoseTurn == Player.ONE ? Player.TWO : Player.ONE;
  }
}
