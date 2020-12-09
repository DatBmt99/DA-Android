import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/resources/screens/notes_screen.dart';

import 'package:note_app/src/resources/screens/onboarding_screen.dart';
import 'package:note_app/src/resources/widgets/floatbutton.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
