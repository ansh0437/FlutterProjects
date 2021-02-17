import 'package:dating_app/data/preferences.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/numbers.dart';
import '../../../constants/pages.dart';
import '../../../constants/strings.dart';
import '../../../generated/l10n.dart';
import '../../widgets/curved_container.dart';
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

  void _loginWithPhone() {
    if (DatingPreference.rulesAccepted.boolean) {
      pushPage(Pages.loginWithPhone);
    } else {
      pushPage(Pages.rules);
    }
  }

  void _loginWithGoogle() {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: buildScaffold(
        body: Stack(
          children: [
            Container(
              width: getWidth(),
              height: getHeight(),
              child: CustomPaint(painter: BottomCurvedPainter()),
            ),
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Expanded(
                    flex: Ints.two,
                    child: Container(
                      width: getWidth(),
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
                      width: getWidth(),
                      child: Column(
                        children: [
                          _buildTermsPolicyText(),
                          Container(
                            width: getWidth(),
                            height: Doubles.fortyEight,
                            margin: EdgeInsets.symmetric(
                              vertical: Doubles.twentyFour,
                              horizontal: Doubles.fortyEight,
                            ),
                            child: RaisedButton.icon(
                              onPressed: _loginWithPhone,
                              icon: Icon(Icons.phone),
                              color: AppColors.white,
                              label: Text(
                                LocalizedStrings.of(context)
                                    .loginWithPhone
                                    .toUpperCase(),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Doubles.twentyFour),
                              ),
                            ),
                          ),
                          Container(
                            width: getWidth(),
                            height: Doubles.fortyEight,
                            margin: EdgeInsets.symmetric(
                              horizontal: Doubles.fortyEight,
                            ),
                            child: RaisedButton.icon(
                              onPressed: _loginWithGoogle,
                              icon: Icon(Icons.email),
                              color: AppColors.white,
                              label: Text(
                                LocalizedStrings.of(context)
                                    .loginWithGoogle
                                    .toUpperCase(),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Doubles.twentyFour),
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
    margin: EdgeInsets.only(top: Doubles.thirtyTwo),
    padding: EdgeInsets.symmetric(vertical: Doubles.twentyFour),
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
