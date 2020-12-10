import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/resources/login/login_screen.dart';
import 'package:note_app/src/resources/screens/notes_screen.dart';
import 'package:note_app/src/resources/screens/user_info.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}
