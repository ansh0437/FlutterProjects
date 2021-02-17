import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:dating_app/data/models/country_code_dto.dart';
import 'package:flutter/material.dart';

import '../base/base_stateful.dart';

class OtpPage extends BasePage {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends BaseState<OtpPage> {
  CountryCodeDTO _countryCodeDTO;
  String _phoneNumber;

  @override
  void initState() {
    super.initState();
  }

  void _resendClick() {}

  void _submitClick() {}

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context).settings.arguments;

    _countryCodeDTO = data["country_code"];
    _phoneNumber = data["phone_number"];

    return WillPopScope(
      onWillPop: willPop,
      child: buildScaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: getWidth(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: Doubles.sixteen,
                        top: Doubles.sixteen,
                      ),
                      child: InkWell(
                        onTap: closePage,
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: AppColors.red,
                          size: Doubles.thirtySix,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "My code is",
                      style: TextStyle(
                        fontSize: Doubles.thirtyTwo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Doubles.sixteen),
                    color: AppColors.blue,
                    child: TextField(),
                  ),
                  Container(
                    width: getWidth(percentage: Percentage.seventyFive),
                    margin: EdgeInsets.symmetric(vertical: Doubles.sixteen),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: Doubles.sixteen,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "Please enter the 4-digit code sent to you at ",
                          ),
                          TextSpan(
                            text: "${_countryCodeDTO.dialCode} $_phoneNumber",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Doubles.hundredTwenty,
                    height: Doubles.thirtyTwo,
                    child: RaisedButton(
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: Doubles.sixteen,
                        ),
                      ),
                      onPressed: _resendClick,
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.red),
                        borderRadius: BorderRadius.circular(Doubles.thirty),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Doubles.sixteen),
                    width: getWidth(percentage: Percentage.ninety),
                    height: Doubles.threeTwenty,
                    color: AppColors.green,
                    child: Center(child: Text("Keyboard")),
                  ),
                  Container(
                    width: getWidth(percentage: Percentage.eighty),
                    height: Doubles.fortyEight,
                    margin: EdgeInsets.symmetric(vertical: Doubles.sixteen),
                    child: RaisedButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: Doubles.sixteen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _submitClick,
                      color: AppColors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Doubles.twentyFour),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
