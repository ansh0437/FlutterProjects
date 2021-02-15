import 'package:flutter/material.dart';

abstract class BasePageStateless extends StatelessWidget {
  BasePageStateless({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
