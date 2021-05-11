import 'package:flutter/material.dart';
import 'package:tictactoe/app/pages/game/game_with_friend.dart';
import 'package:tictactoe/app/pages/game/single_player_game.dart';
import 'package:tictactoe/app/pages/home/home_page.dart';

import '../constants/pages.dart';

class AppNavigator {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      Pages.home: (BuildContext context) => HomePage(),
      Pages.gameWithFriend: (BuildContext context) => GameWithFriend(),
    };
  }
}
