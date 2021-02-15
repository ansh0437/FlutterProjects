import 'package:dating_app/constants/numbers.dart';
import 'package:flutter/material.dart';

import '../pages/base/base_stateless.dart';

class CurvedContainer extends BasePageStateless {
  final double width;
  final double height;

  CurvedContainer({this.width, this.height}) : super();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: width,
        height: height / Ints.two,
      ),
      painter: HeaderCurvedContainer(),
    );
  }
}

// CustomPainter class to for the header curved-container
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red;

    double width = size.width;
    double height = size.height;
    double curveHeight = Doubles.sixtyFour;

    Path path = Path()
      ..relativeLineTo(0, height - curveHeight)
      ..quadraticBezierTo(width / 2, height, width, height - curveHeight)
      ..relativeLineTo(0, -(height - curveHeight))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
