import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/color.dart';
import 'package:temple/services/api/category_service.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/firstpage/card_screen.dart';
import 'package:temple/views/home/controller.dart/Home_controller.dart';
import 'package:temple/views/home/home.dart';
import 'package:temple/views/member/controller/get_member_controller.dart';
import 'package:temple/views/member/screen/add_member.dart';
import 'package:temple/views/otp/otp_screen.dart';
import 'package:temple/views/registration/registration_screen.dart';
import 'package:temple/widget/app_drawer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Getallmembercontroller getallmembercontroller =
      Get.put(Getallmembercontroller());
  Usertaskcontroller usertaskcontroller = Get.put(Usertaskcontroller());

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () async => (true == login)
            ? usernumber != null
                ? getallmembercontroller.memberlist.length <= 1
                    ? usertaskcontroller.usertasklist.isNotEmpty
                        ? Get.offAll(AppDrawer())
                        : Get.offAll(Card_Screen(
                            userid: userid,
                            isback: true,
                          ))
                    : Get.offAll(SelectMember())
                : Get.offAll(OtpScreen())
            : Get.offAll(OtpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            "SPLASH\nSCREEN",
            // fontWeight: FontWeight.w700,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: kPrimarycolor),
            ),
          ),
        ),
      ),
    );
  }
}
