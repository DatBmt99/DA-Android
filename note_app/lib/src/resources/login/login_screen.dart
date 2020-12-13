import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/src/components/already_have_an_account_acheck.dart';
import 'package:note_app/src/components/background_login.dart';

import 'package:note_app/src/components/rounded_button.dart';
import 'package:note_app/src/components/rounded_input_field.dart';
import 'package:note_app/src/components/rounded_password_field.dart';
import 'package:note_app/src/components/text_forgot_pass.dart';
import 'package:note_app/src/model/user_model.dart';
import 'package:note_app/src/resources/login/signup.dart';
import 'package:note_app/src/resources/screens/forgot_screen.dart';
import 'package:note_app/src/resources/screens/notes_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool login = false;
  String _email;
  String _password;

  String token;
  bool _isLoading = false;
  Future<UserModel> loginUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http
        .post(
      'https://api-mobile-app.herokuapp.com/api/signin',
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
    // print(response.body);

    if (response.statusCode == 200) {
      showToast("Login succesful");
      // Navigator.push(
      var data = json.decode(response.body);
      //     context, MaterialPageRoute(builder: (context) => NotesScreen()));
      if (data['accessToken'] != null) {
        setState(() {
          _isLoading = false;
        });

        //   print();
        token = await sharedPreferences.getString("token");
        await sharedPreferences.setString("token", data['accessToken']);
        // sharedPreferences.setString(
        //     "token", jsonDecode(response.body)['accessToken']);
        //   print(data['acessToken']);
        //   print('token ${token}');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => NotesScreen()),
            (Route<dynamic> route) => false);
      }
      setState(() {
        login = true;
        _isLoading = false;
      });
      return userModelFromJson(response.body);
    } else {
      setState(() {
        login = false;
      });
      showToast(jsonDecode(response.body)['error'] ?? "Something went wrong");
      return null;
    }
  }

  SharedPreferences sharedPreferences;
  showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => NotesScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login1.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
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
              text: "LOGIN",
              press: loginUser,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            ForgotPass(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ForgotPassword();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
