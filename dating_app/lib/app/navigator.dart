import 'package:flutter/material.dart';

import '../constants/pages.dart';
import 'pages/boarding/boarding.dart';
import 'pages/login/login.dart';
import 'pages/login/rules.dart';

class DatingNavigator {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      Pages.boarding: (BuildContext context) => Boarding(),
      Pages.login: (BuildContext context) => LoginPage(),
      Pages.rules: (BuildContext context) => RulesPage(),
    };
  }
}
