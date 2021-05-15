import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/pages/base/base_stateful.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/constants/pages.dart';
import 'package:tictactoe/constants/strings.dart';
import 'package:tictactoe/helpers/app_helper.dart';
import 'package:tictactoe/helpers/utils.dart';

class ChooseSide extends BasePage {
  @override
  _ChooseSideState createState() => _ChooseSideState();
}

class _ChooseSideState extends BaseState<ChooseSide> {
  GameType _gameType;

  bool _isCrossSelected = true;

  String _playerOneName = Strings.empty;
  String _playerTwoName = Strings.empty;

  @override
  void initState() {
    super.initState();
  }

  void _onContinueClick() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (_gameType == GameType.AI) {
      if (_playerOneName.isEmpty) {
        showToast("Enter your nickname");
        return;
      }
      _playerTwoName = "AI";
    } else {
      if (_playerOneName.isEmpty) {
        showToast("Enter player one name");
        return;
      }

      if (_playerTwoName.isEmpty) {
        showToast("Enter player two name");
        return;
      }
    }

    replacePage(
      Pages.playGame,
      data: {
        "game_type": _gameType,
        "player_one": _playerOneName,
        "player_two": _playerTwoName,
        "player_one_side": _isCrossSelected
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context).settings.arguments;

    if (data is GameType) {
      _gameType = data;
    }

    double screenWidth = getWidth();
    double screenHeight = getHeight();

    screenWidth =
        screenWidth <= Doubles.fiveTwenty ? screenWidth : Doubles.fourEighty;

    double containerHeight = screenHeight * Percentage.seventyFive;
    // double boxHeight = screenHeight * Percentage.twentyFive;

    if (containerHeight < Doubles.fourEighty) {
      containerHeight = Doubles.fourEighty;
    }

    return buildScaffold(
      title: Strings.appName,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: screenWidth,
              height: containerHeight,
              // color: AppColors.green,
              padding: EdgeInsets.symmetric(
                vertical: Doubles.twentyFour,
                horizontal: Doubles.sixteen,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: Doubles.sixteen),
                  Container(
                    // height: boxHeight,
                    // color: AppColors.green,
                    child: Center(
                      child: _gameType == GameType.AI
                          ? _buildSinglePlayerBox()
                          : _buildTwoPlayerBox(),
                    ),
                  ),
                  // SizedBox(height: Doubles.sixtyFour),
                  Expanded(
                    child: Container(
                      // height: boxHeight,
                      // color: AppColors.blue,
                      padding: EdgeInsets.only(bottom: Doubles.twentyFour),
                      child: Center(child: _buildSideChooserBox()),
                    ),
                  ),
                  // SizedBox(height: Doubles.sixtyFour),
                  Container(
                    // height: boxHeight,
                    // color: AppColors.red,
                    // padding: EdgeInsets.all(Doubles.twentyFour),
                    child: Center(
                      child: Container(
                        width: screenWidth * Percentage.seventyFive,
                        height: Doubles.fortyEight,
                        child: ElevatedButton(
                          onPressed: _onContinueClick,
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Doubles.twelve),
                            ),
                            shadowColor: AppColors.grey,
                            elevation: Doubles.eight,
                          ),
                          child: Container(
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: Doubles.eighteen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
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

  Widget _buildSinglePlayerBox() {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        // color: AppColors.green,
        width: constraints.maxWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: constraints.maxWidth * Percentage.forty,
              child: Text(
                "Your nickname",
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: Doubles.sixteen,
                ),
              ),
            ),
            Container(
              width: constraints.maxWidth * Percentage.sixty,
              child: TextFormField(
                decoration: InputDecoration(
                  counterText: Strings.empty,
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                inputFormatters: Utils.onlyTextFormatter(),
                maxLines: Ints.one,
                maxLength: Ints.twenty,
                initialValue: _playerOneName,
                onChanged: (value) {
                  setState(() {
                    _playerOneName = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTwoPlayerBox() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double textFieldWidth = (constraints.maxWidth * Percentage.fifty) - Doubles.eight;
        return Container(
          width: constraints.maxWidth,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // color: AppColors.green,
                    // width: constraints.maxWidth * Percentage.forty,
                    child: Text(
                      "Player one",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: Doubles.sixteen,
                      ),
                    ),
                  ),
                  Container(
                    width: textFieldWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                        counterText: Strings.empty,
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
                      inputFormatters: Utils.onlyTextFormatter(),
                      maxLines: Ints.one,
                      maxLength: Ints.twenty,
                      initialValue: _playerOneName,
                      onChanged: (value) {
                        setState(() {
                          _playerOneName = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: Doubles.sixteen),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // width: constraints.maxWidth * Percentage.forty,
                    child: Text(
                      "Player two",
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: Doubles.sixteen,
                      ),
                    ),
                  ),
                  Container(
                    width: textFieldWidth,
                    child: TextFormField(
                      decoration: InputDecoration(
                        counterText: Strings.empty,
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
                      inputFormatters: Utils.onlyTextFormatter(),
                      maxLines: Ints.one,
                      maxLength: Ints.twenty,
                      initialValue: _playerTwoName,
                      onChanged: (value) {
                        setState(() {
                          _playerTwoName = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSideChooserBox() {
    return Container(
      padding: EdgeInsets.all(Doubles.sixteen),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$_playerOneName pick your side",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Doubles.twenty,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Doubles.thirtyTwo),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSideIconBox(forCross: true, isSelected: _isCrossSelected),
              _buildSideIconBox(forCross: false, isSelected: !_isCrossSelected),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSideIconBox(
      {@required bool forCross, @required bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          _isCrossSelected = forCross;
        });
      },
      child: Container(
        width: Doubles.hundred,
        height: Doubles.hundred,
        padding: EdgeInsets.all(Doubles.twentyFour),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purple : AppColors.greyLightest,
          borderRadius: BorderRadius.circular(Doubles.twelve),
          boxShadow: [
            BoxShadow(
              color: isSelected ? AppColors.purpleLight : AppColors.greyLight,
              offset: Offset(0.0, 1.0),
              blurRadius: isSelected ? Doubles.twentyFour : Doubles.zero,
            )
          ],
        ),
        child: SvgPicture.asset(forCross ? AppIcon.cross : AppIcon.circle),
      ),
    );
  }
}
