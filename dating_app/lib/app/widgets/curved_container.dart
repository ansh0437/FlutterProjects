import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/numbers.dart';
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
    Paint paint = Paint()..color = AppColors.red;

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

// CustomPainter class to for the bottom curved-container
class BottomCurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColors.red;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.417);

    path.quadraticBezierTo(size.width * 0.25, size.height * 0.325,
        size.width * 0.5, size.height * 0.367);

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.404,
        size.width * 1.0, size.height * 0.317);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
