import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/color.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/member/controller/get_member_controller.dart';
import 'package:temple/views/member/screen/add_member.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  Getallmembercontroller getallmembercontroller =
      Get.put(Getallmembercontroller());
  // bool isSelected = false;
  var onTapIndex = 0;
  List menuTitle = [
    "Home",
    "Daily Darshan",
    "Mantralekhan",
    "Mantrajap",
    "Books",
    "Live Katha ( Youtube )",
    "Gharsabha",
    "",
    "Report",
    "Downloads",
    "",
    "About App",
    "About Us",
    "Other Apps",
    "Share Apps"
  ];
  List icons = [
    "list1",
    "list2",
    "list3",
    "list4",
    "list5",
    "list6",
    "list7",
    "",
    "list9",
    "list10",
    "",
    "list12",
    "list13",
    "list14",
    "list15",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff008ABD),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.08,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    usernumber = await getusernumber();
                    getallmembercontroller.getmemberdata();
                    Get.to(SelectMember());
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    child: Image.asset(
                      "assets/man1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ghanshyam",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("User1",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Stack(
                          children: [
                            SvgPicture.asset("assets/user2.svg"),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0, top: 2),
                              child: SvgPicture.asset("assets/men2.svg"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              indent: 20,
              endIndent: Get.width * 0.45,
              thickness: 1.5,
              color: Colors.white60,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == onTapIndex) {
                  ZoomDrawer.of(context)!.close();
                  return Container(
                    height: Get.height * 0.065,
                    width: Get.width * 0.48,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/list/${icons[index]}.svg",
                          color: kPrimarycolor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${menuTitle[index]}",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: kPrimarycolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (index == 7 || index == 10) {
                  return Divider(
                    indent: 20,
                    endIndent: Get.width * 0.45,
                    height: 40,
                    thickness: 1.5,
                    color: Colors.white60,
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        onTapIndex = index;
                      });
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/list/${icons[index]}.svg",
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${menuTitle[index]}",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/facebook.svg",
                    height: 40,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  SvgPicture.asset(
                    "assets/Instagram.svg",
                    height: 40,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  SvgPicture.asset(
                    "assets/youtube.svg",
                    height: 40,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  SvgPicture.asset(
                    "assets/whatsApp.svg",
                    height: 40,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Copyright @ 2022 KalakunjMandir.com",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    )),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Privacy Policy | Terms and conditions 1.0",
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0xffBCEDFF), fontSize: 9)))

                  // style: TextStyle(color: Color(0xffBCEDFF), fontSize: 9)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
