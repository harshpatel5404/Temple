import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temple/services/api/registration_service.dart';

import 'api_services.dart';

Future addUserDailytask(data, todaycomplatetask, remaning) async {
  final response = await http
      .post(Uri.parse(baseUrl + 'dailytask/addUserDailyTask'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "uid": userid,
            "toaltask": data["toaltask"],
            "todaytask": data["todaytask"],
            "todaycomplatetask": todaycomplatetask,
            "date": "1",
            "remaningtask": remaning,
            "taskid": data["taskid"]
          }),
          encoding: Encoding.getByName('utf-8'))
      .then((response) {
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print(jsondata);
    }
  });
}

Future deletetask(id) async {
  final response = await http
      .post(Uri.parse(baseUrl + 'deleteUserTask'),
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
 