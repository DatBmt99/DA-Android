import 'package:flutter/material.dart';
import 'package:note_app/src/config/constants.dart';

class ForgotPass extends StatelessWidget {
 // final bool login;
  final Function press;
  const ForgotPass({
    Key key,
   // this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Text(
        //   login ? "Don’t have an Account ? " : "Already have an Account ? ",
        //   style: TextStyle(color: kPrimaryColor),
        // ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Forgot Password ?",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
