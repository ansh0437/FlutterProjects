import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors.dart';
import '../../../constants/numbers.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<T extends BasePage> extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double getWidth({double percentage = Percentage.hundred}) =>
      MediaQuery.of(context).size.width * percentage;

  double getHeight({double percentage = Percentage.hundred}) =>
      MediaQuery.of(context).size.height * percentage;

  SystemUiOverlayStyle _statusBarStyle(bool darkStatusBar) {
    if (Platform.isAndroid) {
      return SystemUiOverlayStyle(
        statusBarColor: darkStatusBar ? AppColors.purpleDark : AppColors.white,
        statusBarBrightness: darkStatusBar ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            darkStatusBar ? Brightness.light : Brightness.dark,
      );
    } else {
      return darkStatusBar
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark;
    }
  }

  Widget buildScaffold(
      {bool darkStatusBar = true, AppBar appBar, Widget body}) {
    if (kIsWeb) {
      return Scaffold(key: scaffoldKey, appBar: appBar, body: body);
    }
    return AnnotatedRegion(
      value: _statusBarStyle(darkStatusBar),
      child: Scaffold(key: scaffoldKey, appBar: appBar, body: body),
    );
  }

  Future<bool> willPop() async {
    return true;
  }

  Future<bool> disablePop() async {
    return false;
  }

  void closePage({data}) {
    Navigator.of(context).pop(data);
  }

  void pushPage(String routeName, {Object data}) {
    Navigator.of(context).pushNamed(routeName, arguments: data);
  }

  void replacePage(String routeName, {Object data}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: data);
  }

  void popPushPage(String routeName, {Object data}) {
    Navigator.of(context).popAndPushNamed(routeName, arguments: data);
  }

  void pushClearPages(String routeName, {Object data}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: data);
  }
}
