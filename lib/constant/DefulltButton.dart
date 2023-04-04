import 'package:flutter/material.dart';
import 'SizeConfig.dart';

Widget DefulltButton(String text ,Function() press){

  return SizedBox(
    width: SizeConfig.widthScreen*0.7,
    height: SizeConfig.heighScreen*0.08,

    child:TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(
          width: 2,
          color: Color(0xFF4D3326),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        primary: Color(0xFF4D3326),
        backgroundColor:Colors.white,
      ),
      onPressed: press as void Function(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
    ),
  );
}