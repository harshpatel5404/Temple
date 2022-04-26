import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/color.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/firstpage/dainik_popup_controller.dart';
import 'package:temple/views/firstpage/card_screen_controller.dart';

import 'card_screen.dart';

Future dainkLaxDialog(
    context, int days, istask, MyCards taskdata, bool isNiyam) {
  DainikPopupController dainikPopupController =
      Get.put(DainikPopupController());
  NiyamController niyamController = Get.put(NiyamController());
  TextEditingController dailyController = TextEditingController();

  getuserid();
  dainikPopupController.totalTarget.value = 0;
  // bool ischesta = false;
  if (!isNiyam) {
    dainikPopupController.totalTarget.value = days;
  }
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Container(
        height: Get.height * 0.7,
        width: Get.width * 0.9,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 40,
            title: Text(
              "દૈનિક લક્ષ્ય",
              style: GoogleFonts.balooBhai(
                textStyle: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.w700,
                  color: Color(0xff008ABD),
                ),
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Bounce(
                  child: const Image(
                    image: AssetImage('assets/close.png'),
                    height: 25,
                    width: 25,
                  ),
                  duration: const Duration(milliseconds: 110),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    taskdata.title,
                    // "માળા",
                    style: GoogleFonts.balooBhai(
                      textStyle: const TextStyle(
                        fontSize: 23,
                        // fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: Get.height * 0.22,
                    width: Get.width,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 138, 189, 0.09),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(
                      image: AssetImage(taskdata.images),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Text("દરરોજ તમે કેટલી ${widget.title} કરશો ?",
                  Text(
                    "દરરોજ તમે કેટલી ${taskdata.title} કરશો ?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  !isNiyam
                      ? Container(
                          height: Get.height * 0.1,
                          width: Get.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xffEEEEEE),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      : TextFormField(
                          controller: dailyController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 25),
                          ),
                          // controller: target,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xffEEEEEE),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xffEEEEEE),
                                )),
                            suffixIcon: const Icon(Icons.create_sharp,
                                color: Color(0xffBDBDBD), size: 25),
                            filled: true,
                            fillColor: const Color(0xffEEEEEE),
                          ),

                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              dainikPopupController.totalTarget.value =
                                  int.parse(value) * days;
                            }
                          },
                        ),
                  const SizedBox(height: 10),
                  Text(
                    "વર્ષ દરમ્યાન ની કુલ ${taskdata.title}",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Text( "Target",
                  Obx(
                    () =>
                        Text(dainikPopupController.totalTarget.value.toString(),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffBDBDBD),
                              ),
                            )),
                  ),

                  SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: Color(0xffBDBDBD),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "નોંધ : ${taskdata.subTitle}",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        bool alreday = false;
                        if (niyamController.niyamList.isNotEmpty) {
                          niyamController.niyamList.forEach((element) {
                            if (element["title"] == taskdata.title) {
                              alreday = true;
                              Get.back();
                              if (istask == false) {
                                element["daily"] = dailyController.text;
                                element["total"] =
                                    dainikPopupController.totalTarget.value;
                              }
                              istask
                                  ? Fluttertoast.showToast(
                                      msg: "Task Already Exists",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red[400],
                                      textColor: Colors.white,
                                      fontSize: 16.0)
                                  : Fluttertoast.showToast(
                                      msg: "Updated",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green[400],
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                            }
                          });
                        } else {
                          Map data = {
                            "maincategory": taskdata.maincategory,
                            "title": taskdata.title,
                            "image": taskdata.images,
                            "color": taskdata.color,
                            "daily": isNiyam ? dailyController.text : "1",
                            "total": dainikPopupController.totalTarget.value,
                            "subtitle": taskdata.subTitle,
                            "taskid": taskdata.taskid,
                            "uid": userid,
                            "heading": taskdata.heading,
                            "remaning": taskdata.remaning,
                            "totalgole": "1",
                            "totalmember": "1",
                            "categoryid": taskdata.categoryid
                          };
                          print(data);
                          dainikPopupController.totalTarget.value != 0
                              ? niyamController.niyamList.add(data)
                              : null;
                          Get.back();
                          return;
                        }

                        if (!alreday &&
                            dainikPopupController.totalTarget.value != 0) {
                          Map data = {
                            "maincategory": taskdata.maincategory,
                            "title": taskdata.title,
                            "image": taskdata.images,
                            "color": taskdata.color,
                            "daily": isNiyam ? dailyController.text : "1",
                            "total": dainikPopupController.totalTarget.value,
                            "subtitle": taskdata.subTitle,
                            "taskid": taskdata.taskid,
                            "uid": userid,
                            "heading": taskdata.heading,
                            "remaning": taskdata.remaning,
                            "totalgole": "1",
                            "totalmember": "21",
                            "categoryid": taskdata.categoryid
                          };

                          niyamController.niyamList.add(data);
                          Get.back();
                        } else {
                          Get.back();
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimarycolor),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(color: kPrimarycolor)))),
                      child: Text(
                        "આગળ વધો",
                        style: GoogleFonts.balooBhai(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.4,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
