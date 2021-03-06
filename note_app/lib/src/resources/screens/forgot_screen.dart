import 'package:flutter/material.dart';
import 'package:note_app/src/components/forgot_password.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quên mật khẩu'),
        elevation: 0.0,
        backgroundColor: Colors.blue[500],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ForgotPassInput(),
    );
  }
}
