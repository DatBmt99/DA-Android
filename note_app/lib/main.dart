import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/resources/login/login_screen.dart';
import 'package:note_app/src/resources/screens/notes_screen.dart';
import 'package:note_app/src/resources/screens/onboarding_screen.dart';
import 'package:note_app/src/resources/screens/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

//void main() => runApp((MyApp()));
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: Login(),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => Login(),
        "first": (context) => OnBoarding(),
      },
    );
  }
}
