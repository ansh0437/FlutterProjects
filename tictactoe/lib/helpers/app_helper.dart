import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constants/colors.dart';
import '../constants/numbers.dart';

void _configLoader(darkTheme) {
  EasyLoading.instance
    ..radius = Doubles.ten
    ..maskColor = AppColors.black.withOpacity(0.5)
    ..textColor = darkTheme ? AppColors.white : AppColors.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = Doubles.fortyEight
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorColor = darkTheme ? AppColors.white : AppColors.black
    ..backgroundColor = darkTheme ? AppColors.black : AppColors.white;
}

/// TRUE - In case of Black box with White Loader
/// FALSE - In case of White box with Black Loader
void showLoader({darkTheme: false}) {
  _configLoader(darkTheme);
  EasyLoading.show(
    maskType: EasyLoadingMaskType.custom,
    dismissOnTap: false,
  );
}

void hideLoader() => EasyLoading.dismiss();

/// TRUE - In case of Black box with White Text
/// FALSE - In case of White box with Black Text
void showToast(message, {darkTheme = true}) {
  _configLoader(darkTheme);
  EasyLoading.showToast(message,
      toastPosition: EasyLoadingToastPosition.bottom);
}

void printLog(msg) {
  if (!kReleaseMode) {
    print(msg);
  }
}
