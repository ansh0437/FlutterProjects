import 'dart:convert';

import 'package:dating_app/app/pages/base/base_stateful.dart';
import 'package:dating_app/app/pages/country/country_selector_page.dart';
import 'package:dating_app/constants/assets.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:dating_app/constants/pages.dart';
import 'package:dating_app/constants/strings.dart';
import 'package:dating_app/data/models/country_code_dto.dart';
import 'package:dating_app/helpers/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPhonePage extends BasePage {
  @override
  _LoginEmailPageState createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends BaseState<BasePage> {
  final TextEditingController _phoneController = TextEditingController();

  CountryCodeDTO _countryCodeDTO =
      CountryCodeDTO(countryName: "India", countryCode: "IN", dialCode: "+91");

  @override
  void initState() {
    super.initState();
  }

  void _countryCodeSelector() async {
    final dto = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountrySelectorPage(),
      ),
    );

    if (dto != null && dto is CountryCodeDTO) {
      setState(() {
        _countryCodeDTO = dto;
      });
    }

    // String data =
    //     await DefaultAssetBundle.of(context).loadString(DaterJson.countryCodes);
    // List<dynamic> jsonResult = json.decode(data);

    // List<CountryCodeDTO> list =
    //     jsonResult.map((e) => CountryCodeDTO.fromMap(e)).toList();

    // list.sort((e1, e2) => e1.countryName.compareTo(e2.countryName));

    // showModalBottomSheet(
    //     context: scaffoldKey.currentState.context,
    //     // isScrollControlled: true,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(Doubles.twentyFour),
    //         topRight: Radius.circular(Doubles.twentyFour),
    //       ),
    //     ),
    //     builder: (context) {
    //       return SafeArea(
    //         child: Container(
    //           // height: getHeight(percentage: Percentage.sixty),
    //           margin: EdgeInsets.only(top: Doubles.sixteen),
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 decoration: InputDecoration(
    //                   labelText: "Search",
    //                   counterText: Strings.empty,
    //                 ),
    //                 keyboardType: TextInputType.name,
    //                 inputFormatters: [
    //                   FilteringTextInputFormatter.singleLineFormatter
    //                 ],
    //               ),
    //               Flexible(
    //                 child: ListView.builder(
    //                   physics: BouncingScrollPhysics(),
    //                   itemCount: list.length,
    //                   itemBuilder: (context, index) {
    //                     return Container(
    //                       padding: EdgeInsets.all(Doubles.sixteen),
    //                       child: Text(list[index].countryName),
    //                     );
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     });
  }

  void _continueClick() {}

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
                          Icons.keyboard_backspace,
                          color: AppColors.red,
                          size: Doubles.thirtySix,
                        ),
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   DaterIcons.logo,
                  //   width: Doubles.sixty,
                  //   height: Doubles.sixty,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(Doubles.eight),
                    child: Text(
                      "Whats your number?",
                      style: TextStyle(
                        fontSize: Doubles.twentyEight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: getWidth(percentage: Percentage.ninety),
                    margin: EdgeInsets.only(top: Doubles.twentyFour),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: _countryCodeSelector,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.greyLight),
                              borderRadius:
                                  BorderRadius.circular(Doubles.eight),
                            ),
                            height: Doubles.sixty,
                            padding: EdgeInsets.symmetric(
                              horizontal: Doubles.eight,
                            ),
                            child: Center(
                              child: Text(
                                _countryCodeDTO.displayCode,
                                style: TextStyle(
                                  fontSize: Doubles.sixteen,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Doubles.eight),
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              counterText: Strings.empty,
                            ),
                            keyboardType: TextInputType.phone,
                            maxLength: Ints.sixteen,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: getWidth(percentage: Percentage.ninety),
                    margin: EdgeInsets.symmetric(vertical: Doubles.twentyFour),
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
                                  "When you tap on \"Continue\", Dater will send a text with verification code. Message and data charges may apply. The verified phone number can be used to log in. "),
                          TextSpan(
                              text:
                                  "Learn what happens when your phone number changes.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: getWidth(percentage: Percentage.eighty),
                    height: Doubles.fortyEight,
                    margin: EdgeInsets.symmetric(vertical: Doubles.eight),
                    child: RaisedButton(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: Doubles.sixteen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _continueClick,
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
