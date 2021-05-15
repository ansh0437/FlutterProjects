import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateless.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class Reload extends BasePageStateless {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameNotifier>(
      builder: (context, game, child) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.greyLightest,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: Doubles.eight,
              )
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.refresh_sharp),
            iconSize: Doubles.forty,
            color: AppColors.black,
            onPressed: () {
              game.reloadBoard();
            },
          ),
        );
      },
    );
  }
}
