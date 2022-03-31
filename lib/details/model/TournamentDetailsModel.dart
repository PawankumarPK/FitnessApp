// To parse this JSON data, do
//
//     final tournamentDetailsModel = tournamentDetailsModelFromJson(jsonString);

import 'dart:convert';

TournamentDetailsModel tournamentDetailsModelFromJson(String str) => TournamentDetailsModel.fromJson(json.decode(str));

String tournamentDetailsModelToJson(TournamentDetailsModel data) => json.encode(data.toJson());

class TournamentDetailsModel {
  TournamentDetailsModel({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  Data data;

  factory TournamentDetailsModel.fromJson(Map<String, dynamic> json) => TournamentDetailsModel(
    error: json["error"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.registeredUser,
    required this.entryAmount,
    required this.id,
    required this.tournamentName,
    required this.tournamentDetails,
    required this.gameId,
    required this.type,
    required this.status,
    required this.prizePool,
    required this.prizePoolDescription,
    required this.userLimit,
    required this.startingPeriod,
    required this.endingPeriod,
    required this.rulesAndRegulation,
    required this.entry,
    required this.roomId,
    required this.roomPassword,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  List<dynamic> registeredUser;
  int entryAmount;
  String id;
  String tournamentName;
  String tournamentDetails;
  GameId gameId;
  String type;
  int status;
  int prizePool;
  String prizePoolDescription;
  int userLimit;
  String startingPeriod;
  String endingPeriod;
  String rulesAndRegulation;
  String entry;
  String roomId;
  String roomPassword;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    registeredUser: List<dynamic>.from(json["registeredUser"].map((x) => x)),
    entryAmount: json["entryAmount"],
    id: json["_id"],
    tournamentName: json["tournamentName"],
    tournamentDetails: json["details"],
    gameId: GameId.fromJson(json["gameId"]),
    type: json["type"],
    status: json["status"],
    prizePool: json["prizePool"],
    prizePoolDescription: json["prizePoolDescription"],
    userLimit: json["userLimit"],
    startingPeriod: json["startingPeriod"],
    endingPeriod: json["endingPeriod"],
    rulesAndRegulation: json["rulesAndRegulation"],
    entry: json["entry"],
    roomId: json["roomId"],
    roomPassword: json["roomPassword"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "registeredUser": List<dynamic>.from(registeredUser.map((x) => x)),
    "entryAmount": entryAmount,
    "_id": id,
    "tournamentName": tournamentName,
    "details": tournamentDetails,
    "gameId": gameId.toJson(),
    "type": type,
    "status": status,
    "prizePool": prizePool,
    "prizePoolDescription": prizePoolDescription,
    "userLimit": userLimit,
    "startingPeriod": startingPeriod,
    "endingPeriod": endingPeriod,
    "rulesAndRegulation": rulesAndRegulation,
    "entry": entry,
    "roomId": roomId,
    "roomPassword": roomPassword,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class GameId {
  GameId({
    required this.screenShot,
    required this.id,
    required this.gameName,
    required this.bannerImage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  List<String> screenShot;
  String id;
  String gameName;
  String bannerImage;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory GameId.fromJson(Map<String, dynamic> json) => GameId(
    screenShot: List<String>.from(json["screenShot"].map((x) => x)),
    id: json["_id"],
    gameName: json["gameName"],
    bannerImage: json["bannerImage"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "screenShot": List<dynamic>.from(screenShot.map((x) => x)),
    "_id": id,
    "gameName": gameName,
    "bannerImage": bannerImage,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}