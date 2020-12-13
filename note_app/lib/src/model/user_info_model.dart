// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.displayName,
    this.email,
    this.photoUrl,
    this.emailVerified,
    this.uid,
  });

  dynamic displayName;
  String email;
  dynamic photoUrl;
  bool emailVerified;
  String uid;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        displayName: json["displayName"],
        email: json["email"],
        photoUrl: json["photoUrl"],
        emailVerified: json["emailVerified"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "photoUrl": photoUrl,
        "emailVerified": emailVerified,
        "uid": uid,
      };
}
