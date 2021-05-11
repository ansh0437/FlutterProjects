import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  await SharedPref.load();

  runApp(
    ChangeNotifierProvider<AppNotifier>(
      create: (_) => AppNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends BasePageStateless {
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
      initialRoute: Pages.home,
      routes: AppNavigator.routes,
      builder: EasyLoading.init(),
    );
  }
}
