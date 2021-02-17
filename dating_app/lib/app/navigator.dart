import 'package:flutter/material.dart';

import '../constants/pages.dart';
import 'pages/boarding/boarding.dart';
import 'pages/login/login.dart';
import 'pages/login/login_phone.dart';
import 'pages/login/rules.dart';
import 'pages/otp/otp_page.dart';

class DatingNavigator {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      Pages.boarding: (BuildContext context) => Boarding(),
      Pages.login: (_) => LoginPage(),
      Pages.rules: (_) => RulesPage(),
      Pages.loginWithPhone: (_) => LoginPhonePage(),
      Pages.otp: (_) => OtpPage(),
    };
  }
}
