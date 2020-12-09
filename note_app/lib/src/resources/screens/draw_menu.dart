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
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue[500],
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    decoration: (BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/icons/user.png'),
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
          ListTile(
            leading: Icon(Icons.circle_notifications),
            title: Text(
              'Thông báo',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
               Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_location_alt),
            title: Text(
              'Đổi khu vực',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Cài đặt',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
               Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.download_sharp),
            title: Text(
              'Cập nhật dữ liệu',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
               Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(
              'Góp ý và Phản ánh',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text(
              'Đánh giá ứng dụng',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
               Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'Liên hệ',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
               Navigator.pushNamed(context, '/settings');
            },
          ),
           ListTile(
            leading: Icon(Icons.app_registration),
            title: Text(
              'Đăng kí',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
               Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
