
import 'package:flutter/material.dart';

Widget sectionCard(String title,String imagePath,Function() callBack,BuildContext context){
  return TextButton(
    onPressed: callBack,
    style: TextButton.styleFrom(   primary:  Color(0xFFFAADAD)),
    child: Column(

      children: [


        Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(60)

          ),
          child: Card(
              elevation:20,
              color: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(10
              ) ,
                side: const BorderSide(
                  width: 2,
                  color: Color(0xFFF8E0E0),
                ),
              ),
              child: Image.asset( imagePath,)),

        ),
        SizedBox(height: 10,),
        Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 12),)
      ],
    ),
  );
}
