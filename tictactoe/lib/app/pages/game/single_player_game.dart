import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/pages/base/base_stateful.dart';
import 'package:tictactoe/app/pages/game/game_ui.dart';
import 'package:tictactoe/constants/assets.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:tictactoe/constants/enums.dart';
import 'package:tictactoe/constants/numbers.dart';
import 'package:tictactoe/data/models/score_model.dart';

class SinglePlayerGame extends BasePage {
  @override
  _SinglePlayerGameState createState() => _SinglePlayerGameState();
}

class _SinglePlayerGameState extends BaseState<SinglePlayerGame> {
  Player _whoseTurn = Player.AI;

  final SvgPicture _crossIcon = SvgPicture.asset(AppIcon.cross,
      width: Doubles.thirtySix, height: Doubles.thirtySix);

  final SvgPicture _circleIcon = SvgPicture.asset(AppIcon.circle,
      width: Doubles.forty, height: Doubles.forty);

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
            children: [
              // Container(
              //   padding: EdgeInsets.all(Doubles.sixteen),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       _scoreBox(dto: _winScore),
              //       _scoreBox(dto: _drawScore),
              //       _scoreBox(dto: _loseScore),
              //     ],
              //   ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Doubles.sixteen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _playerBox(playerType: Player.AI),
                    _playerBox(playerType: Player.HUMAN),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) => GameBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: AppColors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Doubles.sixteen))),
                child: Container(
                  width: screenWidth - (screenWidth / Ints.three),
                  height: Doubles.fortyEight,
                  child: Center(
                    child: Text(
                      "Reset Game",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Doubles.eighteen,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Doubles.twentyFour),
            ],
          ),
        ),
      ),
    );
  }

  Widget _playerBox({@required Player playerType}) {
    return Container(
      width: getWidth(percentage: Percentage.forty),
      padding: EdgeInsets.symmetric(vertical: Doubles.sixteen),
      decoration: BoxDecoration(
        color: playerType == _whoseTurn
            ? AppColors.purpleLightest
            : AppColors.greyLightest,
        borderRadius: BorderRadius.circular(Doubles.sixteen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          playerType == Player.AI ? _crossIcon : _circleIcon,
          SizedBox(height: Doubles.eight),
          Text(
            playerType == Player.AI ? "AI" : "You",
            style: TextStyle(
              fontSize: Doubles.twentyFour,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreBox({@required ScoreDTO dto}) {
    return Container(
      width: getWidth(percentage: Percentage.twentyFive),
      padding: EdgeInsets.symmetric(
          vertical: Doubles.eight, horizontal: Doubles.eight),
      decoration: BoxDecoration(
        color: dto.boxColor(),
        borderRadius: BorderRadius.circular(Doubles.sixteen),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dto.displayType(),
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.black, fontSize: Doubles.twenty),
          ),
          SizedBox(height: Doubles.four),
          Text(
            dto.score.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: Doubles.twenty,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
