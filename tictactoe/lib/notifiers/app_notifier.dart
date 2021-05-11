import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/theme/app_theme.dart';
import '../data/preferences.dart';

class AppNotifier with ChangeNotifier {
  bool _darkMode = false;
  bool _hindiLanguage = false;

  AppNotifier() {
    _darkMode = AppPreference.darkMode.boolean;
    _hindiLanguage = AppPreference.hindiLanguage.boolean;
  }

  ThemeData get theme => _darkMode ? darkTheme : lightTheme;

  changeTheme() {
    _darkMode = AppPreference.darkMode.boolean;
    notifyListeners();
  }

  Locale get locale => _hindiLanguage ? Locale("hi") : Locale("en");

  changeLanguage() {
    _hindiLanguage = AppPreference.hindiLanguage.boolean;
    notifyListeners();
  }
}
