import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({
    Key key,
  }) : super(key: key);
  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        elevation: 0.0,
        backgroundColor: Colors.blue[200],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Text'),
      ),
    );
  }
}
