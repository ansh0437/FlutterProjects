import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/helpers/app_helper.dart';

class GameNotifier with ChangeNotifier {
  final SvgPicture _crossIcon = SvgPicture.asset(AppIcon.cross,
      width: Doubles.twentySix, height: Doubles.twentySix);

  final SvgPicture _circleIcon = SvgPicture.asset(AppIcon.circle,
      width: Doubles.thirty, height: Doubles.thirty);

  final _scores = {Player.ONE: -1, Player.TWO: 1, Player.DRAW: 0};

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

  List<Player> _board = List.generate(Ints.nine, (idx) => Player.NONE);

  Player _whoseTurn = Player.ONE;

  GameType _gameType = GameType.HUMAN;

  SvgPicture playerOneIcon;
  SvgPicture playerTwoIcon;

  String playerOneName = "Player One";
  String playerTwoName = "Player Two";

  int playerOneWins = Ints.zero;
  int playerTwoWins = Ints.zero;

  int _spotsPlayed = Ints.zero;

  GameNotifier(Map<String, dynamic> data) {
    printLog("Game Notifier");

    _gameType = data["game_type"];
    playerOneName = data["player_one"];
    playerTwoName = data["player_two"];
    bool b = data["player_one_side"];
    if (b) {
      playerOneIcon = _crossIcon;
      playerTwoIcon = _circleIcon;
    } else {
      playerOneIcon = _circleIcon;
      playerTwoIcon = _crossIcon;
    }
  }

  Player get currentPlayer => _whoseTurn;

  Widget cellIcon(int index) {
    Player player = _board[index];
    return player == Player.ONE
        ? playerOneIcon
        : player == Player.TWO
            ? playerTwoIcon
            : Container();
  }

  void reloadBoard() {
    _board.clear();
    _board = List.generate(Ints.nine, (idx) => Player.NONE);
    _whoseTurn = Player.ONE;
    _spotsPlayed = Ints.zero;

    notifyListeners();
  }

  bool spotEmpty(int index) => _board[index] == Player.NONE;

  void playMove(int index) {
    if (_board[index] != Player.NONE) return;

    _board[index] = _whoseTurn;

    if (_spotsPlayed != Ints.eight) {
      _whoseTurn = _whoseTurn == Player.ONE ? Player.TWO : Player.ONE;
    }

    _spotsPlayed += Ints.one;

    notifyListeners();
  }

  void playAIMove() {
    if (_gameType == GameType.AI && _whoseTurn == Player.TWO) {
      int bestScore = -Ints.sixtyNine;
      int move;

      for (int i = 0; i < _board.length; i++) {
        if (_board[i] == Player.NONE) {
          _board[i] = Player.TWO;
          int score = _minimax(_board, 0, false);
          _board[i] = Player.NONE;
          if (score > bestScore) {
            bestScore = score;
            move = i;
          }
        }
      }

      if (move != null) {
        _board[move] = Player.TWO;
        if (_spotsPlayed != Ints.eight) {
          _whoseTurn = Player.ONE;
        }
        _spotsPlayed += Ints.one;
        notifyListeners();
      }
    }
  }

  int _minimax(List<Player> board, int depth, bool isMaximizing) {
    Player winner = checkWinner();

    if (winner != null) {
      return _scores[winner];
    }

    if (isMaximizing) {
      int bestScore = -Ints.sixtyNine;
      for (int i = 0; i < _board.length; i++) {
        if (_board[i] == Player.NONE) {
          _board[i] = Player.TWO;
          int score = _minimax(_board, depth + 1, false);
          _board[i] = Player.NONE;
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = Ints.sixtyNine;
      for (int i = 0; i < _board.length; i++) {
        if (_board[i] == Player.NONE) {
          _board[i] = Player.ONE;
          int score = _minimax(_board, depth + 1, true);
          _board[i] = Player.NONE;
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  Player checkWinner() {
    Player winner;

    for (List<int> list in _winningConditions) {
      if (_board[list[Ints.zero]] != Player.NONE &&
          _board[list[Ints.zero]] == _board[list[Ints.one]] &&
          _board[list[Ints.zero]] == _board[list[Ints.two]]) {
        winner = _board[list[Ints.zero]];
        break;
      }
    }

    if (winner == null) {
      int openSpots = Ints.zero;
      for (Player value in _board) {
        if (value == Player.NONE) {
          openSpots++;
        }
      }
      if (openSpots == Ints.zero) {
        winner = Player.DRAW;
      }
    }

    return winner;
  }

// String checkWinner() {
//   String message = "";
//
//   if (_spotsPlayed < Ints.four) {
//     return message;
//   }
//
//   Player winner = Player.NONE;
//
//   for (List<int> list in _winningConditions) {
//     if (_board[list[Ints.zero]] != Player.NONE &&
//         _board[list[Ints.zero]] == _board[list[Ints.one]] &&
//         _board[list[Ints.zero]] == _board[list[Ints.two]]) {
//       winner = _board[list[Ints.zero]];
//       break;
//     }
//   }
//
//   if (winner == Player.ONE) {
//     playerOneWins += Ints.one;
//     message = "Game won by '$playerOneName'";
//   } else if (winner == Player.TWO) {
//     playerTwoWins += Ints.one;
//     message = "Game won by '$playerTwoName'";
//   } else if (winner == Player.NONE && _spotsPlayed == Ints.nine) {
//     message = "Game is a draw.";
//   }
//
//   return message;
// }
}
