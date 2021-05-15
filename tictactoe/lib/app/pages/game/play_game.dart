import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateful.dart';
import 'package:tictactoe/app/pages/game/components/board.dart';
import 'package:tictactoe/app/pages/game/components/players.dart';
import 'package:tictactoe/app/pages/game/components/reload.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/constants/strings.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

import '../../../constants/numbers.dart';

class PlayGame extends BasePage {
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends BaseState<PlayGame> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context).settings.arguments;

    double screenWidth = getWidth();

    screenWidth =
        screenWidth <= Doubles.fiveTwenty ? screenWidth : Doubles.fourEighty;

    return buildScaffold(
      title: Strings.appName,
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(vertical: Doubles.sixteen),
            child: ChangeNotifierProvider<GameNotifier>(
              create: (_) => GameNotifier(data),
              builder: (context, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Players(),
                    Board(),
                    Reload(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
