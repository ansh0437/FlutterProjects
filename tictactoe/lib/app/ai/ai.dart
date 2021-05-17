// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tictactoe/constants/assets.dart';
// import 'package:tictactoe/constants/enums.dart';
// import 'package:tictactoe/constants/numbers.dart';

// class AI {
//   static AI get instance => new AI._();

//   final SvgPicture _crossIcon = SvgPicture.asset(AppIcon.cross,
//       width: Doubles.twentySix, height: Doubles.twentySix);

//   final SvgPicture _circleIcon = SvgPicture.asset(AppIcon.circle,
//       width: Doubles.thirty, height: Doubles.thirty);

//   final _scores = {Player.ONE: -1, Player.TWO: 1, Player.NONE: 0};

//   final List<List<int>> _winningConditions = [
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8],
//     [0, 3, 6],
//     [1, 4, 7],
//     [2, 5, 8],
//     [0, 4, 8],
//     [2, 4, 6],
//   ];

//   GameType _gameType = GameType.HUMAN;

//   String playerOneName = "Player One";
//   String playerTwoName = "Player Two";

//   SvgPicture playerOneIcon;
//   SvgPicture playerTwoIcon;

//   int playerOneWins = Ints.zero;
//   int playerTwoWins = Ints.zero;

//   List<Player> _board = List.generate(Ints.nine, (idx) => Player.NONE);

//   Player _whoseTurn = Player.ONE;

//   int _spotsPlayed = Ints.zero;

//   // GameNotifier gameNotifier;

//   AI._() {
//     playerOneIcon = _crossIcon;
//     playerTwoIcon = _circleIcon;
//   }

//   Player get currentPlayer => _whoseTurn;

//   // void addGameNotifier(GameNotifier notifier) {
//   //   gameNotifier = notifier;
//   // }

//   Widget cellIcon(int index) {
//     Player player = _board[index];
//     return player == Player.ONE
//         ? playerOneIcon
//         : player == Player.TWO
//             ? playerTwoIcon
//             : Container();
//   }

//   void setData(Map<String, dynamic> data) {
//     _gameType = data["game_type"];
//     playerOneName = data["player_one"];
//     playerTwoName = data["player_two"];
//     bool b = data["player_one_side"];
//     if (b) {
//       playerOneIcon = _crossIcon;
//       playerTwoIcon = _circleIcon;
//     } else {
//       playerOneIcon = _circleIcon;
//       playerTwoIcon = _crossIcon;
//     }
//   }

//   void refreshBoard() {
//     _board.clear();
//     _board = List.generate(Ints.nine, (idx) => Player.NONE);
//     _whoseTurn = Player.ONE;
//     _spotsPlayed = Ints.zero;
//   }

//   bool notOccupied(int index) {
//     return _board[index] == Player.NONE;
//   }

//   bool playMove(int index) {
//     _board[index] = _whoseTurn;

//     if (_spotsPlayed != Ints.eight) {
//       _changeTurn();
//     }

//     _spotsPlayed += Ints.one;

//     return true;
//   }

//   String checkWinner() {
//     String message = "";
//     Player winner = Player.NONE;

//     if (_spotsPlayed < Ints.four) {
//       return message;
//     }

//     for (List<int> list in _winningConditions) {
//       if (_board[list[Ints.zero]] != Player.NONE &&
//           _board[list[Ints.zero]] == _board[list[Ints.one]] &&
//           _board[list[Ints.zero]] == _board[list[Ints.two]]) {
//         winner = _board[list[Ints.zero]];
//         break;
//       }
//     }

//     if (winner == Player.ONE) {
//       playerOneWins += Ints.one;
//       message = "Game won by '$playerOneName'";
//     } else if (winner == Player.TWO) {
//       playerTwoWins += Ints.one;
//       message = "Game won by '$playerTwoName'";
//     } else if (winner == Player.NONE && _spotsPlayed == Ints.nine) {
//       message = "Game is a draw.";
//     }

//     return message;
//   }

//   // bool _boardFull() {
//   //   for (Player player in _board) {
//   //     if (player == Player.NONE) {
//   //       return false;
//   //     }
//   //   }
//   //   return true;
//   // }

//   void _changeTurn() {
//     _whoseTurn = _whoseTurn == Player.ONE ? Player.TWO : Player.ONE;
//   }
// }
