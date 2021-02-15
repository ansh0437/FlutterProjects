import 'package:flutter/material.dart';

import '../app/pages/boarding/boarding.dart';
import '../app/pages/login/login.dart';
import '../constants/pages.dart';

class DatingNavigator {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      Pages.boarding: (BuildContext context) => Boarding(),
      Pages.login: (BuildContext context) => LoginPage(),
    };
  }
}
