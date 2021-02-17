import 'dart:convert';

import 'package:dating_app/app/pages/base/base_stateful.dart';
import 'package:dating_app/app/pages/base/base_stateless.dart';
import 'package:dating_app/constants/assets.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/constants/numbers.dart';
import 'package:dating_app/data/models/country_code_dto.dart';
import 'package:flutter/material.dart';

class CountrySelectorPage extends BasePage {
  @override
  _CountrySelectorPageState createState() => _CountrySelectorPageState();
}

class _CountrySelectorPageState extends BaseState<CountrySelectorPage> {
  List<CountryCodeDTO> mCountryList = [];

  @override
  void initState() {
    super.initState();
    _getCountryList();
  }

  void _getCountryList() async {
    String data =
        await DefaultAssetBundle.of(context).loadString(DaterJson.countryCodes);
    List<dynamic> jsonResult = json.decode(data);

    List<CountryCodeDTO> list =
        jsonResult.map((e) => CountryCodeDTO.fromMap(e)).toList();

    list.sort((e1, e2) => e1.countryName.compareTo(e2.countryName));

    setState(() {
      mCountryList = list;
    });
  }

  void _onCountryCellClick(CountryCodeDTO dto) {
    closePage(data: dto);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPop,
      child: buildScaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
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
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: mCountryList.length,
                    itemBuilder: (context, index) => _CountryCodeCell(
                      data: mCountryList[index],
                      onSelect: _onCountryCellClick,
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

class _CountryCodeCell extends BasePageStateless {
  final CountryCodeDTO data;

  final Function onSelect;

  _CountryCodeCell({this.data, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(data);
      },
      child: Container(
        // color: AppColors.green,
        margin: EdgeInsets.all(Doubles.eight),
        padding: EdgeInsets.symmetric(
          horizontal: Doubles.twentyFour,
          vertical: Doubles.eight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: Ints.four,
              child: Container(
                child: Text(
                  data.countryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Doubles.eighteen,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: Ints.one,
              child: Container(
                child: Text(
                  data.dialCode,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: Doubles.eighteen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
