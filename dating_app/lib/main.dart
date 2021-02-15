import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app/navigator.dart';
import 'app/pages/base/base_stateless.dart';
import 'constants/pages.dart';
import 'constants/strings.dart';
import 'data/preferences.dart';
import 'generated/l10n.dart';
import 'notifiers/app_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Loading shared preferences
  await SharedPref.load();

  /// Listening for app theme and language change
  runApp(
    ChangeNotifierProvider<AppNotifier>(
      create: (_) => AppNotifier(),
      child: DatingApp(),
    ),
  );
}

class DatingApp extends BasePageStateless {
  @override
  Widget build(BuildContext context) {
    final appNotifier = Provider.of<AppNotifier>(context);

    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: appNotifier.theme,
      locale: appNotifier.locale,
      localizationsDelegates: [
        LocalizedStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocalizedStrings.delegate.supportedLocales,
      initialRoute:
          DatingPreference.boardingShowed.boolean ? Pages.boarding : Pages.login,
      routes: DatingNavigator.routes,
    );
  }
}
