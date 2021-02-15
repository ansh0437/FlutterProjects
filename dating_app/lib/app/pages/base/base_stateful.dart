import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<T extends BasePage> extends State<T> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double getWidth() => MediaQuery.of(context).size.width;

  double getHeight() => MediaQuery.of(context).size.height;

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
