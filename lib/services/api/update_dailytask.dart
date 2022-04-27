import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/views/mala_screen/mala_controller.dart';
import 'api_services.dart';

MalaController malacontroller = Get.put(MalaController());
var today;
Future addUserDailytask(data, todaycomplatetask, remaning) async {
  DateTime currentDate = DateTime.now();
  var dt = DateFormat('yyyy-MM-dd').format(currentDate);
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
            "date": dt.toString(),
            "remaningtask": remaning,
            "maincategory": data["maincategory"],
            "taskname": data["title"],
            "taskid": data["taskid"]
          }),
          encoding: Encoding.getByName('utf-8'))
      .then((response) {
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print("added");
      print(jsondata);
    }
  });
}

Future updateUserDailytask(data, todaycomplatetask, remaning) async {
  DateTime currentDate = DateTime.now();
  var dt = DateFormat('yyyy-MM-dd').format(currentDate);
  final response = await http
      .post(Uri.parse(baseUrl + 'dailytask/UpdateUserDailyTask'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "uid": userid,
            "toaltask": data["toaltask"],
            "todaytask": data["todaytask"],
            "todaycomplatetask": todaycomplatetask,
            "date": dt.toString(),
            "remaningtask": remaning,
            "maincategory": data["maincategory"],
            "taskname": data["title"],
            "taskid": data["taskid"]
          }),
          encoding: Encoding.getByName('utf-8'))
      .then((response) {
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      print("update");
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

Future findByTaskId(taskid) async {
  final response =
      await http.post(Uri.parse(baseUrl + 'dailytask/findByTaskId'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({"taskid": taskid}),
          encoding: Encoding.getByName('utf-8'));

  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);

    today = jsondata["data"][0]["todaycomplatetask"];
    malacontroller.completetask.value =
        jsondata["data"][0]["todaycomplatetask"].toString();
    // print(malacontroller.completeTask.value);
    return today;
  }
}
