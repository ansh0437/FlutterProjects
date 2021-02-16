// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class LocalizedStrings {
  LocalizedStrings();
  
  static LocalizedStrings current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<LocalizedStrings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      LocalizedStrings.current = LocalizedStrings();
      
      return LocalizedStrings.current;
    });
  } 

  static LocalizedStrings of(BuildContext context) {
    return Localizations.of<LocalizedStrings>(context, LocalizedStrings);
  }

  /// `Dating`
  String get appName {
    return Intl.message(
      'Dating',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Login with phone number`
  String get loginWithPhone {
    return Intl.message(
      'Login with phone number',
      name: 'loginWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Login with email address`
  String get loginWithEmail {
    return Intl.message(
      'Login with email address',
      name: 'loginWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Dater`
  String get ruleTitle {
    return Intl.message(
      'Welcome to Dater',
      name: 'ruleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please follow these club rules when using the app.`
  String get ruleDesc {
    return Intl.message(
      'Please follow these club rules when using the app.',
      name: 'ruleDesc',
      desc: '',
      args: [],
    );
  }

  /// `Be yourself.`
  String get ruleOneTitle {
    return Intl.message(
      'Be yourself.',
      name: 'ruleOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload only your own photos, age and bio that's yours`
  String get ruleOneDesc {
    return Intl.message(
      'Upload only your own photos, age and bio that\'s yours',
      name: 'ruleOneDesc',
      desc: '',
      args: [],
    );
  }

  /// `Be cool.`
  String get ruleTwoTitle {
    return Intl.message(
      'Be cool.',
      name: 'ruleTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Stay chill and treat others with respect and dignity`
  String get ruleTwoDesc {
    return Intl.message(
      'Stay chill and treat others with respect and dignity',
      name: 'ruleTwoDesc',
      desc: '',
      args: [],
    );
  }

  /// `Be safe.`
  String get ruleThreeTitle {
    return Intl.message(
      'Be safe.',
      name: 'ruleThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Don't give out personal info too quickly. Guage analyse and date safely`
  String get ruleThreeDesc {
    return Intl.message(
      'Don\'t give out personal info too quickly. Guage analyse and date safely',
      name: 'ruleThreeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Be active.`
  String get ruleFourTitle {
    return Intl.message(
      'Be active.',
      name: 'ruleFourTitle',
      desc: '',
      args: [],
    );
  }

  /// `Report other's rude or bad behaviour actively so we can keep it safe`
  String get ruleFourDesc {
    return Intl.message(
      'Report other\'s rude or bad behaviour actively so we can keep it safe',
      name: 'ruleFourDesc',
      desc: '',
      args: [],
    );
  }

  /// `I Understand`
  String get iUnderstand {
    return Intl.message(
      'I Understand',
      name: 'iUnderstand',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<LocalizedStrings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LocalizedStrings> load(Locale locale) => LocalizedStrings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}