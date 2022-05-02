import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:temple/constant/snack_bar.dart';
import 'package:temple/services/api/update_dailytask.dart';
import 'package:temple/views/mala_screen/mala_controller.dart';

class MalaScreen extends StatefulWidget {
  final Map data;
  MalaScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<MalaScreen> createState() => _MalaScreenState();
}

class _MalaScreenState extends State<MalaScreen> {
  var todaymala = 0;
  var todaymala1 = 0;
  MalaController malacontroller = Get.put(MalaController());

  @override 
  void initState() {
    super.initState();
    findByTaskId(widget.data["taskid"]).then((value) {
      malacontroller.completetask.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController malaController = TextEditingController();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF1FDFF),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      widget.data["title"],
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
                                    textStyle: TextStyle(
                                        fontSize: 13, color: Colors.black),
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
                Center(
                  child: Container(
                    width: Get.width * 0.90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: Get.height * 0.14,
                          width: Get.width * 0.43,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffFFCCAF).withOpacity(0.6),
                                offset: const Offset(3, 7),
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xfff68b5c),
                                  Color(0xffffccaf),
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Overall Target",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "120000",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.white,
                                indent: 30,
                                endIndent: 30,
                              ),
                              Text(
                                "2500000",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height * 0.14,
                          width: Get.width * 0.43,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffFFCCAF).withOpacity(0.6),
                                offset: const Offset(3, 7),
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xff7D88E7),
                                  Color(0xff7D99E7),
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Annual Target",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "0",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.white,
                                indent: 30,
                                endIndent: 30,
                              ),
                              Text(
                                widget.data['toaltask'],
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Center(
                  child: Container(
                    height: Get.height * 0.13,
                    width: Get.width * 0.90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff008ABD).withOpacity(0.5),
                          offset: const Offset(3, 6),
                          blurRadius: 15,
                        ),
                      ],
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xff008ABD),
                            Color(0xff7dc8e7),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Obx(() => Text(
                            "Daily Target : ${malacontroller.completetask.value} / ${widget.data["todaytask"]}",
                            // "Daily Target : ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          )),
                    ),
                  ),
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
                              Border.all(color: Color(0xff008ABD), width: 2.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Card(
                            elevation: 1,
                            color: const Color(0xff008ABD),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: CircleAvatar(
                                radius: 23,
                                backgroundColor: const Color(0xff008ABD),
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
                              Border.all(color: Color(0xff008ABD), width: 2.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Card(
                            elevation: 1,
                            color: const Color(0xff008ABD),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: CircleAvatar(
                                radius: 23,
                                backgroundColor: const Color(0xff008ABD),
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
                      "Today’s Mala :",
                      style: GoogleFonts.hindSiliguri(
                        textStyle: TextStyle(
                            color: Color(0xff008ABD),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: Get.width * 0.7,
                      child: TextFormField(
                        controller: malaController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color(0xff008ABD),
                              fontSize: 25),
                        ),
                        // controller: target,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xff008ABD),
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color(0xff008ABD),
                              )),
                          suffixIcon: const Icon(Icons.create_sharp,
                              color: Color(0xff008ABD), size: 25),
                          // filled: true,

                          // fillColor: const Color(0xffE0F7FF),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {}
                        },
                      ),
                    ),
                    SizedBox(height: Get.height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // int.parse(malacontroller.completetask.value);
                            // int dailytask = int.parse(widget.data["todaytask"]);
                            // todaymala1 += int.parse(malaController.text);
                            // int remaning = dailytask - todaymala1;

                            // if (remaning >= 0) {
                            //   todaymala = todaymala1;
                            //   setState(() {});
                            //   addUserDailytask(
                            //       widget.data, todaymala, remaning);
                            // } else {
                            //   todaymala1 = todaymala;
                            //   todaymala = dailytask;
                            //   setState(() {});
                            //   Fluttertoast.showToast(
                            //       msg: "Your task is completed",
                            //       backgroundColor: Colors.green,
                            //       gravity: ToastGravity.BOTTOM);
                            // }

                            int donetask =
                                int.parse(malacontroller.completetask.value);
                            int dailytask = int.parse(widget.data["todaytask"]);

                            todaymala = donetask;
                            todaymala += int.parse(malaController.text);
                            int remaning = dailytask - todaymala;

                            if (remaning >= 0) {
                              malacontroller.completetask.value == "0"
                                  ? addUserDailytask(
                                      widget.data, todaymala, remaning)
                                  : updateUserDailytask(
                                      widget.data, todaymala, remaning);
                              malacontroller.completetask.value =
                                  todaymala.toString();
                              malaController.text = "";
                              // setState(() {});
                            } else {
                              malaController.text = "";
                              Fluttertoast.showToast(
                                  msg: "Your task is completed",
                                  backgroundColor: Colors.green,
                                  gravity: ToastGravity.BOTTOM);
                            }
                          },
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
          )),
    );
  }
}
