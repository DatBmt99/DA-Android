import 'dart:convert';

List<Notes> notesFromJson(String str) =>
    List<Notes>.from(json.decode(str).map((x) => Notes.fromJson(x)));

String notesToJson(List<Notes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notes {
  Notes({
    this.id,
    this.uid,
    this.category,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.priority,
    this.status,
  });

  String id;
  String uid;
  String category;
  String title;
  String body;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime expiresAt;
  int priority;
  int status;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json["id"],
        uid: json["uid"],
        category: json["category"],
        title: json["title"],
        body: json["body"],
        createdAt: DateTime.parse(json['createdAt']), //json["created_at"],
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json[
                'updatedAt']), //json["updated_at"] == null ? null : json["updated_at"],
        expiresAt: DateTime.parse(json['expiresAt']),
        priority: json["priority"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "category": category,
        "title": title,
        "body": body,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "expires_at": expiresAt,
        "priority": priority,
        "status": status,
      };
}

// class Note {
//   String title;
//   String content;
//   DateTime date;

//   Note({this.title, this.content, this.date});
// }

// final Map<String, int> categories = {
//   'Notes': 112,
//   'Work': 58,
//   'Home': 23,
//   'Complete': 31,
// };

// final List<Note> notes = [
//   Note(
//     title: 'Buy ticket',
//     content: 'Buy airplane ticket through Kayak for \$318.38',
//     date: DateTime(2019, 10, 10, 8, 30),
//   ),
//   Note(
//     title: 'Walk with dog',
//     content: 'Walk on the street with my favorite dog.',
//     date: DateTime(2019, 10, 10, 8, 30),
//   ),
// ];
