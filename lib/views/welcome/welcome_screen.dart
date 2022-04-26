import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:temple/constant/color.dart';

class Welcomescreen extends StatefulWidget {
  Welcomescreen({Key? key}) : super(key: key);

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

bool status = false;

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    //     systemOverlayStyle: const SystemUiOverlayStyle(
          
    //       statusBarColor: Colors.white,
    //        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    // statusBarBrightness: Brightness.light
    //     ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "BHAJAN BANK",
          style: TextStyle(color: kPrimarycolor, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FlutterSwitch(
              height: 28,
              width: 50,
              activeColor: Colors.black,
              activeTextColor: Colors.white,
              inactiveColor: Colors.grey,
              inactiveTextColor: Colors.black,
              activeText: "ગુ ",
              inactiveText: "ગુ ",
              value: status,
              valueFontSize: 10.0,
              borderRadius: 30.0,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Stack(children: [
            SizedBox(
              height: Get.height * 0.65,
              width: double.infinity,
              child: SvgPicture.asset("Assets/registration.svg"),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 100,
              bottom: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "3D \nWELCOME\n SCREEN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kPrimarycolor),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
