import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:note_app/src/resources/screens/notes_screen.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
