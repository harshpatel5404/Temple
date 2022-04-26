 // To parse this JSON data, do
//
//     final membermodel = membermodelFromMap(jsonString);

import 'dart:convert';

class Membermodel {
    Membermodel({
        this.code,
        this.message,
        this.data,
    });

    final String? code;
    final String ?message;
    final List<Memberdatalist>? data;

    factory Membermodel.fromJson(String str) => Membermodel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Membermodel.fromMap(Map<String, dynamic> json) => Membermodel(
        code: json["code"],
        message: json["message"],
        data: List<Memberdatalist>.from(json["data"].map((x) => Memberdatalist.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Memberdatalist {
    Memberdatalist({
        this.number,
        this.gender,
        this.firstname,
        this.lastname,
        this.middelname,
    });

    final int ?number;
    final String ?gender;
    final String ?firstname;
    final String ?lastname;
    final String ?middelname;

    factory Memberdatalist.fromJson(String str) => Memberdatalist.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Memberdatalist.fromMap(Map<String, dynamic> json) => Memberdatalist(
        number: json["number"],
        gender: json["gender"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        middelname: json["middelname"],
    );

    Map<String, dynamic> toMap() => {
        "number": number,
        "gender": gender,
        "firstname": firstname,
        "lastname": lastname,
        "middelname": middelname,
    };
}
