import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/src/components/already_have_an_account_acheck.dart';
import 'package:note_app/src/components/background_login.dart';
import 'package:note_app/src/components/or_divider.dart';
import 'package:note_app/src/components/rounded_button.dart';
import 'package:note_app/src/components/rounded_input_field.dart';
import 'package:note_app/src/components/rounded_password_field.dart';
import 'package:note_app/src/components/social_icon.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/model/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatelessWidget {
  String _email;
  String _password;

  bool loading = false;

  Future<UserModel> createUser() async {
    var response = await http
        .post(
      'https://api-mobile-app.herokuapp.com/api/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _email,
        'password': _password,
      }),
    )
        .catchError((e) {
      throw (e);
    });

    print(response.body);

    if (response.statusCode == 200) {
      showToast("User registered succesfully");
      // setState(() {
      //   loading = false;
      // });
       return userModelFromJson(response.body);
    } else {
      showToast(jsonDecode(response.body)['error'] ?? "Something went wrong");
      return null;
    }
  }

  showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup1.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                _email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _password = value;
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              press: createUser,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
