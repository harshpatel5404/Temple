import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/color.dart';
import 'package:temple/constant/snack_bar.dart';
import 'package:temple/services/notification_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/otp/otp_screen.dart';
import 'package:temple/views/registration/registration_screen.dart';
import 'package:temple/widget/app_button.dart';
import 'package:timezone/data/latest.dart' as tz;

class VerifyOtp extends StatefulWidget {
  String mobileNumber;
  String countryCode;
  final otpCode;
  VerifyOtp(
      {Key? key,
      required this.mobileNumber,
      required this.countryCode,
      this.otpCode})
      : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool status = false;
  // TextEditingController otp = TextEditingController();
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;
  String? otp;
  var code;

  @override
  initState() {
    super.initState();
    tz.initializeTimeZones();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void _resendCode() {
    var rng = Random();
    code = rng.nextInt(9000) + 1000;
    NotificationService()
        .showNotification(1, "OTP Verification Code", "$code", 1);
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(left: 10, right: 10, top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text(
                        "BHAJAN BANK",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: FlutterSwitch(
                          height: 25,
                          width: 45,
                          activeColor: Colors.white,
                          activeToggleColor: Color(0xff015084),
                          activeTextColor: Color(0xff012353),
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
                  Image.asset(
                    'assets/sms.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ENTER OTP TO VERIFY',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'OTP has been sent to ${widget.countryCode} ${widget.mobileNumber}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      Get.off(OtpScreen());
                    },
                    child: Text(
                      'Change Number ?',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Colors.white,
                    showFieldAsBox: true,
                    enabledBorderColor: Colors.white,
                    disabledBorderColor: Colors.white,
                    focusedBorderColor: Colors.white,
                    fieldWidth: 50,
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                    decoration: InputDecoration(),
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      setState(() {
                        otp = verificationCode;
                      });
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          'Resend Otp?',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                              color: enableResend
                                  ? Colors.black45
                                  : Colors.white38,
                            ),
                          ),
                        ),
                        onPressed: enableResend ? _resendCode : null,
                      ),
                      Text(
                        'after $secondsRemaining seconds',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.05),
          AppButton(
            onPress: ()  async{
              if (otp == widget.otpCode.toString() || otp == code.toString()){
                scaffoldMessage(context, "Otp Verification Successfully");
                // var number = int.parse(widget.mobileNumber);
             
                Get.off(RegistrationScreen(
                  mobileNumber: widget.mobileNumber,
                ));
              } else {
                scaffoldMessage(context, "Otp code is not valid");
              }
            },
            text: "VERIFY",
          )
        ],
      ),
    );
  }
}
