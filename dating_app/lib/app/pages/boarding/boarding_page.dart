import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/numbers.dart';
import '../../../data/models/boarding_dto.dart';
import '../base/base_stateless.dart';

class BoardingPage extends BasePageStateless {
  final BoardingDTO mBoardingDTO;

  BoardingPage(this.mBoardingDTO);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: Doubles.sixteen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                mBoardingDTO.title,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: Doubles.thirtySix,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: getWidth(context, percentage: Percentage.seventyFive),
                padding: EdgeInsets.symmetric(vertical: Doubles.sixteen),
                child: Image.asset(mBoardingDTO.image, fit: BoxFit.contain),
              ),
            ),
            Container(
              width: Doubles.threeForty,
              child: Text(
                mBoardingDTO.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: Doubles.twenty,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
