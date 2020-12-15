import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/resources/login/login_screen.dart';
import 'package:note_app/src/resources/screens/notes_screen.dart';
import 'package:note_app/src/resources/screens/onboarding_screen.dart';
import 'package:note_app/src/resources/screens/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

int initScreen;

//void main() => runApp((MyApp()));
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('vn', 'VN')],
      path: 'lang',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: true,
      child: MyApp(),
    ),
  );
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Locale _locale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //easy
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      //
      // home: Login(),
      // locale: _locale,
      // supportedLocales: [
      //   Locale('en', 'US'),
      //   Locale('vn', 'VN'),
      // ],
      // localizationsDelegates: [
      //   // AppLocation
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   for (var locale in supportedLocales) {
      //     if (locale.languageCode == deviceLocale.languageCode &&
      //         locale.countryCode == deviceLocale.countryCode) {
      //       return deviceLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },

      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => Login(),
        "first": (context) => OnBoarding(),
      },
    );
  }
}
