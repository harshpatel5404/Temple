// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

class UserModel {
    UserModel({
        this.message,
        this.data,
    });

    final String? message;
    final List<Datalist>? data;

    factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        data: List<Datalist>.from(json["data"].map((x) => Datalist.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Datalist {
    Datalist({
        this.id,
        this.number,
        this.gender,
        this.firstname,
        this.lastname,
        this.middelname,
        this.dob,
        this.member,
        this.createdAt,
        this.updatedAt,
    });

    final int ?id;
    final String ?number;
    final String ?gender;
    final String ?firstname;
    final String ?lastname;
    final String ?middelname;
    final DateTime ?dob;
    final dynamic ? member;
    final DateTime ?createdAt;
    final DateTime ?updatedAt;

    factory Datalist.fromJson(String str) => Datalist.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datalist.fromMap(Map<String, dynamic> json) => Datalist(
        id: json["id"],
        number: json["number"],
        gender: json["gender"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        middelname: json["middelname"],
        dob: DateTime.parse(json["dob"]),
        member: json["member"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "number": number,
        "gender": gender,
        "firstname": firstname,
        "lastname": lastname,
        "middelname": middelname,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "member": member,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
    };
}
