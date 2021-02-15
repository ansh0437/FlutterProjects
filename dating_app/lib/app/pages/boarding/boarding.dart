import 'package:dating_app/constants/dimensions.dart';
import 'package:flutter/material.dart';

import '../base/base_stateful.dart';

class Boarding extends BasePage {
  @override
  _BoardingState createState() => _BoardingState();
}

class _BoardingState extends BaseState<Boarding> {
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
            Container(
              height: getHeight() / 2,
              color: Colors.red,
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(Dimensions.twentyFour),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.twentyFour),
                      child: Text(
                        "Discover People",
                        style: TextStyle(fontSize: Dimensions.thirtyTwo),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.twentyFour),
                      child: Text(
                        "Find like minded people to connect with",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: Dimensions.twenty),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
