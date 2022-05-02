import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/snack_bar.dart';

class SelectionScreen extends StatefulWidget {
  // final Map data;
  SelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  void initState() {
    super.initState();
    // findByTaskId(widget.data["taskid"]).then((value) {
    //   malacontroller.completetask.value = value;
    // });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController malaController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff008ABD),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                // widget.data["title"],
                "સદગ્રંથ વાંચન",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage("assets/coin.png"),
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "60",
                            style: GoogleFonts.balooBhai(
                              textStyle:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffFFF3F3),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Get.width * 0.05, top: 10),
                child: Text(
                  "Target & Achievement",
                  style: GoogleFonts.hindSiliguri(
                    textStyle: TextStyle(
                        color: Color(0xff12175E),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Center(
              //   child: Container(
              //     width: Get.width * 0.90,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           height: Get.height * 0.14,
              //           width: Get.width * 0.43,
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                 color: const Color(0xff7D1935).withOpacity(0.3),
              //                 offset: const Offset(3, 7),
              //                 blurRadius: 10,
              //               ),
              //             ],
              //             borderRadius: BorderRadius.circular(20),
              //             gradient: const LinearGradient(
              //                 colors: [
              //                   Color(0xff7D1935),
              //                   Color(0xffB42B51),
              //                 ],
              //                 begin: FractionalOffset(0.0, 0.0),
              //                 end: FractionalOffset(1.0, 0.0),
              //                 stops: [0.0, 1.0],
              //                 tileMode: TileMode.clamp),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               Text(
              //                 "Overall Target",
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(
              //                       color: Colors.white, fontSize: 14),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               Text(
              //                 "120000",
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 15),
              //                 ),
              //               ),
              //               Divider(
              //                 height: 1,
              //                 color: Colors.white,
              //                 indent: 30,
              //                 endIndent: 30,
              //               ),
              //               Text(
              //                 "2500000",
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 15),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           height: Get.height * 0.14,
              //           width: Get.width * 0.43,
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                 color: const Color(0xff001D3D).withOpacity(0.3),
              //                 offset: const Offset(3, 7),
              //                 blurRadius: 10,
              //               ),
              //             ],
              //             borderRadius: BorderRadius.circular(20),
              //             gradient: const LinearGradient(
              //                 colors: [
              //                   Color(0xff001D3D),
              //                   Color(0xff003566),
              //                 ],
              //                 begin: FractionalOffset(0.0, 0.0),
              //                 end: FractionalOffset(1.0, 0.0),
              //                 stops: [0.0, 2.0],
              //                 tileMode: TileMode.clamp),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               SizedBox(
              //                 height: 5,
              //               ),
              //               Text(
              //                 "Annual Target",
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(
              //                       color: Colors.white, fontSize: 14),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               Text(
              //                 "120",
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 15),
              //                 ),
              //               ),
              //               Divider(
              //                 height: 1,
              //                 color: Colors.white,
              //                 indent: 30,
              //                 endIndent: 30,
              //               ),
              //               Text(
              //                 "altask",
              //                 // widget.data['toaltask'],
              //                 style: GoogleFonts.poppins(
              //                   textStyle: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 15),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            
              SizedBox(
                height: Get.height * 0.03,
              ),
              Center(
                child: Container(
                  height: Get.height * 0.09,
                  width: Get.width * 0.90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff183A5D).withOpacity(0.5),
                        offset: const Offset(3, 6),
                        blurRadius: 15,
                      ),
                    ],
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xff062C30),
                          Color(0xff05595B),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      // "Daily Target : $today / ${widget.data['todaytask']}",
                      "સત્સંગી જીવન :",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
             
              SizedBox(
                height: Get.height * 0.02,
              ),
              
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 40,
                endIndent: 40,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: Get.height * 0.13,
                    width: Get.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Color(0xff183A5D), width: 2.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Card(
                          elevation: 1,
                          color: const Color(0xff183A5D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: CircleAvatar(
                              radius: 23,
                              backgroundColor: const Color(0xff183A5D),
                              child: SvgPicture.asset(
                                "assets/report.svg",
                                height: 28,
                                width: 28,
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                        Text(
                          "Report",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.13,
                    width: Get.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Color(0xff183A5D), width: 2.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Card(
                          elevation: 1,
                          color: const Color(0xff183A5D),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: CircleAvatar(
                              radius: 23,
                              backgroundColor: const Color(0xff183A5D),
                              child: SvgPicture.asset(
                                "assets/motimala.svg",
                                height: 28,
                                width: 28,
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                        Text(
                          "Mala",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 40,
                endIndent: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Today’s niyam completed ?",
                    style: GoogleFonts.hindSiliguri(
                      textStyle: TextStyle(
                          color: Color(0xff183A5D),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                            color: Color(0xff73C04F),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 5),
                            child: Text(
                              "YES",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(color: Color(0xffED583B)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 5),
                            child: Text(
                              "NO",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                size: 26,
              ),
              const Text(
                " દંડવત",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: Get.width * 0.40,
              ),
              const Text(
                "પ્રદક્ષિણા ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 26,
              ),
            ],
          ),
        ));
  }
}
