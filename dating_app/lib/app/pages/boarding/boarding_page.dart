import 'package:flutter/material.dart';

import '../base/base_stateless.dart';
import '../../../constants/numbers.dart';
import '../../../data/models/boarding_dto.dart';

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
                  color: Colors.white,
                  fontSize: Doubles.thirtySix,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: Doubles.sixteen),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Doubles.twenty),
                ),
                child: Image.asset(mBoardingDTO.image),
              ),
            ),
            Container(
              width: Doubles.threeForty,
              child: Text(
                mBoardingDTO.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade700,
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
