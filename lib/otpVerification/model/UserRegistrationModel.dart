// To parse this JSON data, do
//
//     final userRegistrationModel = userRegistrationModelFromJson(jsonString);

import 'dart:convert';

UserRegistrationModel userRegistrationModelFromJson(String str) => UserRegistrationModel.fromJson(json.decode(str));

String userRegistrationModelToJson(UserRegistrationModel data) => json.encode(data.toJson());

class UserRegistrationModel {
  UserRegistrationModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory UserRegistrationModel.fromJson(Map<String, dynamic> json) => UserRegistrationModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.userData,
    required this.accesstoken,
  });

  UserData userData;
  String accesstoken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userData: UserData.fromJson(json["UserData"]),
    accesstoken: json["accesstoken"],
  );

  Map<String, dynamic> toJson() => {
    "UserData": userData.toJson(),
    "accesstoken": accesstoken,
  };
}

class UserData {
  UserData({
    required this.wallet,
    required this.favGame,
    required this.availableNumberOfCoin,
    required this.id,
    required this.contact,
    required this.referId,
    required this.gameDetails,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Wallet wallet;
  List<dynamic> favGame;
  int availableNumberOfCoin;
  String id;
  String contact;
  String referId;
  List<dynamic> gameDetails;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    wallet: Wallet.fromJson(json["wallet"]),
    favGame: List<dynamic>.from(json["favGame"].map((x) => x)),
    availableNumberOfCoin: json["availableNumberOfCoin"],
    id: json["_id"],
    contact: json["contact"],
    referId: json["referId"],
    gameDetails: List<dynamic>.from(json["gameDetails"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet.toJson(),
    "favGame": List<dynamic>.from(favGame.map((x) => x)),
    "availableNumberOfCoin": availableNumberOfCoin,
    "_id": id,
    "contact": contact,
    "referId": referId,
    "gameDetails": List<dynamic>.from(gameDetails.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Wallet {
  Wallet({
    required this.balance,
    required this.gameInCoins,
    required this.bonusCoins,
  });

  int balance;
  int gameInCoins;
  int bonusCoins;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    balance: json["balance"],
    gameInCoins: json["gameInCoins"],
    bonusCoins: json["bonusCoins"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "gameInCoins": gameInCoins,
    "bonusCoins": bonusCoins,
  };
}
