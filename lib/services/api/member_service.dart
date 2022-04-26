import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temple/models/member_model.dart';
import 'package:temple/services/api/api_services.dart';

Future<Membermodel?> fetchmemberdata() async {
  final response = await http.get(Uri.parse(baseUrl + 'api/user'));
  if (response.statusCode == 200) {
    return Membermodel.fromMap(jsonDecode(response.body));
  } else {
    return null;
  }
}
