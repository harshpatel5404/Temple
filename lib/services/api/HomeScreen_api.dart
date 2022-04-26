import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:temple/services/api/api_services.dart';
import 'package:temple/views/home/model/usertask_model.dart';

Future<UsertaskModel?> Getusertask(uid) async {
  final response = await http.post(Uri.parse(baseUrl + 'getUserTask'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        'uid': uid,
      }),
      encoding: Encoding.getByName('utf-8'));

  if (response.statusCode == 200) {
    var data = UsertaskModel.fromMap(jsonDecode(response.body));
    print("usertask");
    // print(data.data![0].daily);
    return UsertaskModel.fromMap(jsonDecode(response.body));
  } else {
    print("data not usertask");
    return null;
  }
}
