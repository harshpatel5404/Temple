import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temple/services/api/registration_service.dart';

class PrefManager extends GetxController {
  RxString mobileNumber = "".obs;
}

Future setlogin(bool login) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('Islogin', login);
}

Future<bool?> getlogin() async {
  final prefs = await SharedPreferences.getInstance();
  login = prefs.getBool('Islogin');

  return prefs.getBool('Islogin');
}

Future<bool?> removelogin() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove('Islogin');
}

Future<void> setusernumber(String usernumber) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('Usernumber', usernumber);
  // print("add mobile to local");
}

Future<String?> getusernumber() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  usernumber = prefs.getString("Usernumber");
  return usernumber;
}

Future<void> removeusernumber() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('Usernumber');
}

Future<String?> removeuserid() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('Userid');
}

Future setuserid(String userid) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('Userid', userid);
}

Future<String?> getuserid() async {
  final prefs = await SharedPreferences.getInstance();
  userid = prefs.getString('Userid');
  return prefs.getString('Userid');
}
Future setusername(String username) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
}

Future<String?> getusername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}


Future setuserindex( userindex) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('userindex', userindex);
}

Future<int?> getuserindex() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('userindex');
}
