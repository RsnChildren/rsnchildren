import 'package:flutter/material.dart';


class AllTitles extends StatelessWidget {
  const AllTitles({
    Key? key,
    required this.title,

  }) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(

        children: [
          SizedBox(width: 20,),
          Titles(text: title,),
          Spacer(),


        ],
      ),
    );
  }
}

class Titles extends StatelessWidget {
  const Titles({
    Key? key,
    required this.text,

  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:38,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Text(text,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.green )
            ),
          ),
          Positioned(
            bottom: 0,
            left: 100,
            right: 0,
            child: Container(

               height: 7,
              color: Colors.green.withOpacity(0.2),

            ),
          ),
        ],
      ),
    );
  }
}