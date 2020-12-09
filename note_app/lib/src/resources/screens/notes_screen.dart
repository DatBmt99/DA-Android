import 'package:flutter/material.dart';
import 'package:note_app/src/components/rounded_input_field.dart';
import 'package:note_app/src/components/search_input.dart';
import 'package:note_app/src/model/notes.dart';

import 'package:note_app/src/model/notes_model.dart';
import 'package:intl/intl.dart';
import 'package:note_app/src/resources/login/login.dart';
import 'package:note_app/src/resources/screens/new_category.dart';
import 'package:note_app/src/resources/widgets/floatbutton.dart';


class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}
class MyTheme {
  Color mainAccentColor = Color(0xff3f79fe);
  Color secondaryColor = Color(0xffeff3f8);
}
// List<Note> notes = [];
// List<Category> categoryList = [Category('Not Specified')];
// List<String> categoryNameList = [];
// List<Note> starredNotes = [];
// Note note = Note('', '', Category('Not Specified'));
// Category newCategory = Category('Not Specified');
String userName = '';
MyTheme myTheme = MyTheme();
class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  TabController _tabController;
  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');

  @override
  void initState() {
    super.initState();
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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
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
                  'Trinh Xuan Dat',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SearchInputField(),
          SizedBox(height: 40.0),
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
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xFFAFB4C6),
              indicatorColor: Color(0xFF417BFB),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4.0,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Important',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Performed',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      notes[0].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _timeFormatter.format(notes[0].date),
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  notes[0].content,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      _dateFormatter.format(notes[0].date),
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF417BFB),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      notes[1].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _timeFormatter.format(notes[1].date),
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  notes[1].content,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
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
      //               SharedPreferences.getInstance().then((prefs) {
      //                 prefs.setStringList('categoryNameList', categoryNameList);
      //                 addCategoryNameColor(newCategory.name, newCategory.color);
      //               });

      //               updateList();
      //               updateCategoryList();
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
      //           note = Note('', '', Category('Not Specified'));
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => AddEditNote()),
      //           ).then((onValue) {
      //             if (note.title != '' && note.text != '') {
      //               databaseHelper.insertNote(note);
      //             }
      //             updateList();
      //           });
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
