// To parse this JSON data, do
//
//     final usertaskModel = usertaskModelFromMap(jsonString);

import 'dart:convert';

class UsertaskModel {
  UsertaskModel({
    this.message,
    this.data,
  });

  final String? message;
  final List<Usertasklist>? data;

  factory UsertaskModel.fromJson(String str) =>
      UsertaskModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsertaskModel.fromMap(Map<String, dynamic> json) => UsertaskModel(
        message: json["message"],
        data: List<Usertasklist>.from(
            json["data"].map((x) => Usertasklist.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Usertasklist {
  Usertasklist({
    this.id,
    this.uid,
    this.heading,
    this.title,
    this.subtitle,
    this.totalgole,
    this.totalmember,
    this.maincategory,
    this.daily,
    this.total,
    this.taskid,
    this.remaning,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? uid;
  final String? heading;
  final String? title;
  final String? subtitle;
  final String? totalgole;
  final String? totalmember;
  final String? maincategory;

  final String? daily;
  final String? total;
  final String? taskid;
  final String? remaning;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Usertasklist.fromJson(String str) =>
      Usertasklist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usertasklist.fromMap(Map<String, dynamic> json) => Usertasklist(
        id: json["id"],
        uid: json["uid"],
        heading: json["heading"],
        title: json["title"],
        subtitle: json["subtitle"],
        totalgole: json["totalgole"],
        totalmember: json["totalmember"],
        maincategory: json["maincategory"],
        daily: json["daily"],
        total: json["total"],
        taskid: json["taskid"],
        remaning: json["remaning"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uid": uid,
        "heading": heading,
        "title": title,
        "subtitle": subtitle,
        "totalgole": totalgole,
        "totalmember": totalmember,
        "maincategory": maincategory,
        "daily": daily,
        "total": total,
        "taskid": taskid,
        "remaning": remaning,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
