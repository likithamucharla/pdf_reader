import 'package:flutter/material.dart';

const bgColor = Color(0xffD1EEF6);
const btnColor = Color(0xffFA7267);
const bgdark = Color(0xffE8F93);
const purpleColor = Color(0xff9D84FF);
const blueColor = Color(0xff5B97F2);

const poppins = "poppins";
const poppinbold = "poppins_bold";

TextStyle textStyle({Color = Colors.black87, double? size = 16, font = poppinbold}){
  return TextStyle(
    fontFamily: font,
    color: Color,
    fontSize: size,
  );
}