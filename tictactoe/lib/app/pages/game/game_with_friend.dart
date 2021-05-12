import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/app/pages/base/base_stateful.dart';
import 'package:tictactoe/app/pages/game/game.dart';
import 'package:tictactoe/app/pages/game/game_ui.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/data/models/score_model.dart';
import 'package:tictactoe/helpers/app_helper.dart';
import 'package:tictactoe/notifiers/game_notifier.dart';

class GameWithFriend extends BasePage {
  final borderSide = BorderSide(color: AppColors.black, width: Doubles.two);

  @override
  _GameWithFriendState createState() => _GameWithFriendState();
}

class _GameWithFriendState extends BaseState<GameWithFriend> {
  Game _game = Game.instance;

  @override
  void initState() {
    super.initState();
  }

  void _onCellClick(int index) {
    if (_game.notOccupied(index)) {
      if (_game.playMove(index)) {
        String message = _game.checkWinner();
        if (message.isNotEmpty) {
          _showWinnerDialog(message);
        }
        setState(() {});
      }
    } else {
      showToast("Occupied");
    }
  }

  void _showWinnerDialog(String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Doubles.sixteen),
              ),
              child: Container(
                padding: EdgeInsets.all(Doubles.twelve),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Info",
                        style: TextStyle(
                          fontSize: Doubles.twentyFour,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: Doubles.eight),
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: Doubles.eighteen,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          _onRefreshGame();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Doubles.eight),
                          ),
                        ),
                        child: Container(
                          width: Doubles.eighty,
                          child: Center(
                            child: Text(
                              "Okay",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: Doubles.sixteen,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  void _onRefreshGame() {
    _game.onRefreshBoard();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Doubles.sixteen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _playerBox(playerType: Player.ONE),
                    _scoreBox(),
                    _playerBox(playerType: Player.TWO),
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
    );
  }

  Widget _playerBox({@required Player playerType}) {
    return Container(
      width: getWidth(percentage: Percentage.twentyFive),
      height: Doubles.eighty,
      padding: EdgeInsets.all(Doubles.four),
      decoration: BoxDecoration(
        color: playerType == _game.currentPlayer
            ? AppColors.purpleLightest
            : AppColors.greyLightest,
        borderRadius: BorderRadius.circular(Doubles.sixteen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: playerType == Player.ONE
                ? _game.playerOneIcon
                : _game.playerTwoIcon,
          ),
          Text(
            playerType == Player.ONE
                ? _game.playerOneName
                : _game.playerTwoName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Doubles.sixteen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreBox() {
    return Container(
      width: getWidth(percentage: Percentage.twentyFive),
      height: Doubles.forty,
      padding: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(Doubles.twelve),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: Doubles.four,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _scoreLabel(_game.playerOneWins.toString()),
          _scoreLabel("-"),
          _scoreLabel(_game.playerTwoWins.toString()),
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
    double boxWidth = width >= Doubles.threeSixty ? Doubles.threeSixty : width;
    double boxHeight =
        height >= Doubles.threeSixty ? Doubles.threeSixty : height;

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
              child: _game.cellIcon(index),
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
