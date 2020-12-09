// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.accessToken,
  });

  String accessToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
      };
}
