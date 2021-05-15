import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/constants/strings.dart';

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

  Widget buildScaffold({String title = Strings.empty, Widget body}) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.purpleDark,
        elevation: Doubles.zero,
        brightness: Brightness.dark,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: Doubles.twenty,
          ),
        ),
        centerTitle: true,
        toolbarHeight:
            (kIsWeb || title.isEmpty) ? Doubles.zero : kToolbarHeight,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          iconSize: Doubles.twentyEight,
          color: AppColors.white,
          onPressed: () => closePage(),
        ),
      ),
      body: body,
    );
  }

  // SystemUiOverlayStyle _statusBarStyle(bool darkStatusBar) {
  //   // if (Platform.isAndroid) {
  //     return SystemUiOverlayStyle(
  //       statusBarColor: darkStatusBar ? AppColors.purpleDark : AppColors.white,
  //       statusBarBrightness: darkStatusBar ? Brightness.light : Brightness.dark,
  //       statusBarIconBrightness:
  //           darkStatusBar ? Brightness.light : Brightness.dark,
  //     );
  //   // } else {
  //   //   return darkStatusBar
  //   //       ? SystemUiOverlayStyle(
  //   //           statusBarIconBrightness: Brightness.light,
  //   //           statusBarBrightness: Brightness.light,
  //   //           statusBarColor: AppColors.purpleDark)
  //   //       : SystemUiOverlayStyle(
  //   //           statusBarIconBrightness: Brightness.dark,
  //   //           statusBarBrightness: Brightness.dark,
  //   //           statusBarColor: AppColors.white);
  //   // }
  // }

  // Widget buildScaffold(
  //     {bool darkStatusBar = true, AppBar appBar, Widget body}) {
  //   if (kIsWeb) {
  //     return Scaffold(key: scaffoldKey, appBar: appBar, body: body);
  //   }
  //   return AnnotatedRegion<SystemUiOverlayStyle>(
  //     value: _statusBarStyle(darkStatusBar),
  //     child: Scaffold(key: scaffoldKey, appBar: appBar, body: body),
  //   );
  // }

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
