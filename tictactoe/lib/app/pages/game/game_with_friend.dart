import 'package:flutter/material.dart';
import 'package:tictactoe/app/ai/ai.dart';
import 'package:tictactoe/app/pages/base/base_stateful.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/constants/strings.dart';
import 'package:tictactoe/helpers/dialog_helper.dart';

import '../../../constants/numbers.dart';

class GameWithFriend extends BasePage {
  final borderSide = BorderSide(color: AppColors.black, width: Doubles.two);

  @override
  _GameWithFriendState createState() => _GameWithFriendState();
}

class _GameWithFriendState extends BaseState<GameWithFriend> {
  AI _ai = AI.instance;

  @override
  void initState() {
    super.initState();
  }

  void _onCellClick(int index) {
    if (_ai.notOccupied(index)) {
      if (_ai.playMove(index)) {
        String message = _ai.checkWinner();
        if (message.isNotEmpty) {
          _showWinnerDialog(message);
        }
        setState(() {});
      }
    }
  }

  void _showWinnerDialog(String message) {
    DialogHelper.instance.showWinner(
      context: context,
      message: message,
      okClick: _onRefreshGame,
    );
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       return Dialog(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(Doubles.sixteen),
    //           ),
    //           child: Container(
    //             padding: EdgeInsets.all(Doubles.twelve),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: <Widget>[
    //                 Container(
    //                   child: Text(
    //                     "Info",
    //                     style: TextStyle(
    //                       fontSize: Doubles.twentyFour,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: EdgeInsets.symmetric(vertical: Doubles.eight),
    //                   child: Text(
    //                     message,
    //                     style: TextStyle(
    //                       fontSize: Doubles.eighteen,
    //                       color: AppColors.black,
    //                     ),
    //                   ),
    //                 ),
    //                 Align(
    //                   alignment: Alignment.bottomRight,
    //                   child: ElevatedButton(
    //                     onPressed: () {
    //                       _onRefreshGame();
    //                       Navigator.pop(context);
    //                     },
    //                     style: ElevatedButton.styleFrom(
    //                       primary: AppColors.purple,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(Doubles.eight),
    //                       ),
    //                     ),
    //                     child: Container(
    //                       width: Doubles.eighty,
    //                       child: Center(
    //                         child: Text(
    //                           "Okay",
    //                           style: TextStyle(
    //                             color: AppColors.white,
    //                             fontSize: Doubles.sixteen,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ));
    //     });
  }

  void _onRefreshGame() {
    _ai.refreshBoard();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context).settings.arguments;

    if (data is Map<String, dynamic>) {
      _ai.setData(data);
    }

    double screenWidth = getWidth();

    screenWidth =
        screenWidth <= Doubles.fiveTwenty ? screenWidth : Doubles.fourEighty;

    return buildScaffold(
      title: Strings.appName,
      body: SafeArea(
        child: Center(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(vertical: Doubles.sixteen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _playerBox(
                          width: screenWidth * Percentage.twentyFive,
                          playerType: Player.ONE),
                      _scoreBox(width: screenWidth * Percentage.twentyFive),
                      _playerBox(
                          width: screenWidth * Percentage.twentyFive,
                          playerType: Player.TWO),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) =>
                          _gameBox(constraints.maxWidth, constraints.maxHeight),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyLightest,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: Doubles.eight,
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.refresh_sharp),
                    iconSize: Doubles.forty,
                    color: AppColors.black,
                    onPressed: _onRefreshGame,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _playerBox({@required double width, @required Player playerType}) {
    return Container(
      width: width,
      height: Doubles.eighty,
      padding: EdgeInsets.all(Doubles.four),
      decoration: BoxDecoration(
        color: playerType == _ai.currentPlayer
            ? AppColors.purpleLightest
            : AppColors.greyLightest,
        borderRadius: BorderRadius.circular(Doubles.twelve),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: playerType == Player.ONE
                ? _ai.playerOneIcon
                : _ai.playerTwoIcon,
          ),
          Text(
            playerType == Player.ONE ? _ai.playerOneName : _ai.playerTwoName,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _scoreBox({@required double width}) {
    return Container(
      width: width,
      height: Doubles.forty,
      padding: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Doubles.twelve),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyLight,
            offset: Offset(0.0, 1.0),
            blurRadius: Doubles.four,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _scoreLabel(_ai.playerOneWins.toString()),
          _scoreLabel("-"),
          _scoreLabel(_ai.playerTwoWins.toString()),
        ],
      ),
    );
  }

  Widget _scoreLabel(String lbl) {
    return Container(
      child: Text(
        lbl,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.black,
          fontSize: Doubles.twenty,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _gameBox(double width, double height) {
    double boxWidth = width >= Doubles.threeSixty ? Doubles.threeTwenty : width;
    double boxHeight =
        height >= Doubles.threeSixty ? Doubles.threeTwenty : height;

    return Container(
      width: boxWidth,
      height: boxHeight,
      padding: EdgeInsets.all(Doubles.eight),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.black,
          width: Doubles.two,
        ),
        borderRadius: BorderRadius.circular(Doubles.thirtySix),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyLight,
            offset: Offset(0.0, 1.0),
            blurRadius: Doubles.twentyFour,
          )
        ],
      ),
      child: GridView.builder(
        itemCount: Ints.nine,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Ints.three,
        ),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => _onCellClick(index),
            // customBorder: CircleBorder(),
            // splashColor: AppColors.redLight,
            child: Container(
              padding: EdgeInsets.all(Doubles.twentyFour),
              decoration: BoxDecoration(
                border: Border(
                  top: _topBorder(index),
                  right: _rightBorder(index),
                ),
              ),
              child: _ai.cellIcon(index),
            ),
          );
        },
      ),
    );
  }

  BorderSide _topBorder(int index) {
    return (index == 3 ||
            index == 4 ||
            index == 5 ||
            index == 6 ||
            index == 7 ||
            index == 8)
        ? widget.borderSide
        : BorderSide.none;
  }

  BorderSide _rightBorder(int index) {
    return (index == 0 ||
            index == 1 ||
            index == 3 ||
            index == 4 ||
            index == 6 ||
            index == 7)
        ? widget.borderSide
        : BorderSide.none;
  }
}
