
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rsnn/constant/SizeConfig.dart';

Widget buttonItem(String imagePath,String buttonName,double size,Function() onTap,BuildContext context){
  SizeConfig().init(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      width: SizeConfig.widthScreen-150,
      height: 60,
      child: Card(

        color: Colors.white,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: size,
              width: size,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              buttonName,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    ),

  );
}