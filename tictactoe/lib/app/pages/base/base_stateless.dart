import 'package:flutter/material.dart';

import '../../../constants/numbers.dart';

abstract class BasePageStateless extends StatelessWidget {
  BasePageStateless({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double getWidth(
    BuildContext context, {
    double percentage = Percentage.hundred,
  }) =>
      MediaQuery.of(context).size.width * percentage;

  double getHeight(
    BuildContext context, {
    double percentage = Percentage.hundred,
  }) =>
      MediaQuery.of(context).size.height * percentage;

  void closePage(BuildContext context) {
    Navigator.of(context).pop();
  }

  void pushPage(BuildContext context, String routeName, {Object data}) {
    Navigator.of(context).pushNamed(routeName, arguments: data);
  }

  void replacePage(BuildContext context, String routeName, {Object data}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: data);
  }

  void popPushPage(BuildContext context, String routeName, {Object data}) {
    Navigator.of(context).popAndPushNamed(routeName, arguments: data);
  }

  void pushClearPages(BuildContext context, String routeName, {Object data}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: data);
  }
}
