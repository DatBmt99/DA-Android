import 'dart:io';

import "package:flutter/material.dart";
import 'package:note_app/src/model/slides_model.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/resources/login/login_screen.dart';
import 'package:note_app/src/resources/screens/notes_screen.dart';
import 'package:note_app/src/resources/screens/splash_screen.dart';
import 'package:note_app/src/resources/widgets/slider_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SliderTile(
                imagePath: mySLides[0].getImageAssetPath(),
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
              ),
              SliderTile(
                imagePath: mySLides[1].getImageAssetPath(),
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
              ),
              SliderTile(
                imagePath: mySLides[2].getImageAssetPath(),
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
              ),
              SliderTile(
                imagePath: mySLides[3].getImageAssetPath(),
                title: mySLides[3].getTitle(),
                desc: mySLides[3].getDesc(),
              ),
              SliderTile(
                imagePath: mySLides[4].getImageAssetPath(),
                title: mySLides[4].getTitle(),
                desc: mySLides[4].getDesc(),
              )
            ],
          ),
        ),
        bottomSheet: slideIndex != 4
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        controller.animateToPage(4,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: Color(0xFF0074E4),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        print("Slider Index: $slideIndex");
                        controller.animateToPage(slideIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: Color(0xFF0074E4),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () {
                  print("Bắt đầu");
                },
                child: Container(
                  height: 70,
                  color: Colors.deepPurple,
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    child: Align(
                        child: Text(
                      "BẮT ĐẦU NGAY",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    // child: Text(
                    //   "BẮT ĐẦU NGAY",
                    //   style: TextStyle(
                    //       color: Colors.white, fontWeight: FontWeight.w600),
                    // ),
                  ),
                  // splashFactory: InkRipple.splashFactory,
                  //
                  // ),
                ),
              ),
      ),
    );
  }
}
