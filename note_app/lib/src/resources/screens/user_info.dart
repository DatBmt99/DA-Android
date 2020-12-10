import 'package:flutter/material.dart';
import 'package:note_app/src/components/rounded_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    Key key,
  }) : super(key: key);
  @override
  _UserProfilePage createState() => _UserProfilePage();
}

class _UserProfilePage extends State<UserProfile> {
  // Widget textField(@required String hintText){
  //   return
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // PreferredSize(
        // preferredSize: Size.fromHeight(120.0),
        //   child: (
        elevation: 0.0,
        backgroundColor: Colors.blue[200],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        //  actions: <Widget>[
        //               child:Text("Dang xuat"),
        //             ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                alignment: Alignment(100, 200),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/male_avatar.png'),
                    )),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 145, 0, 20),
              //   child: TextField(
              //     //value,
              //     style: TextStyle(fontSize: 18, color: Colors.black),
              //     decoration: InputDecoration(
              //         labelText: "Email",
              //         prefixIcon: Container(
              //             width: 50,
              //             child: Image.asset("assets/icons/ic_mail.png")),
              //         border: OutlineInputBorder(
              //             borderSide:
              //                 BorderSide(color: Color(0xffCED0D2), width: 1),
              //             borderRadius: BorderRadius.all(Radius.circular(6)))),
              //   ),
              // ),
              // TextField(
              //   //value
              //   style: TextStyle(fontSize: 18, color: Colors.black),
              //   obscureText: true,
              //   decoration: InputDecoration(
              //       labelText: "Password",
              //       prefixIcon: Container(
              //           width: 50,
              //           child: Image.asset("assets/icons/ic_phone.png")),
              //       border: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(color: Color(0xffCED0D2), width: 1),
              //           borderRadius: BorderRadius.all(Radius.circular(6)))),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 280, left: 28),
            child: Text(
              "Name",
              style: TextStyle(
                  fontSize: 35,
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 400, left: 100),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            text: "CẬP NHẬT",
            //   press: r,
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue[200];
    Path path = Path()
      ..relativeLineTo(0, 60)
      ..quadraticBezierTo(size.width / 2, 100, size.width, 60)
      ..relativeLineTo(0, -60)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
