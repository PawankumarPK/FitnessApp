// To parse this JSON data, do
//
//     final avatar = avatarFromJson(jsonString);

import 'dart:convert';

AvatarModel avatarFromJson(String str) => AvatarModel.fromJson(json.decode(str));

String avatarToJson(AvatarModel data) => json.encode(data.toJson());

class AvatarModel {
  AvatarModel({
    required this.error,
    required this.message,
    required this.data,

  });

  bool error;
  String message;
  List<AvatarData> data;

  factory AvatarModel.fromJson(Map<String, dynamic> json) => AvatarModel(
    error: json["error"],
    message: json["message"],
    data: List<AvatarData>.from(json["data"].map((x) => AvatarData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AvatarData {
  AvatarData({
    required this.avatar,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isSelected

  });

  List<String> avatar;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  bool isSelected;


  factory AvatarData.fromJson(Map<String, dynamic> json) => AvatarData(
    avatar: List<String>.from(json["avatar"].map((x) => x)),
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    isSelected: false,

  );

  Map<String, dynamic> toJson() => {
    "avatar": List<dynamic>.from(avatar.map((x) => x)),
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
