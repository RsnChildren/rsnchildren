import 'package:flutter/material.dart';
import 'package:rsnn/constant/SizeConfig.dart';

Widget box_my(String imagePath,String buttonName,TextStyle style,Function() onTap,BuildContext context){
  SizeConfig().init(context);
  return TextButton(

    onPressed: onTap,
      style: TextButton.styleFrom(   primary:  Color(0xFFFFDD90)),
    child: Container(
      width: SizeConfig.widthScreen-0,
      height: 120,
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(

          side: const BorderSide(
            width: 1,

            color: Color(0xFFFFDD90),
          ),
        ),

       child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [


            Text(
              buttonName,
              style: style,
            ),
            const SizedBox(width: 40,),
             Image.asset( imagePath,),


          ],
        ), ),
      ),
    ),

  );
}