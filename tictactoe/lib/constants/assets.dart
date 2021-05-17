import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/constants/numbers.dart';

class AppImage {
  static const String _imageAssets = "assets/images/";
}

class AppIcon {
  static const String _iconAssets = "assets/icons/";

  static const String logo = "${_iconAssets}logo.svg";

  static const String cross = "${_iconAssets}cross.svg";
  static const String circle = "${_iconAssets}circle.svg";

  static const String winner = "${_iconAssets}winner.svg";

  static final SvgPicture crossIcon = SvgPicture.asset(
      "${_iconAssets}cross.svg",
      width: Doubles.twentySix,
      height: Doubles.twentySix);

  static final SvgPicture circleIcon = SvgPicture.asset(
      "${_iconAssets}circle.svg",
      width: Doubles.thirty,
      height: Doubles.thirty);
}

class AppJson {
  static const String _jsonAssets = "assets/json/";
}
