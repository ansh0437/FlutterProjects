// import 'package:flutter/material.dart';
// import 'package:tictactoe/app/pages/base/base_stateful.dart';
// import 'package:tictactoe/app/ai/ai.dart';
// import 'package:tictactoe/constants/colors.dart';
// import 'package:tictactoe/constants/numbers.dart';

// class GameBox extends BasePage {
//   final borderSide = BorderSide(color: AppColors.black, width: Doubles.two);

//   final double width;
//   final double height;

//   final AI game;

//   GameBox({this.width, this.height, this.game});

//   @override
//   _GameBoxState createState() => _GameBoxState();
// }

// class _GameBoxState extends BaseState<GameBox> {
//   double boxWidth = Doubles.zero;
//   double boxHeight = Doubles.zero;

//   @override
//   void initState() {
//     super.initState();
//     boxWidth =
//         widget.width >= Doubles.threeSixty ? Doubles.threeSixty : widget.width;
//     boxHeight = widget.height >= Doubles.threeSixty
//         ? Doubles.threeSixty
//         : widget.height;
//   }

//   BorderSide _topBorder(int index) {
//     return (index == 3 ||
//             index == 4 ||
//             index == 5 ||
//             index == 6 ||
//             index == 7 ||
//             index == 8)
//         ? widget.borderSide
//         : BorderSide.none;
//   }

//   BorderSide _rightBorder(int index) {
//     return (index == 0 ||
//             index == 1 ||
//             index == 3 ||
//             index == 4 ||
//             index == 6 ||
//             index == 7)
//         ? widget.borderSide
//         : BorderSide.none;
//   }

//   void _onCellClick(int index) {
//     bool isMoved = widget.game.playMove(index);

//     if (isMoved) {
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: boxWidth,
//       height: boxHeight,
//       padding: EdgeInsets.all(Doubles.eight),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         border: Border.all(
//           color: AppColors.black,
//           width: Doubles.two,
//         ),
//         borderRadius: BorderRadius.circular(Doubles.thirtySix),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.greyLight,
//             offset: Offset(0.0, 1.0),
//             blurRadius: Doubles.twentyFour,
//           )
//         ],
//       ),
//       child: GridView.builder(
//         itemCount: Ints.nine,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: Ints.three,
//         ),
//         itemBuilder: (_, index) {
//           return InkWell(
//             onTap: () => _onCellClick(index),
//             // customBorder: CircleBorder(),
//             // splashColor: AppColors.redLight,
//             child: Container(
//               padding: EdgeInsets.all(Doubles.twentyFour),
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: _topBorder(index),
//                   right: _rightBorder(index),
//                 ),
//               ),
//               child: widget.game.cellIcon(index),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
