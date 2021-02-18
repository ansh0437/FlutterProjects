import 'package:dating_app/app/widgets/number_keyboard.dart';
import 'package:dating_app/app/widgets/otp_field.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:dating_app/data/models/country_code_dto.dart';
import 'package:dating_app/helpers/app_helper.dart';
import 'package:flutter/material.dart';

import '../base/base_stateful.dart';

class OtpPage extends BasePage {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends BaseState<OtpPage> {
  CountryCodeDTO _countryCodeDTO;
  String _phoneNumber;

  int maxOtpLength = Ints.four;
  String _otpString = "";
  List<String> _otpList = List<String>.filled(Ints.four, "");

  @override
  void initState() {
    super.initState();
  }

  void _resendClick() {
    _updateOtp("");
  }

  void _onNumberClick(String number) {
    if (_otpString.length < maxOtpLength) {
      _updateOtp(_otpString + number);
    }
    // setState(() {
    //   if (_otpString.length < maxOtpLength) {
    //     _otpString += number;
    //     _otpList = _otpString.split("");
    //     int diff = maxOtpLength - _otpList.length;
    //     for (var i = 0; i < diff; i++) {
    //       _otpList.add("");
    //     }
    //   }
    // });
  }

  void _onNumberClear() {
    if (_otpString.length > 0) {
      _updateOtp(_otpString.substring(0, _otpString.length - 1));
    }
    // setState(() {
    //   if (_otpString.length > 0) {
    //     _otpString = _otpString.substring(0, _otpString.length - 1);
    //     _otpList = _otpString.split("");
    //     int diff = maxOtpLength - _otpList.length;
    //     for (var i = 0; i < diff; i++) {
    //       _otpList.add("");
    //     }
    //   }
    // });
  }

  void _updateOtp(String otp) {
    setState(() {
      _otpString = otp;
      _otpList = _otpString.split("");
      int diff = maxOtpLength - _otpList.length;
      for (var i = 0; i < diff; i++) {
        _otpList.add("");
      }
    });
  }

  void _onSubmitClick() {
    String otp = _otpList.join("").trim();
    if (otp.length < 4) {
      showToast("Enter valid otp", darkTheme: true);
    } else {
      showToast("Otp: $otp", darkTheme: true);
    }
  }

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
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: Doubles.sixteen,
                        top: Doubles.eight,
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
                  // Container(
                  //   width: getWidth(percentage: Percentage.eighty),
                  //   margin: EdgeInsets.only(top: Doubles.sixteen),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       for (var i in _otpList) _buildOtpBox(i),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: Doubles.sixteen),
                    child: OtpFields(
                      otpList: _otpList,
                    ),
                  ),
                  Container(
                    width: getWidth(percentage: Percentage.seventyFive),
                    margin: EdgeInsets.only(top: Doubles.sixteen),
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
                    margin: EdgeInsets.only(top: Doubles.sixteen),
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
                  NumberKeyboard(
                    width: getWidth(percentage: Percentage.eighty),
                    height: getHeight(percentage: Percentage.fifty),
                    onNumberClick: _onNumberClick,
                    onNumberClear: _onNumberClear,
                    onSubmitClick: _onSubmitClick,
                  ),
                  // Container(
                  //   width: getWidth(percentage: Percentage.eighty),
                  //   height: Doubles.fortyEight,
                  //   margin: EdgeInsets.symmetric(vertical: Doubles.sixteen),
                  //   child: RaisedButton(
                  //     child: Text(
                  //       "Submit",
                  //       style: TextStyle(
                  //         color: AppColors.white,
                  //         fontSize: Doubles.sixteen,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     onPressed: _onSubmitClick,
                  //     color: AppColors.red,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(Doubles.twentyFour),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
