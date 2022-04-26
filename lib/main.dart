// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:temple/services/api/category_service.dart';
import 'package:temple/services/notification_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/home/controller.dart/Home_controller.dart';
import 'package:temple/views/registration/registration_screen.dart';
import 'package:temple/views/splash_screen/splash_screen.dart';
import 'services/api/registration_service.dart';
import 'views/member/controller/get_member_controller.dart';
import 'views/member/screen/add_member.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  // removelogin();
  // removeusernumber();
  // removeuserid();
  usernumber = await getusernumber();
  login = await getlogin();
  userid = await getuserid();
  Getallmembercontroller getallmembercontroller =
      Get.put(Getallmembercontroller());
  Usertaskcontroller usertaskcontroller = Get.put(Usertaskcontroller());

  await getbymainCategory("bhajan");
  await getallmembercontroller.getmemberdata();
  if (userid != null) {
    await usertaskcontroller.getusertask(userid);
  }

  runApp(MyApp(defaultHome: SplashScreen()));
}

class MyApp extends StatelessWidget {
  final Widget defaultHome;
  const MyApp({Key key, this.defaultHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bhajan Bank",
      home: defaultHome,
    );
  }
}
