import 'package:dating_app/constants/assets.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../constants/numbers.dart';
import '../base/base_stateful.dart';

class LoginPage extends BasePage {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Expanded(
                    flex: Ints.two,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            DaterIcons.logo,
                            width: Doubles.sixtyFour,
                            height: Doubles.sixtyFour,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Doubles.sixteen),
                            child: Text(
                              Strings.appName.toUpperCase(),
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: Doubles.thirtySix,
                                letterSpacing: Doubles.two,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: Ints.three,
                    child: Container(
                      color: Colors.blue,
                      width: getWidth(),
                      child: Column(
                        children: [
                          _buildTermsPolicyText(),
                          Container(
                            width: getWidth(),
                            margin: EdgeInsets.symmetric(
                              vertical: Doubles.twentyFour,
                              horizontal: Doubles.fortyEight,
                            ),
                            child: RaisedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.phone),
                              color: AppColors.white,
                              label: Text("Login with phone number"),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Doubles.sixteen),
                              ),
                            ),
                          ),
                          Container(
                            width: getWidth(),
                            margin: EdgeInsets.symmetric(
                              horizontal: Doubles.fortyEight,
                            ),
                            child: RaisedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.email),
                              color: AppColors.white,
                              label: Text("Login with email address"),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Doubles.sixteen),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTermsPolicyText() {
  return Container(
    width: Doubles.threeForty,
    padding: const EdgeInsets.symmetric(
      vertical: Doubles.twentyFour,
    ),
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(color: AppColors.white),
        children: <TextSpan>[
          TextSpan(
            text: "By clicking ",
          ),
          TextSpan(
              text: "\"Log in\"",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " you agree with our "),
          TextSpan(
              text: "Terms.", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " Learn how  we process your data in our "),
          TextSpan(
              text: "Privacy Policy ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: "and"),
          TextSpan(
              text: " Cookies Policy.",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
