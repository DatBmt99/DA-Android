import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:note_app/src/model/api_response.dart';
import 'package:note_app/src/model/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';

// class PinData {
//   static SharedPreferences _prefs;
//   static PinData _pinData;
//   static int pinEnable;
//   static String pin;

//   PinData._createInstance();

//   factory PinData() {
//     if (_pinData == null) {
//       _pinData = PinData._createInstance();
//     }
//     return _pinData;
//   }
//   Future<SharedPreferences> get prefs async {
//     if (_prefs == null) {
//       _prefs = await initialise();
//     }
//     return _prefs;
//   }

//   Future<SharedPreferences> initialise() async {
//     return _prefs = await SharedPreferences.getInstance();
//   }

//   Future<int> getPinEnable() async {
//     pinEnable = (_prefs.getInt('pinEnable') ?? 0);
//     return pinEnable;
//   }

//   Future<String> getPin() async {
//     pin = (_prefs.getString('pin') ?? '');
//     return pin;
//   }

//   void setPinEnable(int value) async {
//     _prefs.setInt('pinEnable', value);
//   }

//   void setPin(String value) async {
//     _prefs.setString('pin', value);
//   }
// }

class NotesService {
  static SharedPreferences _prefs;
  // static
  // Future<SharedPreferences> initialise() async {
  //   return _prefs = await SharedPreferences.getInstance();
  // }

  // Future<SharedPreferences> get prefs async {
  //   if (_prefs == null) {
  //     _prefs = await initialise();
  //   }
  //   return _prefs;
  // }

  // Future<String> getToken() async {
  //   token = (_prefs.getString('token') ?? '');
  //   return token;
  // }

  // String value = _prefs.getString('token') ?? '';
  static const API = URL_API;

  // var token =
  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<APIResponse<List<Notes>>> getNotesList() async {
    String token = await NotesService().getToken();

    // const headers = {
    //
    // };
    return await http.get(API + '/notes', headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    }).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Notes>[];
        for (var i = 0; i < jsonData.length; i ++) {
          notes.add(Notes.fromJson(jsonData[i]));
        }
        return APIResponse<List<Notes>>(data: notes);
      }
      return APIResponse<List<Notes>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Notes>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Notes>> getNote(String noteID) async {
    String token = await NotesService().getToken();
    return http.get(API + '/notes/' + noteID, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    }).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Notes>(data: Notes.fromJson(jsonData));
      }
      return APIResponse<Notes>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
        APIResponse<Notes>(error: true, errorMessage: 'An error occured'));
  }
  // Future<APIResponse<Notes>> getCategory(String noteID) async {
  //   String token = await NotesService().getToken();
  //   return http.get(API + '/notes/' + noteID, headers: {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   }).then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);
  //       return APIResponse<Notes>(data: Notes.fromJson(jsonData));
  //     }
  //     return APIResponse<Notes>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //       APIResponse<Notes>(error: true, errorMessage: 'An error occured'));
  // }
  // Future<APIResponse<User>> getUserInfo(String userID) async {
  //   String token = await NotesService().getToken();
  //   return http.get(API + '/getuserinfo' + userID, headers: {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization': 'Bearer $token',
  //   }).then((data) {
  //     if (data.statusCode == 200) {
  //       final jsonData = json.decode(data.body);
  //       return APIResponse<User>(data: Notes.fromJson(jsonData));
  //     }
  //     return APIResponse<Notes>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //       APIResponse<Notes>(error: true, errorMessage: 'An error occured'));
  // }
  // Future<int> getCount() async {

  //   List<Map<String, dynamic>> x =
  //       await db.rawQuery('SELECT COUNT (*) from $noteTable');
  //   int result = Sqflite.firstIntValue(x);
  //   return result;
  // }

  // Future<List<Note>> getNoteList() async {
  //   var noteMapList = await getNoteMapList(); // Get 'Map List' from database
  //   int count =
  //       noteMapList.length; // Count the number of map entries in db table
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   List<Note> noteList = List<Note>();
  //   // For loop to create a 'Note List' from a 'Map List'
  //   for (int i = 0; i < count; i++) {
  //     Note temp = Note('', '', Category('Not Specified'),Priority('Not Specified');
  //     temp.id = noteMapList[i]['id'];
  //     temp.starred = noteMapList[i]['starred'];
  //     temp.title = noteMapList[i]['title'];
  //     temp.text = noteMapList[i]['text'];
  //     temp.dateTime = DateTime.parse(noteMapList[i]['date']);
  //     temp.category.name = noteMapList[i]['category'];
  //     temp.category.color = getCategoryColor(temp.category.name, prefs);
  //     noteList.add(temp);
  //   }

  //   return noteList;
  // }

  Color getCategoryColor(String name, SharedPreferences prefs) {
    var colorName;
    colorName = (prefs.getString(name) ?? 'black');
    switch (colorName) {
      case 'red':
        return Color(0xffe26e43);
      case 'blue':
        return Color(0xff292e91);
      case 'yellow':
        return Color(0xffa1ffb3);
      case 'green':
        return Color(0xffa82654);
      case 'lightgreen':
        return Color(0xfff9bfda);
    }
    return Colors.black;
  }
}
