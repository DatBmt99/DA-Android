import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Note {
  int id;
  int starred;
  String title;
  String text;
  DateTime dateTime;
  Category category;
  Priority priority;
  Note(this.title, this.text, this.category, this.priority,
      {this.starred = 0}) {
    this.dateTime = DateTime.now();
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['starred'] = starred;
    map['title'] = title;
    map['text'] = text;
    map['category'] = category.name;
    map['priority'] = priority.name;
    map['date'] = dateTime.toIso8601String();
    return map;
  }

}
  final Map<String, int> categories = {
  'Notes': 112,
  'Work': 58,
  'Home': 23,
  'Complete': 31,
  };

class Category {
  String name;
  Color color;
  Category(this.name, {this.color = Colors.black});
}

class Priority {
  String name;
  int num;
  Color color;
  Priority(this.name, {this.color = Colors.black});
}
