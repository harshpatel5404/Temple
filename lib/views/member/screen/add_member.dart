import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
import 'package:temple/views/otp/otp_screen.dart';
import 'package:temple/views/registration/registration_screen.dart';
import 'package:temple/widget/app_drawer.dart';

class SelectMember extends StatefulWidget {
  const SelectMember({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectMember> createState() => _SelectMemberState();
}

Getallmembercontroller getallmembercontroller =
    Get.put(Getallmembercontroller());
Usertaskcontroller usertaskcontroller = Get.find();

bool status = false;
List membercolor = [
  // {
  //   "color": Color(0xff4CADCE),
  //   "lcolor": Color(0xffE3F8FF),
  //   "image": "assets/member3.svg"
  // },
  // {
  // "color": Color(0xffD6B960),
  // "lcolor": Color(0xffFFF7DE),
  // "image": "assets/member2.svg"
  // },
  {
    "color": const Color(0xffDF5679),
    "lcolor": const Color(0xffFFEFF3),
    "image": "assets/member1.svg"
  },
];

class _SelectMemberState extends State<SelectMember> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getallmembercontroller.getmemberdata();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Center(
          child: Text(
            "SELECT MEMBER",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: kPrimarycolor, fontWeight: FontWeight.w700),
            ),
          ),
        ),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: Get.height * 0.18,
                ),
                Obx(() {
                  return getallmembercontroller.memberlist.isNotEmpty
                      ? Column(
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 25),
                              itemCount:
                                  getallmembercontroller.memberlist.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (getallmembercontroller.memberlist.length +
                                        1 !=
                                    index + 1) {
                                  return InkWell(
                                    onTap: () {
                                      userid = getallmembercontroller
                                          .memberlist[index].id
                                          .toString();
                                      setuserid(getallmembercontroller
                                          .memberlist[index].id
                                          .toString());
                                      usertaskcontroller
                                          .getusertask(getallmembercontroller
                                              .memberlist[index].id
                                              .toString())
                                          .then((value) {
                                        usertaskcontroller
                                                .usertasklist.isNotEmpty
                                            ? Get.offAll(AppDrawer())
                                            : Get.to(Card_Screen(
                                                userid: getallmembercontroller
                                                    .memberlist[index].id
                                                    .toString(),
                                              ));
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: membercolor[0]["lcolor"],
                                              border: Border.all(
                                                  color: membercolor[0]
                                                      ["color"],
                                                  width: 4),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: Get.height * 0.005,
                                                ),
                                                SvgPicture.asset(
                                                    membercolor[0]["image"]),
                                                Container(
                                                  height: 25,
                                                  width: double.infinity,
                                                  color: membercolor[0]
                                                      ["color"],
                                                  child: Center(
                                                    child: Text(
                                                      getallmembercontroller
                                                          .memberlist[index]
                                                          .firstname
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (_) => Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  backgroundColor: Colors.white,
                                                  insetPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: SizedBox(
                                                    height: Get.height * 0.24,
                                                    width: Get.width * 0.8,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const SizedBox(
                                                            height: 10),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child:
                                                                  const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            12,
                                                                        top: 1),
                                                                child: Icon(
                                                                  Icons
                                                                      .cancel_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 28,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          "Confirmation",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20),
                                                          child: Text(
                                                            "Are you sure want to delete user?",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          var id = getallmembercontroller
                                                                              .memberlist[index]
                                                                              .id;
                                                                          if (getallmembercontroller.memberlist.length ==
                                                                              1) {
                                                                            removelogin();
                                                                            removeuserid();
                                                                            removeusernumber();
                                                                            Get.off(OtpScreen());
                                                                          }
                                                                          getallmembercontroller
                                                                              .memberlist
                                                                              .removeAt(index);
                                                                          deleteUser(
                                                                              id);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              Get.height * 0.06,
                                                                          width:
                                                                              Get.width * 0.4,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(bottomLeft: Radius.circular(20)),
                                                                            color:
                                                                                Color(0xff008ABD),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Yes",
                                                                              style: GoogleFonts.poppins(
                                                                                textStyle: TextStyle(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontSize: 16,
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              Get.height * 0.06,
                                                                          width:
                                                                              Get.width * 0.4,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(bottomRight: Radius.circular(20)),
                                                                            color:
                                                                                Color(0xffF95050),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Cancel",
                                                                              style: GoogleFonts.poppins(
                                                                                textStyle: TextStyle(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontSize: 16,
                                                                                  color: Colors.white,
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
                                            child: const Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                    Icon(Icons.cancel_rounded),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  if (getallmembercontroller
                                          .memberlist.length <=
                                      4) {
                                    return InkWell(
                                      onTap: () async {
                                        usernumber = await getusernumber();
                                        Get.to(RegistrationScreen(
                                          mobileNumber: usernumber,
                                        ));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                            Icons.add_circle_rounded,
                                            color: Colors.grey,
                                            size: 100,
                                          ),
                                          Text(
                                            "ADD MEMBER",
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {}
                                  return SizedBox();
                                }
                              },
                            ),
                          ],
                        )
                      : const Center(
                          child: Text("No Member Found!"),
                        );
                }),
                // SvgPicture.asset("assets/add_member.svg",color: kPrimarycolor,),
              ],
            )),
      ),
      bottomNavigationBar: Container(
        child: Image.asset(
          "assets/add_member.png",
        ),
      ),
    );
  }
}
