import 'package:flutter/material.dart';
import 'SizeConfig.dart';

Widget Exit(String text ,Function() press){

  return SizedBox(
    width: SizeConfig.widthScreen*0.28,
    height: SizeConfig.heighScreen*0.06 ,

    child:TextButton(
      style: TextButton.styleFrom(

        side: BorderSide(
          width: 2,
          color: Colors.red,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        primary: Colors.red,
        backgroundColor:Colors.white,
      ),
      onPressed: press as void Function(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    ),
  );
}