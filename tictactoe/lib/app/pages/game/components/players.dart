import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/helpers/utils.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class Players extends BasePageStateless {
  @override
  Widget build(BuildContext context) {
    double screenWidth = Utils.getWidth(context);

    double boxWidth =
        screenWidth <= Doubles.fiveTwenty ? screenWidth : Doubles.fourEighty;
    boxWidth *= Percentage.forty;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
      child: Consumer<GameNotifier>(
        builder: (context, game, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _playerBox(width: boxWidth, playerType: Player.ONE, game: game),
            // _scoreBox(width: screenWidth * Percentage.twentyFive),
            _playerBox(width: boxWidth, playerType: Player.TWO, game: game),
          ],
        ),
      ),
    );
  }

  Widget _playerBox(
      {@required double width,
      @required Player playerType,
      @required GameNotifier game}) {
    return Container(
      width: width,
      height: Doubles.hundred,
      padding: EdgeInsets.all(Doubles.eight),
      decoration: BoxDecoration(
        color: playerType == game.currentPlayer
            ? AppColors.purpleLightest
            : AppColors.greyLightest,
        borderRadius: BorderRadius.circular(Doubles.twelve),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: playerType == Player.ONE
                ? game.playerOneIcon
                : game.playerTwoIcon,
          ),
          Text(
            playerType == Player.ONE ? game.playerOneName : game.playerTwoName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Doubles.eighteen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

// Widget _scoreBox({@required double width}) {
//   return Container(
//     width: width,
//     height: Doubles.forty,
//     padding: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
//     decoration: BoxDecoration(
//       color: AppColors.white,
//       borderRadius: BorderRadius.circular(Doubles.twelve),
//       boxShadow: [
//         BoxShadow(
//           color: AppColors.greyLight,
//           offset: Offset(0.0, 1.0),
//           blurRadius: Doubles.four,
//         )
//       ],
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _scoreLabel(_gameNotifier.playerOneWins.toString()),
//         _scoreLabel("-"),
//         _scoreLabel(_gameNotifier.playerTwoWins.toString()),
//       ],
//     ),
//   );
// }
//
// Widget _scoreLabel(String lbl) {
//   return Container(
//     child: Text(
//       lbl,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: AppColors.black,
//         fontSize: Doubles.twenty,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   );
// }
}
