import 'package:flutter/material.dart';
import 'Constant.dart';

Widget TitleApp(String title,BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 20,),
      GestureDetector(
        onTap: (){

        },
        child: Icon(
          Icons.arrow_back_rounded,
        ),
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          Text(title,style: priText,),
          SizedBox(width: 180 ,),

        ],
      ),

      SizedBox(height: 20,),
    ],
  );
}