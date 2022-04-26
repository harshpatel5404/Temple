import 'package:flutter/material.dart';
import 'package:temple/constant/color.dart';

void scaffoldMessage(context, text) {
  var snackbar = SnackBar(
    content: Text(text,style: TextStyle(color: Colors.white),),
    backgroundColor: kPrimarycolor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
