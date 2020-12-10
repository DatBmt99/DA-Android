import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/src/resources/screens/about.dart';
import 'package:note_app/src/resources/screens/notify.dart';
import 'package:note_app/src/resources/screens/rate_and_review.dart';
import 'package:note_app/src/resources/screens/setting.dart';
import 'package:note_app/src/resources/screens/user_info.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            //width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue[500],
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfile(),
                        ),
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(top: 30, bottom: 5),
                      decoration: (BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/male_avatar.png'),
                            fit: BoxFit.cover),
                      )),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    margin: EdgeInsets.only(top: 30, bottom: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FlatButton(
                        // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          "Đăng xuất",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //    new Divider(),
          ListTile(
            leading: Icon(Icons.circle_notifications),
            title: Text(
              'Thông báo',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Notify(),
                ),
              );
            },
          ),

          new Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Setting',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text(
              'Cloud',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              //  Navigator.pushNamed(context, '/settings');
            },
          ),
          new Divider(),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(
              'Support Us',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text(
              'Rate and Review',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RateandReview(),
                ),
              );
            },
          ),
          new Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
          ),

          // ListTile(
          //  // title: Text(""),

          //   title: Text(
          //     "Version v1.0 .0",
          //     textAlign: TextAlign.center,

          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          //   ),
          // ),
        ],
      ),
    );
  }
}
