import 'package:dating_app/constants/pages.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/numbers.dart';
import '../../../generated/l10n.dart';
import '../../../helpers/app_helper.dart';
import '../base/base_stateful.dart';

class RulesPage extends BasePage {
  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends BaseState<RulesPage> {
  void _onClick() {
    /// TODO
    // DatingPreference.rulesAccepted.save(true);
    replacePage(Pages.loginWithPhone);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: buildScaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: getWidth(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          Icons.close,
                          color: AppColors.red,
                          size: Doubles.thirtySix,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    DaterIcons.logo,
                    width: Doubles.sixty,
                    height: Doubles.sixty,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Doubles.eight),
                    child: Text(
                      LocalizedStrings.of(context).ruleTitle,
                      style: TextStyle(
                        fontSize: Doubles.twentyEight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: getWidth(percentage: Percentage.eighty),
                    child: Text(
                      LocalizedStrings.of(context).ruleDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Doubles.sixteen,
                      ),
                    ),
                  ),
                  SizedBox(height: Doubles.twentyFour),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     _buildRuleBox(
                  //       title: LocalizedStrings.of(context).ruleOneTitle,
                  //       description: LocalizedStrings.of(context).ruleOneDesc,
                  //     ),
                  //     _buildRuleBox(
                  //       title: LocalizedStrings.of(context).ruleTwoTitle,
                  //       description: LocalizedStrings.of(context).ruleTwoDesc,
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     _buildRuleBox(
                  //       title: LocalizedStrings.of(context).ruleThreeTitle,
                  //       description: LocalizedStrings.of(context).ruleThreeDesc,
                  //     ),
                  //     _buildRuleBox(
                  //       title: LocalizedStrings.of(context).ruleFourTitle,
                  //       description: LocalizedStrings.of(context).ruleFourDesc,
                  //     ),
                  //   ],
                  // ),
                  _buildRuleBox(
                    title: LocalizedStrings.of(context).ruleOneTitle,
                    description: LocalizedStrings.of(context).ruleOneDesc,
                  ),
                  SizedBox(height: Doubles.eight),
                  _buildRuleBox(
                    title: LocalizedStrings.of(context).ruleTwoTitle,
                    description: LocalizedStrings.of(context).ruleTwoDesc,
                  ),
                  SizedBox(height: Doubles.eight),
                  _buildRuleBox(
                    title: LocalizedStrings.of(context).ruleThreeTitle,
                    description: LocalizedStrings.of(context).ruleThreeDesc,
                  ),
                  SizedBox(height: Doubles.eight),
                  _buildRuleBox(
                    title: LocalizedStrings.of(context).ruleFourTitle,
                    description: LocalizedStrings.of(context).ruleFourDesc,
                  ),
                  Container(
                    width: getWidth() - Doubles.fortyEight,
                    height: Doubles.fortyEight,
                    margin: EdgeInsets.symmetric(vertical: Doubles.thirty),
                    child: RaisedButton(
                      child: Text(
                        LocalizedStrings.of(context).iUnderstand,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: Doubles.sixteen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _onClick,
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

  Widget _buildRuleBox({title, description}) {
    return Container(
      width: getWidth(percentage: Percentage.ninety),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: Doubles.eight),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Doubles.eighteen,
              ),
            ),
          ),
          Container(
            width: getWidth(percentage: Percentage.ninety),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyTransparent),
              borderRadius: BorderRadius.circular(Doubles.eight),
            ),
            margin: EdgeInsets.symmetric(vertical: Doubles.eight),
            padding: EdgeInsets.symmetric(
              vertical: Doubles.ten,
              horizontal: Doubles.eight,
            ),
            child: Text(
              description,
              style: TextStyle(color: AppColors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
