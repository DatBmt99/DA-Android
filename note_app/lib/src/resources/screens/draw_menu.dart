import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            //width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue[500],
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    decoration: (BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/male_avatar.png'),
                          fit: BoxFit.fill),
                    )),
                  ),
                  Text(
                    'User',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Thông tin',
                    style: TextStyle(color: Colors.white),
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
            //  Navigator.pushNamed(context, '/settings');
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
          //    Navigator.pushNamed(context, '/settings');
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
            //  Navigator.pushNamed(context, '/settings');
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
         //     Navigator.pushNamed(context, '/settings');
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.app_registration),
          //   title: Text(
          //     'Đăng kí',
          //     style: TextStyle(fontSize: 18),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/settings');
          //   },
          // ),
        ],
      ),
    );
  }
}
