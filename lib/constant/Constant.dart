import 'package:flutter/material.dart';
const TextStyle head1=TextStyle(
  fontSize: 35,
  color: Color(0x99063373),
  fontWeight: FontWeight.bold,
);
const TextStyle priText=TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(
    0xff1c2259));
const TextStyle CatText=TextStyle(color: Color(0xff0f196c),fontSize: 18,fontWeight: FontWeight.w600);

final RegExp emailValidetorRegExp= RegExp(r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]");
const String kEmailNullError="Please Enter your Email";
const String kInvalidEmailError="Please Enter Valid Email";
const String kPassNullError="Please Enter your Password";
const String kShortPassError="Password is too short";
const String kMatchPassError="Password don't match";
const String kNameNullError="Please Enter your Name";
const String kPhoneNumberNullError="Please Enter your Phone Number";
const String kAddressNullError="Please Enter your Address";