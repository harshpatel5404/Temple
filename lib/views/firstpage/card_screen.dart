import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'dart:math';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:temple/constant/color.dart';
import 'package:temple/services/api/category_service.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/firstpage/card_screen_controller.dart';
import 'package:temple/views/home/controller.dart/Home_controller.dart';
import 'package:temple/views/member/controller/get_member_controller.dart';
import 'package:temple/widget/app_drawer.dart';

import 'dainik_popup.dart';
import 'dainik_popup_controller.dart';

String currentcategory = "bhajan";
// String currentcategory = "નિત્ય ભજન";

class MyCards {
  String totalmember;
  String maincategory;
  String remaning;
  String heading;
  String totallax;
  String color;
  String title;
  String subTitle;
  String taskid;
  String images;
  String categoryid;
  double positionY = 0;
  double rotate = 0;
  double opacity = 0;
  double scal = 0;

  MyCards({
    required this.heading,
    required this.remaning,
    required this.maincategory,
    required this.categoryid,
    required this.totalmember,
    required this.totallax,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.taskid,
    required this.images,
    required this.opacity,
    required this.positionY,
    required this.rotate,
    required this.scal,
  });
}

fromHex(String hexColor) {
  String colorNew = '0xff' + hexColor;
  colorNew = colorNew.replaceAll('#', '');
  int colorInt = int.parse(colorNew);
  return colorInt;
}

DainikPopupController dainikPopupController = Get.put(DainikPopupController());
Getallmembercontroller getallmembercontroller =
    Get.put(Getallmembercontroller());

class Card_Screen extends StatefulWidget {
  final userid;
  const Card_Screen({Key? key, required this.userid}) : super(key: key);

  @override
  State<Card_Screen> createState() => _Card_ScreenState();
}

class _Card_ScreenState extends State<Card_Screen> {
  late int tabIndex;
  late double pageIndex;
  final _pageController = PageController(viewportFraction: 0.4, initialPage: 0);
  ScrollController scrollController = ScrollController();
  NiyamController niyamController = Get.put(NiyamController());
  List<MyCards> cardinfolist = [];
  int days = 0;

