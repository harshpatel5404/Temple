import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelScreen extends StatefulWidget {
  LevelScreen({Key? key}) : super(key: key);

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

RxInt currentindex = 11.obs;

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                "title",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      child: Icon(Icons.info),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.04),
                child: Center(
                  child: Container(
                    height: Get.height * 0.85,
                    width: Get.width * 0.9,
                    decoration: const BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage("assets/level/Levelbackground.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Stack(children: [
                  Container(
                    height: Get.height * 0.1,
                    decoration: const BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage("assets/level/Levelgreen.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    // child: Text("ગઢડા પ્રથમ પ્રકરણ"),
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.015),
                    child: Text(
                      "ગઢડા પ્રથમ પ્રકરણ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ))
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.width * 0.25),
                child: Center(
                  child: Container(
                    height: Get.height * 0.75,
                    width: Get.width * 0.76,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        if (index + 1 == currentindex.value) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                child: Center(
                                  child: Text("${index + 1}",
                                      style: GoogleFonts.karla(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 33),
                                      )),
                                ),
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    // color: Color(0xffE6C490),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff7F0000),
                                        Color(0xffFB6A6B)
                                      ],
                                    ),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          );
                        } else if (index + 1 < currentindex.value) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                child: Center(
                                  child: Text("${index + 1}",
                                      style: GoogleFonts.karla(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 33),
                                      )),
                                ),
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    // color: Color(0xffE6C490),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffE3AC69),
                                        Color(0xffE6C490),
                                      ],
                                    ),
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.loose,
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text("${index + 1}",
                                          style: GoogleFonts.karla(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 33),
                                          )),
                                    ),
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Color(0xffC7C7C7),
                                        border: Border.all(
                                            color: Colors.white, width: 3),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Image.asset(
                                          "assets/level/Levellock.png"))

                                  // Padding(
                                  //   padding: const EdgeInsets.all(2),
                                  //   child: Container(
                                  //     color: Colors.black,
                                  //     height: 10,
                                  //       width: 40,
                                  //     child: SvgPicture.asset(
                                  //       "assets/evel/1.svg",
                                  //       color: Colors.black,
                                  //       fit: BoxFit.contain,

                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Container(
                                  //     // height: 40,
                                  //     // width: 40,
                                  //     decoration: const BoxDecoration(
                                  //       // color: Colors.green,
                                  //       image: DecorationImage(
                                  //         image: AssetImage(
                                  //             "assets/evel/Levellock.png"),

                                  //         fit: BoxFit.contain,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
               Positioned(
                  right: 0,
                  top: Get.height * 0.45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                     
                      child: Image.asset("assets/level/arrow2.png",),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffE98D12),
                              Color(0xffFBC33A),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffE98D12),
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          )),
                    ),
                  )),
          
              Positioned(
                  left: 0,
                  top: Get.height * 0.45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      child: Image.asset("assets/level/arrow.png"),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffE98D12),
                              Color(0xffFBC33A),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffE98D12),
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          )),
                    ),
                  ))
            ],
          )
        ],
      ),
      floatingActionButton: Container(
        height: Get.height * 0.07,
        width: Get.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff6BA925),
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xff6BA925),
          onPressed: () async {},
          label: Text("SAVE",
              style: GoogleFonts.balooBhai(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
