import 'package:dating_app/app/theme/app_theme.dart';
import 'package:dating_app/data/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNotifier with ChangeNotifier {
  bool _darkMode = false;
  bool _hindiLanguage = false;

  AppNotifier() {
    _darkMode = DatingPreference.darkMode.boolean;
    _hindiLanguage = DatingPreference.hindiLanguage.boolean;
  }

  ThemeData get theme => _darkMode ? darkTheme : lightTheme;

  changeTheme() {
    _darkMode = DatingPreference.darkMode.boolean;
    notifyListeners();
  }

  Locale get locale => _hindiLanguage ? Locale("hi") : Locale("en");

  changeLanguage() {
    _hindiLanguage = DatingPreference.hindiLanguage.boolean;
    notifyListeners();
  }
}
