import 'dart:math';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/snack_bar.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/notification_service.dart';
import 'package:temple/views/member/controller/get_member_controller.dart';
import 'package:temple/views/member/screen/add_member.dart';
import 'package:temple/views/otp/verify_otp.dart';
import 'package:temple/widget/app_button.dart';
import 'package:timezone/data/latest.dart' as tz;

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String countryCode = "+91";
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileNumber = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: Get.height * 0.75,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/blue_bg.png'), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 45),
                  Text(
                    'BHAJAN BANK',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Image.asset(
                    'assets/otp.png',
                    height: 180,
                    width: 180,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'PHONE VERIFICATION',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Please Enter Your Mobile Number',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CountryListPick(
                    theme: CountryTheme(
                      isShowFlag: true,
                      isShowTitle: true,
                      isShowCode: true,
                      isDownIcon: true,
                    ),
                    initialSelection: '+91',
                    useUiOverlay: true,
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      flexibleSpace: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              'Select the country',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        countryCode = value!.dialCode!;
                        print(countryCode);
                      });
                    },
                  ),
                  const Divider(
                    height: 4,
                    color: Colors.white,
                    thickness: 1,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: mobileNumber,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.bottom,
                    maxLength: 10,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Number',
                      hintStyle:  TextStyle(
                        color: Colors.white,
                      ),
                      counterText: "",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.05),
          AppButton(
            text: "GET OTP",
            onPress: () {
              var rng = Random();
              var code = rng.nextInt(9000) + 1000;
              // print("code is ${code}");
              if (mobileNumber.text.isEmpty) {
                scaffoldMessage(context, "Enter the mobile number");
              } else if (mobileNumber.text.length < 10 ||
                  mobileNumber.text.length > 10) {
                scaffoldMessage(
                    context, "mobile number must be 10 characters.");
              } else {
                NotificationService()
                    .showNotification(1, "OTP Verification Code", "$code", 1);
                Get.to(VerifyOtp(
                  mobileNumber: mobileNumber.text,
                  countryCode: countryCode,
                  otpCode: code,
                ));
              }
            },
          )
      
        ],
      ),
    );
  }
}
