import 'dart:io';

import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<T extends BasePage> extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double getWidth({double percentage = Percentage.hundred}) =>
      MediaQuery.of(context).size.width * percentage;

  double getHeight({double percentage = Percentage.hundred}) =>
      MediaQuery.of(context).size.height * percentage;

  SystemUiOverlayStyle _statusBarStyle(bool darkScreen) {
    if (Platform.isAndroid) {
      return SystemUiOverlayStyle(
        statusBarColor: darkScreen ? AppColors.transparent : AppColors.white,
        statusBarBrightness: darkScreen ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            darkScreen ? Brightness.light : Brightness.dark,
      );
    } else {
      return darkScreen
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark;
    }
  }

  Widget buildScaffold({bool darkScreen = false, Widget body}) {
    return AnnotatedRegion(
      value: _statusBarStyle(darkScreen),
      child: Scaffold(
        key: scaffoldKey,
        body: body,
      ),
    );
  }

  Future<bool> willPop() async {
    return true;
  }

  Future<bool> disablePop() async {
    return false;
  }

  void closePage() {
    Navigator.of(context).pop();
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
