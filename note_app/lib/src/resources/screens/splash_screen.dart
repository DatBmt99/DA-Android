import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/resources/screens/notes_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoadingScreen extends StatefulWidget {
  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Loading',
        home: AnimatedSplashScreen.withScreenFunction(
            duration: 5000,
            splash: Image.asset(
              "assets/images/loading.gif",
            ),
            screenFunction: () async {  
              return Login();
            },
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white));
  }
}
