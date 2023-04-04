import 'package:flutter/material.dart';

Widget myInkWell(String title ,Function()press){
  return InkWell(
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF2B7E33),
        fontSize: 20,
      ),
    ),
    onTap: press,
  );
}