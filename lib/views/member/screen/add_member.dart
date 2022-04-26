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
import 'package:temple/views/registration/registration_screen.dart';
import 'package:temple/widget/app_drawer.dart';

class SelectMember extends StatefulWidget {
  final   memberlist;
  const SelectMember({Key? key, this.memberlist}) : super(key: key);

  @override
  State<SelectMember> createState() => _SelectMemberState();
}

Getallmembercontroller getallmembercontroller =
    Get.put(Getallmembercontroller());
Usertaskcontroller usertaskcontroller = Get.find();

bool status = false;

class _SelectMemberState extends State<SelectMember> {
  void getallmember() async {
    // await getCategory();
  }

  @override
  void initState() {
    super.initState();
    getallmember();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "SELECT MEMBER",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: kPrimarycolor, fontWeight: FontWeight.w700),
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
                                              color: Color(0xffFFF7DE),
                                              border: Border.all(
                                                  color: Color(0xffD6B960),
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
                                                    "assets/member3.svg"),
                                                Container(
                                                  height: 25,
                                                  width: double.infinity,
                                                  color: Color(0xffD6B960),
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
                                          const Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.cancel_rounded),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  if (getallmembercontroller
                                          .memberlist.length <=
                                      5) {
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
