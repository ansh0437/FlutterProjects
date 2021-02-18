import 'package:dating_app/app/pages/base/base_stateless.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:flutter/material.dart';

class OtpFields extends BasePageStateless {
  OtpFields({
    this.otpList,
  });

  final List<String> otpList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Doubles.threeSixty,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i in otpList) _buildOtpBox(i),
        ],
      ),
    );
  }

  Widget _buildOtpBox(String value) {
    return Container(
      width: Doubles.fiftyTwo,
      height: Doubles.fiftyTwo,
      decoration: BoxDecoration(
        color: value.isEmpty ? AppColors.greyLight : AppColors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          value.isEmpty ? "-" : value,
          style: TextStyle(
            fontSize: Doubles.twentyFour,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