  @override
  initState() {
    super.initState();
    getcarddata();
    int pastday = Jiffy().dayOfYear;
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    int totalday =
        Jiffy(DateTime(int.parse(formattedDate.substring(0, 4)), 12, 31))
            .dayOfYear;
    days = totalday - pastday;
    setState(() {
      tabIndex = 0;
    });
  }

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FlutterSwitch(
              height: 25,
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
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "નિયમોની યાદી",
          style: GoogleFonts.balooBhai(
            textStyle: const TextStyle(
              color: Color(0xff008ABD),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Your selected niyams",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
            Obx(() {
              return niyamController.niyamList.isNotEmpty
                  ? SizedBox(
                      height: Get.height * 0.17,
                      width: Get.width,
                      child: ListView.builder(
                          itemCount: niyamController.niyamList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Bounce(
                                    duration: const Duration(milliseconds: 110),
                                    onPressed: () {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (_) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Colors.white,
                                          insetPadding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: SizedBox(
                                            height: Get.height * 0.24,
                                            width: Get.width * 0.8,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 12,
                                                                top: 1),
                                                        child: Icon(
                                                          Icons.cancel_rounded,
                                                          color: Colors.black,
                                                          size: 28,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "Confirmation",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  child: Text(
                                                    "Are you sure you want to remove this niyam from list?",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Get.back();
                                                                  dainikPopupController
                                                                      .totalTarget
                                                                      .value = 0;
                                                                  // print(niyamController
                                                                  //         .niyamList[
                                                                  //     index]["id"]);

                                                                  MyCards carddata = MyCards(
                                                                      maincategory:
                                                                          niyamController.niyamList[index][
                                                                              "maincategory"],
                                                                      remaning:
                                                                          "0",
                                                                      totallax:
                                                                          niyamController.niyamList[index][
                                                                              "totalgole"],
                                                                      heading: niyamController
                                                                              .niyamList[index][
                                                                          "heading"],
                                                                      totalmember:
                                                                          niyamController.niyamList[index]
                                                                              [
                                                                              "totalmember"],
                                                                      color:
                                                                          "#FAE5E1",
                                                                      title: niyamController.niyamList[index]
                                                                          ["title"],
                                                                      subTitle: niyamController.niyamList[index]["subtitle"],
                                                                      categoryid: niyamController.niyamList[index]["categoryid"],
                                                                      taskid: niyamController.niyamList[index]["id"].toString(),
                                                                      images: "assets/Frame.png",
                                                                      rotate: 0,
                                                                      opacity: 0,
                                                                      positionY: 0,
                                                                      scal: 0);
                                                                  print(
                                                                      carddata);

                                                                  niyamController.niyamList[index]
                                                                              [
                                                                              "maincategory"] ==
                                                                          "niyam"
                                                                      ? dainkLaxDialog(
                                                                          context,
                                                                          days,
                                                                          false,
                                                                          carddata,
                                                                          false)
                                                                      : dainkLaxDialog(
                                                                          context,
                                                                          days,
                                                                          false,
                                                                          carddata,
                                                                          true);
                                                                  // dainkLaxDialog(
                                                                  //     context,
                                                                  //     days,
                                                                  //     false,
                                                                  //     carddata,
                                                                  //     true);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      Get.height *
                                                                          0.06,
                                                                  width:
                                                                      Get.width *
                                                                          0.4,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(20)),
                                                                    color: Color(
                                                                        0xff008ABD),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Edit",
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        textStyle:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: InkWell(
                                                                onTap: () {
                                                                  niyamController
                                                                      .niyamList
                                                                      .removeAt(
                                                                          index);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      Get.height *
                                                                          0.06,
                                                                  width:
                                                                      Get.width *
                                                                          0.4,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            bottomRight:
                                                                                Radius.circular(20)),
                                                                    color: Color(
                                                                        0xffF95050),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Remove",
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        textStyle:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 38,
                                            backgroundColor: Color(fromHex(
                                                niyamController.niyamList[index]
                                                    ["color"])),
                                            child: Image(
                                              image: AssetImage(niyamController
                                                  .niyamList[index]["image"]),
                                              height: Get.height * 0.25,
                                              width: Get.width * 0.25,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            niyamController.niyamList[index]
                                                ["title"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                ],
                              ),
                            );
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/noniyam.svg",
                            height: Get.height * 0.12,
                          ),
                          Text(
                            "No Niyam Selected",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      )),
                    );
            }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Text(
                "remaining niyams",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
            SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 31,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: tabIndex == 0
                              ? const Color(0xff008ABD)
                              : const Color(0xffEDEDED),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "નિત્ય ભજન",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color:
                                    tabIndex == 0 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          getbymainCategory("bhajan").then((value) {
                            getcarddata();
                          });
                          currentcategory = "bhajan";
                          tabIndex = 0;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentcategory = "સદગ્રંથ વાંચન";
                          tabIndex = 1;
                        });
                      },
                      child: Container(
                        height: 31,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: tabIndex == 1
                              ? const Color(0xff008ABD)
                              : const Color(0xffEDEDED),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "સદગ્રંથ વાંચન",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color:
                                    tabIndex == 1 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          getbymainCategory("niyam").then((value) {
                            getcarddata();
                          });
                          currentcategory = "niyam";
                          tabIndex = 2;
                        });
                      },
                      child: Container(
                        height: 31,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: tabIndex == 2
                              ? const Color(0xff008ABD)
                              : const Color(0xffEDEDED),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "નિત્ય નિયમ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color:
                                    tabIndex == 2 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentcategory = "કંઠસ્થ ના નિયમો";
                          tabIndex = 3;
                        });
                        // _pageController.jumpToPage(2);
                      },
                      child: Container(
                        height: 31,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: tabIndex == 3
                              ? const Color(0xff008ABD)
                              : const Color(0xffEDEDED),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "કંઠસ્થ ના નિયમો",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color:
                                    tabIndex == 3 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tabIndex = 4;
                          currentcategory = "વાંચન ના નિયમો";
                        });
                        // _pageController.jumpToPage(4);
                      },
                      child: Container(
                        height: 31,
                        width: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: tabIndex == 4
                              ? const Color(0xff008ABD)
                              : const Color(0xffEDEDED),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "વાંચન ના નિયમો",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color:
                                    tabIndex == 4 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: Get.height * .6,
                child: CardSlider(height: Get.height * .6),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() => niyamController.niyamList.isNotEmpty
          ? Container(
              height: Get.height * 0.07,
              width: Get.width * 0.70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimarycolor,
              ),
              child: FloatingActionButton.extended(
                backgroundColor: kPrimarycolor,
                onPressed: () async {
                  for (var i = 0; i < niyamController.niyamList.length; i++) {
                    await addTask(niyamController.niyamList[i]);
                  }
                  Usertaskcontroller usertaskcontroller = Get.find();
                  await getuserid();
                  usertaskcontroller.getusertask(userid!);
                  Get.offAll(AppDrawer());
                },
                label: const Text(
                  "આગળ વધો ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Container(
              // color: Colors.transparent,
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

RxList cardinfolist = [].obs;
void getcarddata() {
  cardinfolist.clear();
  for (var i = 0; i < maincategorylist.length; i++) {
    cardinfolist.add(
      MyCards(
          maincategory: maincategorylist[i]["maincategory"],
          remaning: "0",
          totallax: maincategorylist[i]["totallax"],
          heading: maincategorylist[i]["heading"],
          totalmember: maincategorylist[i]["totalmember"],
          color: "#FAE5E1",
          title: maincategorylist[i]["title"],
          subTitle: maincategorylist[i]["subtitle"],
          categoryid: maincategorylist[i]["id"].toString(),
          taskid: maincategorylist[i]["id"].toString(),
          images: "assets/Frame.png",
          rotate: 0,
          opacity: 0,
          positionY: 0,
          scal: 0),
    );
  }
}

class CardSlider extends StatefulWidget {
  final height;
  CardSlider({Key? key, required this.height}) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double? positionYline1;
  double? positionYline2;
  double? _middleAreahieght;
  double? _outsidecardinterval;
  late double scrroloffsetY;
  // List cardinfolist = [];
  int days = 0;

  @override
  void initState() {
    super.initState();
    int pastday = Jiffy().dayOfYear;
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    int totalday =
        Jiffy(DateTime(int.parse(formattedDate.substring(0, 4)), 12, 31))
            .dayOfYear;
    days = totalday - pastday;
    positionYline1 = widget.height * .1;
    positionYline2 = positionYline1! + 210;
    _middleAreahieght = positionYline2! - positionYline1!;
    _outsidecardinterval = 30.0;
    scrroloffsetY = 1;

    getcarddata();
    // for (var i = 0; i < maincategorylist.length; i++) {
    //   print(maincategorylist[i]);

    // cardinfolist.add(
    //   MyCards(
    //       maincategory: maincategorylist[i]["maincategory"],
    //       remaning: "0",
    //       totallax: maincategorylist[i]["totallax"],
    //       heading: maincategorylist[i]["heading"],
    //       totalmember: maincategorylist[i]["totalmember"],
    //       color: "#FAE5E1",
    //       title: maincategorylist[i]["title"],
    //       subTitle: maincategorylist[i]["subtitle"],
    //       categoryid: maincategorylist[i]["id"].toString(),
    //       taskid: maincategorylist[i]["id"].toString(),
    //       images: "assets/Frame.png",
    //       rotate: 0,
    //       opacity: 0,
    //       positionY: 0,
    //       scal: 0),
    // );
    // }

    // cardinfolist = [
    //   MyCards(
    //       color: "#FAE5E1",
    //       title: "માળા",
    //       subTitle: "હું નિયમિત માળા કરીશ ",
    //       images: "assets/Frame.png",
    //       rotate: 0,
    //       opacity: 0,
    //       positionY: 0,
    //       scal: 0),
    //   MyCards(
    //       color: "#FFF4E2",
    //       title: "દંડવત",
    //       subTitle: "હું નિયમિત દંડવત કરીશ",
    //       images: "assets/Frame.png",
    //       rotate: 0,
    //       opacity: 0,
    //       positionY: 0,
    //       scal: 0),
    //   MyCards(
    //       color: "#FFDCDA",
    //       title: "પ્રદક્ષિણા",
    //       subTitle: "હું નિયમિત પ્રદક્ષિણા કરીશ",
    //       images: "assets/Frame.png",
    //       rotate: 0,
    //       opacity: 0,
    //       positionY: 0,
    //       scal: 0),
    //   MyCards(
    //       color: "#E4D7C4",
    //       title: "મંત્ર લેખન",
    //       subTitle: "હું નિયમિત મંત્ર લેખન કરીશ",
    //       images: "assets/Frame.png",
    //       rotate: 0,
    //       opacity: 0,
    //       positionY: 0,
    //       scal: 0),
    //   MyCards(
    //       color: "#F5F5F5",
    //       title: "હરિ સ્મૃતિ",
    //       subTitle: "હું નિયમિત હરિ સ્મૃતિ કરીશ",
    //       images: "assets/Frame.png",
    //       rotate: 0,
    //       opacity: 0,
    //       positionY: 0,
    //       scal: 0),
    //   MyCards(
    //       color: "#C2F2D0",
    //       title: "વચનામૃત ના પાઠ",
    //       subTitle: "હું નિયમિત વચનામૃત ના પાઠ કરીશ",
    //       images: "assets/Frame.png",
    //       rotate: 0,
    //       opacity: 0,
    //       positionY: 0,
    //       scal: 0),
    // ];

    for (var i = 0; i < cardinfolist.length; i++) {
      MyCards cardinfo = cardinfolist[i];
      if (i == 0) {
        cardinfo.positionY = positionYline1!;
        cardinfo.opacity = 1.0;
        cardinfo.rotate = 1.0;
        cardinfo.scal = 1.0;
      } else {
        cardinfo.positionY = positionYline2! + (i - 1) * 30;
        cardinfo.opacity = 0.7 - (i - 1) * 0.1;
        cardinfo.rotate = -60;
        cardinfo.scal = 0.9;
      }
    }
    cardinfolist.value = cardinfolist.reversed.toList();
  }

  late double CurrentCardAtAreaIdx2 = 0;
  _updatecardposition(double? offsetY) {
    void updateposition(
        MyCards cardinfo, double firstCardAtAreaIdx, int index) {
      double CurrentCardAtAreaIdx = firstCardAtAreaIdx + index;
      CurrentCardAtAreaIdx2 = CurrentCardAtAreaIdx;

      if (CurrentCardAtAreaIdx < 0) {
        cardinfo.positionY =
            positionYline1! + CurrentCardAtAreaIdx * _outsidecardinterval!;

        cardinfo.rotate = -90.0 /
            _outsidecardinterval! *
            (positionYline1! - cardinfo.positionY);
        if (cardinfo.rotate > 0.1) cardinfo.rotate = 0.1;
        if (cardinfo.rotate < -90.0) cardinfo.rotate = -90.0;

        cardinfo.scal = 1.0 -
            0.2 /
                _outsidecardinterval! *
                (positionYline1! - cardinfo.positionY);
        if (cardinfo.scal < 0.8) cardinfo.scal = 0.8;
        if (cardinfo.scal > 1.0) cardinfo.scal = 1.0;

        cardinfo.opacity = 1 -
            0.7 /
                _outsidecardinterval! *
                (positionYline1! - cardinfo.positionY);
        if (cardinfo.opacity < 0.0) cardinfo.opacity = 0.0;
        if (cardinfo.opacity > 1.0) cardinfo.opacity = 1.0;
      } else if (CurrentCardAtAreaIdx >= 0 && CurrentCardAtAreaIdx < 1) {
        cardinfo.positionY =
            positionYline1! + CurrentCardAtAreaIdx * _middleAreahieght!;

        cardinfo.rotate = -60.0 /
            (positionYline2! - positionYline1!) *
            (cardinfo.positionY - positionYline1!);
        if (cardinfo.rotate > 0.0) cardinfo.rotate = 0.0;
        if (cardinfo.rotate < -60.0) cardinfo.rotate = -60.0;

        cardinfo.scal = 1.0 -
            0.1 /
                (positionYline2! - positionYline1!) *
                (cardinfo.positionY - positionYline1!);
        if (cardinfo.scal < 0.9) cardinfo.scal = 0.9;
        if (cardinfo.scal > 1.0) cardinfo.scal = 1.0;

        cardinfo.opacity = 1.0 -
            0.3 /
                (positionYline2! - positionYline1!) *
                (cardinfo.positionY - positionYline1!);
        if (cardinfo.opacity < 0.0) cardinfo.opacity = 0.0;
        if (cardinfo.opacity > 1.0) cardinfo.opacity = 1.0;
      } else if (CurrentCardAtAreaIdx >= 1) {
        cardinfo.positionY = positionYline2! +
            (CurrentCardAtAreaIdx - 1) * _outsidecardinterval!;

        cardinfo.rotate = -60.0;
        cardinfo.scal = 0.9;
        cardinfo.opacity = 0.9;
      }
    }

    scrroloffsetY += offsetY!;

    double firstCardAtAreaIdx = scrroloffsetY / _middleAreahieght!;

    for (var i = 0; i < cardinfolist.length; i++) {
      MyCards cardinfo = cardinfolist[cardinfolist.length - 1 - i];
      updateposition(cardinfo, firstCardAtAreaIdx, i);
    }
    setState(() {});
  }

  int a = 0;
  _buildcard() {
    List widgetList = [];
    for (MyCards cardinfo in cardinfolist) {
      widgetList.add(
        Positioned(
          top: cardinfo.positionY,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0012)
              ..rotateX(pi / 180 * cardinfo.rotate)
              ..scale(cardinfo.scal),
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: cardinfo.opacity,
              child: InkWell(
                onTap: () {
                  dainikPopupController.totalTarget.value = 0;
                  cardinfo.maincategory =="niyam"
                      ? dainkLaxDialog(context, days, false, cardinfo, false)
                      : dainkLaxDialog(context, days, false, cardinfo, true);

                  // dainkLaxDialog(context, days, true, cardinfo, true);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(fromHex(cardinfo.color)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 3),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${cardinfo.heading}",
                            // "રજત જયંતી મહોત્સવ ઉપક્રમે",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff727272),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardinfo.title,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    cardinfo.subTitle,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    "આ નિયમમાં જોડાયેલા કુલ સભ્યો",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    " ${cardinfo.totalmember}/ 500",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image(
                              image: AssetImage(cardinfo.images),
                              height: 105,
                              width: 95,
                            )
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 30,
                                  width: 250,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffCBAA77),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ટોટલ લક્ષ્ય :${cardinfo.totallax} / 2500000",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      );
      // : null;
    }
    a = widgetList.length;
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails d) {
        if (CurrentCardAtAreaIdx2 > cardinfolist.length ||
            CurrentCardAtAreaIdx2 < 0) {
          return;
        } else {
          _updatecardposition(d.delta.dy);
        }
      },
      onVerticalDragEnd: (DragEndDetails d) {
        scrroloffsetY =
            (scrroloffsetY / _middleAreahieght!).round() * _middleAreahieght!;
        _updatecardposition(0);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.expand,
          children: [
            ..._buildcard(),
          ],
        ),
      ),
    );
  }
}
