import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:note_app/src/components/search_input.dart';
import 'package:note_app/src/model/notes.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:note_app/src/model/notes_model.dart';
import 'package:intl/intl.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/resources/screens/add_notes.dart';
import 'package:note_app/src/resources/screens/draw_menu.dart';
import 'package:note_app/src/resources/screens/new_category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:note_app/helper/jwt_decoder.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class MyTheme {
  Color mainAccentColor = Color(0xff3f79fe);
  Color secondaryColor = Color(0xffeff3f8);
}

List<String> mainTileNameList = [
      'All Notes',
      'Important',
    ] +
    categoryNameList;

List<Tab> myTabs = <Tab>[
  Tab(
    text: 'Notes',
  ),
  Tab(
    text: 'Important',
  ),
  Tab(
    text: 'Team',
  ),
];

var _scaffoldKey = new GlobalKey<ScaffoldState>();
List<Note> notes = [];
List<Category> categoryList = [Category('Not Specified')];
List<String> categoryNameList = [];
List<Note> starredNotes = [];
Note note = Note('', '', Category('Not Specified'), Priority('Not Specified'));
Category newCategory = Category('Not Specified');
Priority newPriority = Priority('Not Specified');
MyTheme myTheme = MyTheme();

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  String userName;
  int _selectedCategoryIndex = 0;
  TabController _tabController;
  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');
  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (Route<dynamic> route) => false);
    } else {
      var token = sharedPreferences.getString("token");
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      setState(() {
        userName = decodedToken['name'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        height: 240.0,
        width: 175.0,
        decoration: BoxDecoration(
          color: _selectedCategoryIndex == index
              ? Color(0xFF417BFB)
              : Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            _selectedCategoryIndex == index
                ? BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 10.0)
                : BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Color(0xFFAFB4C6),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: HomeMenu(),
      ),
      key: _scaffoldKey,
      body: Container(
        child: ListView(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.white10,
              elevation: 0.0,
              title: Text(
                "Notes Manager",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              leading: FlatButton(
                  onPressed: () {
                    print("click menu");
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Icon(Icons.menu)),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      sharedPreferences.remove("token");
                      //   sharedPreferences.commit();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => Login()),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/male_avatar.png'),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //  SearchInputField    ),
            SizedBox(height: 5.0),
            //catergory
            Container(
              height: 280.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 20.0);
                  }
                  return _buildCategoryCard(
                    index - 1,
                    categories.keys.toList()[index - 1],
                    categories.values.toList()[index - 1],
                  );
                },
              ),
            ),
            // TabBar(
            //   labelStyle: TextStyle(fontSize: 17),
            //   labelColor: Colors.black,
            //   indicatorColor: myTheme.mainAccentColor,
            //   indicatorSize: TabBarIndicatorSize.label,
            //   indicatorWeight: 2,
            //   unselectedLabelStyle: TextStyle(fontSize: 17),
            //   unselectedLabelColor: Colors.blueGrey,
            //   tabs: myTabs,
            //   controller: _tabController,
            // ),
            // Flexible(
            //   child: TabBarView(
            //     physics: BouncingScrollPhysics(),
            //     controller: _tabController,
            //     children: <Widget>[
            //       Tab(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: ListView.builder(
            //             physics: BouncingScrollPhysics(),
            //             itemBuilder: (context, index) {
            //               return Padding(
            //                 padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       color: myTheme.secondaryColor,
            //                       borderRadius: BorderRadius.circular(10)),
            //                   child: ListTile(
            //                     onLongPress: () {
            //                       showDialog(
            //                         barrierDismissible: true,
            //                         context: context,
            //                         builder: (_) => AlertDialog(
            //                           shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(10)),
            //                           title: Text('Delete Note?'),
            //                           actions: <Widget>[
            //                             FlatButton(
            //                                 onPressed: () {
            //                                   // databaseHelper
            //                                   //     .deleteNote(notes[index].id);
            //                                   // updateList();
            //                                   Navigator.pop(context);
            //                                 },
            //                                 child: Text('Yes')),
            //                             FlatButton(
            //                                 onPressed: () {
            //                                   Navigator.pop(context);
            //                                 },
            //                                 child: Text('No'))
            //                           ],
            //                         ),
            //                       );
            //                     },
            //                     onTap: () {
            //                       note = notes[index];
            //                       Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) => AddEditNote()),
            //                       ).then((onValue) {
            //                         print(onValue);
            //                         if (note.title != '' && note.text != '') {
            //                           //      databaseHelper.updateNote(note);
            //                         }
            //                         //     updateList();
            //                       });
            //                     },
            //                     title: Text(
            //                       notes[index].title,
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                     subtitle: Text(
            //                       notes[index].text,
            //                       maxLines: 3,
            //                       style: TextStyle(
            //                         color: Colors.black,
            //                       ),
            //                     ),
            //                     trailing: Column(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: <Widget>[
            //                         Text(
            //                              '${notes[index].dateTime.hour > 12 ? notes[index].dateTime.hour - 12 : notes[index].dateTime.hour}:${notes[index].dateTime.minute} ${notes[index].dateTime.hour > 12 ? 'PM' : 'AM'}',
            //                           style: TextStyle(
            //                               color: Colors.blueGrey,
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                         Icon(
            //                           Icons.label_outline,
            //                           //color: notes[index].category.color,
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             },
            //             itemCount: notes.length,
            //           ),
            //         ),
            //       ),
            //         Tab(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: ListView.builder(
            //               itemBuilder: (context, index) {
            //                 return Center(
            //                   child: Padding(
            //                     padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            //                     child: Card(
            //                       color: myTheme.secondaryColor,
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.circular(10)),
            //                       child: Center(
            //                         child: ListTile(
            //                           onTap: null,
            //                           title: Text(
            //                             mainTileNameList[index],
            //                             style: TextStyle(
            //                                 color: Colors.blueGrey,
            //                                 fontWeight: FontWeight.bold),
            //                           ),
            //                           subtitle: Text(
            //                             'This is my debut shot at dribbble and I\'m really glad I got here. This shot is dedicated to notes for your phone in bright blue tones.'
            //                             'What do you think about it?',
            //                             style: TextStyle(
            //                               color: Colors.blueGrey,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               },
            //               itemCount: mainTileNameList.length,
            //             ),
            //           ),
            //         ),
            //       Tab(
            //         child: ListTile(
            //           title: Text('Buy Tickets'),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //view
            // Padding(
            //   padding: EdgeInsets.only(left: 15.0),
            //   child: TabBar(
            //     controller: _tabController,
            //     labelColor: Colors.black,
            //     unselectedLabelColor: Color(0xFFAFB4C6),
            //     indicatorColor: Color(0xFF417BFB),
            //     indicatorSize: TabBarIndicatorSize.label,
            //     indicatorWeight: 4.0,
            //     isScrollable: true,
            //     tabs: <Widget>[
            //       Tab(
            //         child: Text(
            //           'Notes',
            //           style: TextStyle(
            //             fontSize: 22.0,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       Tab(
            //         child: Text(
            //           'Important',
            //           style: TextStyle(
            //             fontSize: 22.0,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       Tab(
            //         child: Text(
            //           'Performed',
            //           style: TextStyle(
            //             fontSize: 22.0,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20.0),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 30.0),
            //   padding: EdgeInsets.all(30.0),
            //   decoration: BoxDecoration(
            //     color: Color(0xFFF5F7FB),
            //     borderRadius: BorderRadius.circular(30.0),
            //   ),
            //   child: Column(
            //     children: <Widget>[
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Text(
            //             "Data",
            //             // notes[0].title,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //           Text(
            //             "data",
            //             //     _timeFormatter.format(notes[0].date),
            //             style: TextStyle(
            //               color: Color(0xFFAFB4C6),
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 15.0),
            //       Text(
            //         "Data",
            //         //notes[0].content,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18.0,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: <Widget>[
            //           Text(
            //             "data",
            //             //_dateFormatter.format(notes[0].date),
            //             style: TextStyle(
            //               color: Color(0xFFAFB4C6),
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //           Container(
            //             height: 50.0,
            //             width: 50.0,
            //             decoration: BoxDecoration(
            //               color: Color(0xFF417BFB),
            //               borderRadius: BorderRadius.circular(15.0),
            //             ),
            //             child: Icon(
            //               Icons.location_on,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20.0),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 30.0),
            //   padding: EdgeInsets.all(30.0),
            //   decoration: BoxDecoration(
            //     color: Color(0xFFF5F7FB),
            //     borderRadius: BorderRadius.circular(30.0),
            //   ),
            //   child: Column(
            //     children: <Widget>[
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Text(
            //             "data",
            //             // notes[1].title,
            //             style: TextStyle(
            //               color: Colors.black,
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //           Text(
            //             "data",
            //             // _timeFormatter.format(notes[1].date),
            //             style: TextStyle(
            //               color: Color(0xFFAFB4C6),
            //               fontSize: 18.0,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 15.0),
            //       Text(
            //         "data",
            //         //notes[1].content,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 18.0,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        // backgroundColor: Colors.redAccent,
        children: [
          SpeedDialChild(
            child: Icon(Icons.event),
            label: "Add Note",
            backgroundColor: Colors.orange,
            onTap: () {
              note = Note(
                  '', '', Category('Not Specified'), Priority('Not Specified'));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEditNote()),
              ).then((onValue) {
                if (note.title != '' && note.text != '') {
                  //  databaseHelper.insertNote(note);
                }
                //   updateList();
              });
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.create_new_folder),
            label: "Add Category",
            backgroundColor: Colors.green,
            onTap: () {
              newCategory = Category('Not Specified');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEditCategory()),
              ).then((onValue) {
                if (newCategory.name != 'Not Specified') {
                  categoryList.add(newCategory);
                  categoryNameList.add(newCategory.name);
                  // updateList();
                  // updateCategoryList();
                }
              });
            },
          ),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.fromLTRB(15, 8.0, 15, 8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       FloatingActionButton.extended(
      //         backgroundColor: myTheme.mainAccentColor,
      //         heroTag: 'AddEditCategory',
      //         label: Text('Category'),
      //         icon: Icon(Icons.add),
      //         onPressed: () {
      //           newCategory = Category('Not Specified');
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => AddEditCategory()),
      //           ).then((onValue) {
      //             if (newCategory.name != 'Not Specified') {
      //               categoryList.add(newCategory);
      //               categoryNameList.add(newCategory.name);

      //               // updateList();
      //               // updateCategoryList();
      //             }
      //           });
      //         },
      //       ),
      //       FloatingActionButton.extended(
      //         heroTag: 'AddEditNote',
      //         backgroundColor: myTheme.mainAccentColor,
      //         label: Text('Note'),
      //         icon: Icon(Icons.add),
      //         onPressed: () {
      //           note = Note('', '', Category('Not Specified'),
      //               Priority('Not Specified'));
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => AddEditNote()),
      //           ).then((onValue) {
      //             if (note.title != '' && note.text != '') {
      //               //  databaseHelper.insertNote(note);
      //             }
      //             //   updateList();
      //           });
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
