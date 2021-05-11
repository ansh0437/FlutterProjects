import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/pages/base/base_stateful.dart';
import 'package:tictactoe/app/pages/game/game_ui.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/data/models/score_model.dart';

class GameWithFriend extends BasePage {
  @override
  _GameWithFriendState createState() => _GameWithFriendState();
}

class _GameWithFriendState extends BaseState<GameWithFriend> {
  Player _whoseTurn = Player.ONE;

  final SvgPicture _crossIcon = SvgPicture.asset(AppIcon.cross,
      width: Doubles.thirty, height: Doubles.thirty);

  final SvgPicture _circleIcon = SvgPicture.asset(AppIcon.circle,
      width: Doubles.thirtySix, height: Doubles.thirtySix);

  int _playerOneWins = 123; // Ints.zero;
  int _playerTwoWins = 456; // Ints.zero;

  ScoreDTO _winScore = ScoreDTO(scoreType: ScoreType.Win);
  ScoreDTO _drawScore = ScoreDTO(scoreType: ScoreType.Draw);
  ScoreDTO _loseScore = ScoreDTO(scoreType: ScoreType.Lose);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = getWidth();
    double screenHeight = getHeight();

    return buildScaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    builder: (context, constraints) => GameBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _playerBox({@required Player playerType}) {
    return Container(
      width: getWidth(percentage: Percentage.thirty),
      height: Doubles.hundred,
      padding: EdgeInsets.symmetric(
        vertical: Doubles.sixteen,
        horizontal: Doubles.eight,
      ),
      decoration: BoxDecoration(
        color: playerType == _whoseTurn
            ? AppColors.purpleLightest
            : AppColors.greyLightest,
        borderRadius: BorderRadius.circular(Doubles.sixteen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          playerType == Player.ONE ? _crossIcon : _circleIcon,
          Text(
            playerType == Player.ONE ? "Player One" : "Player Two",
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
      height: Doubles.fortyEight,
      padding: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(Doubles.sixteen),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _scoreLabel(_playerOneWins.toString()),
          _scoreLabel("-"),
          _scoreLabel(_playerTwoWins.toString()),
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
}
