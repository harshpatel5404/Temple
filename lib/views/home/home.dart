import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/color.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/api/update_dailytask.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/achievement/achievement.dart';
import 'package:temple/views/home/controller.dart/Home_controller.dart';
import 'package:temple/views/mala_screen/mala_screen.dart';
import 'package:temple/views/mala_screen/yes_no.dart';
import 'package:temple/views/member/controller/get_member_controller.dart';

import 'controller.dart/Home_controller.dart';

class HomePage extends StatefulWidget {
  final zoomDrawerController;

  HomePage({Key? key, this.zoomDrawerController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Usertaskcontroller usertaskcontroller = Get.put(Usertaskcontroller());
Getallmembercontroller getallmembercontroller = Get.find();

class _HomePageState extends State<HomePage> {
  fromHex(String hexColor) {
    String colorNew = '0xff' + hexColor;
    colorNew = colorNew.replaceAll('#', '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }

  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimarycolor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              ZoomDrawer.of(context)!.toggle();
            },
            child: SvgPicture.asset(
              "assets/menu.svg",
              height: 5,
              width: 5,
            ),
          ),
        ),
        title: Text("હોમ",
            style: GoogleFonts.balooBhai(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage("assets/coin.png"),
                    height: 12,
                    width: 12,
                  ),
                  SizedBox(width: 10),
                  Text("60",
                      style: GoogleFonts.balooBhai(
                        textStyle: TextStyle(fontSize: 14, color: Colors.black),
                      )),
                ],
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/homepage2.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: _size.height * 0.01),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: _size.height * 0.20,
                width: _size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "SLIDER",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xffEDEDED),
                          fontSize: 54,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Updates",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    "1/3",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 15, right: 25),
              child: Container(
                height: _size.height * 0.085,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Container(
                      height: _size.height * 0.085,
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F4FD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: _size.height * 0.085,
                            width: _size.width * 0.25,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/update.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: _size.width * 0.02),
                          Expanded(
                            child: Text(
                              "આ મંગળવારે બધા હરિભક્તો મહારાજને રસ પુરી ધરાવશો.",
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  // fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: _size.height * 0.025,
                        width: _size.width * 0.14,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/homepage2.png")),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Text(
                            "રેસિપી",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your selected niyams",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Bounce(
                    duration: const Duration(milliseconds: 110),
                    onPressed: () {},
                    child: Container(
                      height: _size.height * 0.02,
                      width: _size.width * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xffE2E2E2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage("assets/writing.png"),
                              height: 12,
                              width: 12,
                            ),
                            SizedBox(width: _size.width * 0.012),
                            InkWell(
                              onTap: () {
                                Get.to(AchievementPage());
                              },
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () {
                return usertaskcontroller.usertasklist.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: usertaskcontroller.usertasklist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, bottom: 5, left: 8, right: 26),
                              child: Stack(
                                children: [
                                  Slidable(
                                    endActionPane: ActionPane(
                                      extentRatio: 0.3,
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            if (usertaskcontroller
                                                    .usertasklist.length !=
                                                1) {
                                              // print(usertaskcontroller
                                              //     .usertasklist[index].id);
                                              deletetask(usertaskcontroller
                                                  .usertasklist[index].id);
                                              usertaskcontroller.usertasklist
                                                  .removeAt(index);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Keep atleast 1 task",
                                                  gravity: ToastGravity.BOTTOM,
                                                  backgroundColor: Colors.red);
                                            }
                                          },
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          icon: Icons.cancel_outlined,
                                          label: 'Remove',
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        var taskid = usertaskcontroller
                                            .usertasklist[index].id;
                                        var toaltask = usertaskcontroller
                                            .usertasklist[index].total;
                                        var todaytask = usertaskcontroller
                                            .usertasklist[index].daily;
                                        // print(id);
                                        Map data = {
                                          "taskid": taskid,
                                          "toaltask": toaltask,
                                          "todaytask": todaytask
                                        };
                                        // usertaskcontroller
                                        //         .usertasklist[index].maincategory == "niyam" ?
                                        //         Get.to(MalaScreen(
                                        //       data: data,
                                        //     )) : Get.to(YesNoScreen(
                                        //       data: data,
                                        //     ));
                                       


                                        index == 1
                                            ? Get.to(MalaScreen(
                                                data: data,
                                              ))
                                            : Get.to(YesNoScreen(
                                                data: data,
                                              ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xffFAE5E1)
                                            //  Color(
                                            //   fromHex(niyamController
                                            //     .niyamList[index]["color"])
                                            //     ),
                                            ),
                                        height: Get.height * 0.12,
                                        width: Get.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const SizedBox(
                                                  height: 1,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25.0),
                                                  child: Text(
                                                    "${usertaskcontroller.usertasklist[index].title}",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 21)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 25.0),
                                                  child: Text(
                                                      "${usertaskcontroller.usertasklist[index].subtitle}"),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: Get.height * 0.09, left: 35),
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.white,
                                          child: Image.asset(
                                            "assets/note.png",
                                            color: Colors.red,
                                            height: 22,
                                            width: 22,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(YesNoScreen());
        },
        child: Image.asset("assets/note.png"),
      ),
    );
  }
}
