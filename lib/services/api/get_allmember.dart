import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:temple/services/api/api_services.dart';
import 'package:temple/views/member/screen/model/user_model.dart';

Future<UserModel?> Getallmember(number) async {
  print("by number call");
  final response =
      await http.post(Uri.parse(baseUrl + "getuserbynumber"),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            'number': number,
          }),
          encoding: Encoding.getByName('utf-8'));

  if (response.statusCode == 200) {
    print("data added"); 
    print(UserModel.fromMap(jsonDecode(response.body)));
    return UserModel.fromMap(jsonDecode(response.body));
  } else {
    print("data not add");
    return null;
  }
}
