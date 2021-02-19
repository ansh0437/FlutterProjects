import 'package:dating_app/app/widgets/number_keyboard.dart';
import 'package:dating_app/app/widgets/otp_field.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:dating_app/constants/strings.dart';
import 'package:dating_app/data/models/country_code_dto.dart';
import 'package:dating_app/generated/l10n.dart';
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
  String _otpString = Strings.empty;
  List<String> _otpList = List<String>.filled(Ints.four, Strings.empty);

  @override
  void initState() {
    super.initState();
  }

  void _resendClick() {
    _updateOtp(Strings.empty);
  }

  void _onNumberClick(String number) {
    if (_otpString.length < maxOtpLength) {
      _updateOtp(_otpString + number);
    }
  }

  void _onNumberClear() {
    if (_otpString.length > 0) {
      _updateOtp(_otpString.substring(0, _otpString.length - 1));
    }
  }

  void _updateOtp(String otp) {
    setState(() {
      _otpString = otp;
      _otpList = _otpString.split(Strings.empty);
      int diff = maxOtpLength - _otpList.length;
      for (var i = 0; i < diff; i++) {
        _otpList.add(Strings.empty);
      }
    });
  }

  void _onSubmitClick() {
    String otp = _otpList.join(Strings.empty).trim();
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
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: Container(
            padding: EdgeInsets.only(left: Doubles.sixteen),
            child: InkWell(
              onTap: closePage,
              customBorder: CircleBorder(),
              child: Icon(
                Icons.keyboard_backspace,
                color: AppColors.red,
                size: Doubles.thirtySix,
              ),
            ),
          ),
          title: Text(
            LocalizedStrings.of(context).otpTitle,
            style: TextStyle(
              fontSize: Doubles.thirtyTwo,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: Doubles.zero,
        ),
        body: SafeArea(
          child: Container(
            width: getWidth(),
            child: Column(
              children: [
                Expanded(
                  flex: Ints.two,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: getWidth(percentage: Percentage.eighty),
                          child: OtpFields(otpList: _otpList),
                        ),
                        Container(
                          width: getWidth(percentage: Percentage.seventyFive),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: Doubles.sixteen,
                              ),
                              children: [
                                TextSpan(
                                  text: LocalizedStrings.of(context).otpDesc,
                                ),
                                TextSpan(
                                  text:
                                      "${_countryCodeDTO.dialCode} $_phoneNumber",
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
                              LocalizedStrings.of(context).resend,
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: Doubles.sixteen,
                              ),
                            ),
                            onPressed: _resendClick,
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.red),
                              borderRadius:
                                  BorderRadius.circular(Doubles.thirty),
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
                    child: Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return NumberKeyboard(
                            width: constraints.maxWidth * Percentage.eighty,
                            height: constraints.maxHeight * Percentage.ninety,
                            onNumberClick: _onNumberClick,
                            onNumberClear: _onNumberClear,
                            onSubmitClick: _onSubmitClick,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
