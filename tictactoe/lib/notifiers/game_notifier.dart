import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/data/models/player_model.dart';

class GameNotifier with ChangeNotifier {
  final _scores = {PlayerType.ONE: -1, PlayerType.TWO: 1, PlayerType.DRAW: 0};

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

  List<PlayerType> _board = List.generate(Ints.nine, (idx) => PlayerType.NONE);

  PlayerType _whoseTurn = PlayerType.ONE;

  GameType _gameType = GameType.HUMAN;

  Player _playerOne, _playerTwo;

  String _winningMessage;

  int _spotsPlayed = Ints.zero;

  GameNotifier(Map<String, dynamic> data) {
    if (data == null) return;

    _gameType = data["game_type"];
    _playerOne = data["player_one"];
    _playerTwo = data["player_two"];
  }

  PlayerType get currentPlayer => _whoseTurn;

  String get winner => _winningMessage;

  Player get playerOne => _playerOne;

  Player get playerTwo => _playerTwo;

  Player playerAt(int index) {
    Player player;
    if (_board[index] == PlayerType.ONE) {
      player = _playerOne;
    } else if (_board[index] == PlayerType.TWO) {
      player = _playerTwo;
    }
    return player;
  }

  void reloadBoard() {
    _board.clear();
    _board = List.generate(Ints.nine, (idx) => PlayerType.NONE);
    _whoseTurn = PlayerType.ONE;
    _spotsPlayed = Ints.zero;
    _winningMessage = null;

    notifyListeners();
  }

  void playMove(int index) {
    if (_board[index] != PlayerType.NONE) return;

    if (_gameType == GameType.AI && _whoseTurn == PlayerType.TWO) return;

    _board[index] = _whoseTurn;

    if (_spotsPlayed != Ints.eight) {
      _whoseTurn =
          _whoseTurn == PlayerType.ONE ? PlayerType.TWO : PlayerType.ONE;
    }

    _spotsPlayed += Ints.one;

    if (_gameType == GameType.AI && _whoseTurn == PlayerType.TWO) {
      playAIMove();
    } else {
      _updateBoard();
    }
  }

  void playAIMove() {
    if (_gameType == GameType.AI && _whoseTurn == PlayerType.TWO) {
      int bestScore = -Ints.sixtyNine;
      int move;

      for (int i = 0; i < _board.length; i++) {
        if (_board[i] == PlayerType.NONE) {
          _board[i] = PlayerType.TWO;
          int score = _minimax(_board, 0, false);
          _board[i] = PlayerType.NONE;
          if (score > bestScore) {
            bestScore = score;
            move = i;
          }
        }
      }

      if (move != null) {
        _board[move] = PlayerType.TWO;
        if (_spotsPlayed != Ints.eight) {
          _whoseTurn = PlayerType.ONE;
        }
        _spotsPlayed += Ints.one;
        _updateBoard();
      }
    }
  }

  PlayerType checkWinner() {
    PlayerType winner;

    for (List<int> list in _winningConditions) {
      if (_board[list[Ints.zero]] != PlayerType.NONE &&
          _board[list[Ints.zero]] == _board[list[Ints.one]] &&
          _board[list[Ints.zero]] == _board[list[Ints.two]]) {
        winner = _board[list[Ints.zero]];
        break;
      }
    }

    if (winner == null) {
      int openSpots = Ints.zero;
      for (PlayerType value in _board) {
        if (value == PlayerType.NONE) {
          openSpots++;
        }
      }
      if (openSpots == Ints.zero) {
        winner = PlayerType.DRAW;
      }
    }

    return winner;
  }

  void _updateBoard() {
    PlayerType winner = checkWinner();
    if (winner != null) {
      if (winner == PlayerType.ONE) {
        _playerOne.updateWins();
        _winningMessage = _playerOne.winningMessage;
      } else if (winner == PlayerType.TWO) {
        _playerTwo.updateWins();
        _winningMessage = _playerTwo.winningMessage;
      } else if (winner == PlayerType.DRAW) {
        _winningMessage = "Game is a draw.";
      }
    }

    notifyListeners();
  }

  int _minimax(List<PlayerType> board, int depth, bool isMaximizing) {
    PlayerType winner = checkWinner();

    if (winner != null) {
      return _scores[winner];
    }

    if (isMaximizing) {
      int bestScore = -Ints.sixtyNine;
      for (int i = 0; i < _board.length; i++) {
        if (_board[i] == PlayerType.NONE) {
          _board[i] = PlayerType.TWO;
          int score = _minimax(_board, depth + 1, false);
          _board[i] = PlayerType.NONE;
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = Ints.sixtyNine;
      for (int i = 0; i < _board.length; i++) {
        if (_board[i] == PlayerType.NONE) {
          _board[i] = PlayerType.ONE;
          int score = _minimax(_board, depth + 1, true);
          _board[i] = PlayerType.NONE;
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }
}
