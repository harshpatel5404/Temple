import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_services.dart';

// const baseURL = "https://bhajan-bank-api.kalakunjmandir.in/";
Future addTask(Map taskdata) async {
  final response = await http.post(Uri.parse(baseUrl + 'taskadd'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "uid": taskdata["uid"],
        "heading": taskdata["heading"],
        "title": taskdata["title"],
        "subtitle": taskdata["subtitle"],
        "daily": taskdata["daily"],
        "total": taskdata["total"],
        "categoryid": taskdata["categoryid"],
        "maincategory" : taskdata["maincategory"]
      }),
      encoding: Encoding.getByName('utf-8'));

  if (response.statusCode == 200) {
    print("data added");
    print(response.body);
  } else {
    print("data not add");
  }
}

// List allCategory = [];
// Future getCategory() async {
//   final response = await http.post(
//     Uri.parse(baseUrl + 'category/get'),
//     headers: {
//       'Content-Type': 'application/json',
//     },
//   ).then((response) {
//     if (response.statusCode == 200) {
//       var jsondata = json.decode(response.body);
//       allCategory = jsondata["data"];
//       return allCategory;
//     }
//   });
// }
List maincategorylist = [];
Future getbymainCategory(category) async {
  maincategorylist.clear();
  print("by main category call");
  final response =
      await http.post(Uri.parse(baseUrl + 'category/findbyMainCategory'),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            'maincategory': category,
          }),
          encoding: Encoding.getByName('utf-8'));

  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    maincategorylist = jsondata["data"];
    // print("bymain $category");
    // print(maincategorylist);
    return maincategorylist;
  } else {
    // print("bymain data not found");
    return null;
  }
}
