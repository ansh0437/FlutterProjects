import 'package:flutter/material.dart';
import 'package:tictactoe/app/pages/chooser/choose_side.dart';
import 'package:tictactoe/app/pages/game/play_game.dart';
import 'package:tictactoe/app/pages/home/home_page.dart';

import '../constants/pages.dart';

class AppNavigator {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      Pages.home: (BuildContext context) => HomePage(),
      Pages.chooseSide: (BuildContext context) => ChooseSide(),
      Pages.playGame: (BuildContext context) => PlayGame(),
    };
  }
}
