import 'package:dating_app/app/pages/boarding/boarding.dart';
import 'package:dating_app/constants/pages.dart';
import 'package:flutter/material.dart';

class DatingNavigator {
  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      Pages.boarding: (BuildContext context) => Boarding(),
    };
  }
}
