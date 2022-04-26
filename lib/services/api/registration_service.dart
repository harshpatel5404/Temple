import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:temple/services/api/api_services.dart';
import '../pref_manager.dart';

String? usernumber;
String? userid;
bool? login;
Future registerUser(Map data) async {
  var dio = Dio();
  var formData = data["image"] != ""
      ? FormData.fromMap({
          "number": data["number"],
          "dob": data["dob"],
          "gender": data["gender"],
          "firstname": data["firstname"],
          "lastname": data["lastname"],
          "middelname": data["middelname"],
          "task": "no",
          "coin": "1",
          "upload": await MultipartFile.fromFile(data["image"],
              filename: DateTime.now().microsecond.toString())
        })
      : FormData.fromMap({
          "number": data["number"],
          "dob": data["dob"],
          "gender": data["gender"],
          "firstname": data["firstname"],
          "lastname": data["lastname"],
          "middelname": data["middelname"],
          "task": "no",
          "coin": "1",
        });

  try {
    dynamic response;
    response = data["image"] != ""
        ? await dio.post(baseUrl + "api/login", data: formData)
        : await dio.post(baseUrl + "withoutphotologin", data: formData);
    if (response.data["message"] == "User Loggin") {
      await setusernumber(data["number"]);
      userid = response.data["data"]["id"].toString();
      await setuserid(userid!);
      return response.data["data"]["id"];
    } else {
      return 0;
    }
  } catch (e) {
    print(e);
  }
}



Future deleteUser(id) async {
  final response = await http
      .post(Uri.parse(baseUrl + 'deleteUser'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({"id": id}),
          encoding: Encoding.getByName('utf-8'))
      .then((response) {
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata);
    }
  });
}
