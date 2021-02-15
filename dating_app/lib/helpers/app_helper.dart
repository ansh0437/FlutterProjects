import 'package:flutter/foundation.dart';

void printLog(msg) {
  if (!kReleaseMode) {
    print(msg);
  }
}
