import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:temple/constant/color.dart';
import 'package:temple/constant/snack_bar.dart';
import 'package:temple/services/api/registration_service.dart';
import 'package:temple/services/pref_manager.dart';
import 'package:temple/views/firstpage/card_screen.dart';
import 'package:temple/views/member/controller/get_member_controller.dart';
import 'package:temple/views/member/screen/add_member.dart';

import 'package:temple/widget/app_button.dart';

class RegistrationScreen extends StatefulWidget {
  final mobileNumber;
  const RegistrationScreen({Key? key, this.mobileNumber}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  // var mobileNumber;
  TextEditingController dateinput = TextEditingController();
  TextEditingController surnamecontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController fathernamecontroller = TextEditingController();
  Getallmembercontroller getallmembercontroller =
      Get.put(Getallmembercontroller());
  bool status = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dateinput.text = "";
  }

  bool isMale = true;
  String gender = "male";

  File? _image;
  ImagePicker picker = ImagePicker();

  _imgFromCamera() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(image!.path);
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
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
            "BHAJAN BANK",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: kPrimarycolor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2),
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
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    color: Colors.white,
                    height: Get.height * 0.65,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/temple.png",
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Text(
                        "REGISTRATION",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: kPrimarycolor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  _showPicker(context);
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  child: _image != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.file(_image!,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover),
                                        )
                                      : Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                        "assets/profile.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              width: 100,
                                              height: 100,
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                // widthFactor: 4s,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.black38,
                                                ))
                                          ],
                                        ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z]'))
                                    ],
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Enter Surname';
                                      }
                                    },
                                    controller: surnamecontroller,
                                    decoration: const InputDecoration(
                                      hintText: "Surname",
                                    ),
                                    // textInputAction: TextInputAction.next,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z]'))
                                    ],
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Enter Name';
                                      }
                                    },
                                    controller: namecontroller,
                                    decoration:
                                        const InputDecoration(hintText: "Name"),
                                    // textInputAction: TextInputAction.next,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z]'))
                                    ],
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Enter Father’s name';
                                      }
                                    },
                                    controller: fathernamecontroller,
                                    decoration: const InputDecoration(
                                        hintText: "Father’s name"),
                                    // textInputAction: TextInputAction.next,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: dateinput,
                              decoration: const InputDecoration(
                                  hintText: "Date Of Birth",
                                  icon: Icon(Icons.calendar_today_outlined)),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now());

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  setState(() {
                                    dateinput.text = formattedDate;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isMale
                                      ? Colors.transparent
                                      : Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: isMale
                                    ? const Color(0xff018ABE)
                                    : Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/man.svg",
                                    height: 25,
                                    width: 25,
                                    color: isMale ? Colors.white : Colors.black,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                        color: isMale
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                gender = "male";
                                isMale = true;
                              });
                            },
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            child: Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: !isMale
                                      ? Colors.transparent
                                      : Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: !isMale
                                    ? const Color(0xff018ABE)
                                    : Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/woman.svg",
                                    height: 25,
                                    width: 25,
                                    color:
                                        !isMale ? Colors.white : Colors.black,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                        color: !isMale
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                gender = "female";
                                isMale = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ]),
                  )
                ]),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                AppButton(
                  onPress: () async {
                    if (!_formKey.currentState!.validate()) {
                      scaffoldMessage(context, "Please Fill all data");
                      return;
                    } else {
                      if (dateinput.text.isNotEmpty || _image != null) {
                        Map data = {
                          "number": widget.mobileNumber,
                          "gender": gender,
                          "firstname": namecontroller.text,
                          "lastname": surnamecontroller.text,
                          "middelname": fathernamecontroller.text,
                          "task": "no",
                          "dob": dateinput.text,
                          "image": _image != null ? _image!.path.toString() : ""
                        };
                        int loginresponse = await registerUser(data);
                        if (0 != loginresponse) {
                          await setuserid(loginresponse.toString());
                          await setusernumber(widget.mobileNumber);
                          await setlogin(true);
                          await getallmembercontroller
                              .getmemberdata()
                              .then((value) {
                            print("member list length");
                            print(getallmembercontroller.memberlist.length);
                            if (getallmembercontroller.memberlist.length != 1) {
                              Get.off(SelectMember());
                            } else {
                              Get.off(Card_Screen(userid: userid));
                            }
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Your Member Limit Over!",
                              backgroundColor: Colors.red,
                              gravity: ToastGravity.BOTTOM);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please select the date",
                            backgroundColor: Colors.red,
                            gravity: ToastGravity.BOTTOM);
                      }
                    }
                  },
                  text: "REGISTER",
                )
              ],
            ),
          ),
        ));
  }
}
