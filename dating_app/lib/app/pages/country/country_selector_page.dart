import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/numbers.dart';
import '../../../data/models/country_code_dto.dart';
import '../base/base_stateful.dart';
import '../base/base_stateless.dart';

class CountrySelectorPage extends BasePage {
  @override
  _CountrySelectorPageState createState() => _CountrySelectorPageState();
}

class _CountrySelectorPageState extends BaseState<CountrySelectorPage> {
  final TextEditingController _searchController = TextEditingController();

  List<CountryCodeDTO> mCountryList = [];
  List<CountryCodeDTO> mFilterList = [];

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
      mFilterList = list;
    });
  }

  void _searchCountryCode(String value) {
    List<CountryCodeDTO> list = [];
    if (value.isNotEmpty) {
      list = mCountryList
          .where(
              (e) => e.countryName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      list = mCountryList;
    }
    setState(() {
      mFilterList = list;
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
        darkScreen: true,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: InkWell(
            onTap: closePage,
            child: Icon(
              Icons.keyboard_backspace,
              color: AppColors.black,
              size: Doubles.thirtySix,
            ),
          ),
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(Doubles.sixteen),
              hintText: "Search...",
              hintStyle: TextStyle(
                fontSize: Doubles.twenty,
                color: AppColors.black,
              ),
            ),
            style: TextStyle(
              fontSize: Doubles.twenty,
              color: AppColors.black,
            ),
            keyboardType: TextInputType.name,
            inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            onChanged: _searchCountryCode,
          ),
        ),
        body: SafeArea(
          child: Container(
              child: mFilterList.isNotEmpty
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: mFilterList.length,
                      itemBuilder: (context, index) => _CountryCodeCell(
                        data: mFilterList[index],
                        onSelect: _onCountryCellClick,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(Doubles.twentyFour),
                      child: Center(
                        child: Text(
                          "No result found",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: Doubles.twentyFour,
                          ),
                        ),
                      ),
                    )),
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
