// To parse this JSON data, do
//
//     final updateWalletCoin = updateWalletCoinFromJson(jsonString);

import 'dart:convert';

UpdateWalletCoin updateWalletCoinFromJson(String str) => UpdateWalletCoin.fromJson(json.decode(str));

String updateWalletCoinToJson(UpdateWalletCoin data) => json.encode(data.toJson());

class UpdateWalletCoin {
  UpdateWalletCoin({
    required this.error,
    required this.message,
    required this.data,
  });

  bool error;
  String message;
  Data data;

  factory UpdateWalletCoin.fromJson(Map<String, dynamic> json) => UpdateWalletCoin(
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
    required this.wallet,
    required this.noOfRefers,
    required this.favGame,
    required this.availableNumberOfCoin,
    required this.profileUpdated,
    required this.id,
    required this.referId,
    required this.gameDetails,
    required this.name,
    required this.throughReference,
    required this.avatar,
    required this.fbId,
    required this.emailId,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Wallet wallet;
  List<dynamic> noOfRefers;
  List<dynamic> favGame;
  int availableNumberOfCoin;
  bool profileUpdated;
  String id;
  String referId;
  List<dynamic> gameDetails;
  String name;
  String throughReference;
  String avatar;
  String fbId;
  String emailId;
  int gender;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    wallet: Wallet.fromJson(json["wallet"]),
    noOfRefers: List<dynamic>.from(json["noOfRefers"].map((x) => x)),
    favGame: List<dynamic>.from(json["favGame"].map((x) => x)),
    availableNumberOfCoin: json["availableNumberOfCoin"],
    profileUpdated: json["profileUpdated"],
    id: json["_id"],
    referId: json["referId"],
    gameDetails: List<dynamic>.from(json["gameDetails"].map((x) => x)),
    name: json["name"],
    throughReference: json["throughReference"],
    avatar: json["avatar"],
    fbId: json["fbId"],
    emailId: json["emailId"],
    gender: json["gender"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet.toJson(),
    "noOfRefers": List<dynamic>.from(noOfRefers.map((x) => x)),
    "favGame": List<dynamic>.from(favGame.map((x) => x)),
    "availableNumberOfCoin": availableNumberOfCoin,
    "profileUpdated": profileUpdated,
    "_id": id,
    "referId": referId,
    "gameDetails": List<dynamic>.from(gameDetails.map((x) => x)),
    "name": name,
    "throughReference": throughReference,
    "avatar": avatar,
    "fbId": fbId,
    "emailId": emailId,
    "gender": gender,
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
