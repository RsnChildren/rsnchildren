import 'package:flutter/material.dart';
import 'SizeConfig.dart';

class BottomBar extends StatelessWidget {
  final int ?BottomNu;
  final Function ?callBack;
  const BottomBar({Key? key, this.BottomNu, this.callBack , }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bottoms=[
      Icons.home_filled,
      Icons.search,
      Icons.shopping_bag_outlined,
      Icons.person,
    ];
    return SizedBox(
      width: SizeConfig.widthScreen,
      height: getHeighScreen(80),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
        itemBuilder:(_,index)=>GestureDetector(
        child: Container(
          width: (SizeConfig.widthScreen-40)/4,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration:BottomNu==index?const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3,
                color: Color(0x9982A4D5),
              )
            )
          ):null,
          child: Icon(
            bottoms[index],
            size: 30,
              color:BottomNu==index?Color(0x9982A4D5):Color(0xC5B1C9FF),
          ),
        ),
      onTap: ()=>callBack!(index),
      ),
    separatorBuilder: (_,index)=>const SizedBox(width: 10,),
    itemCount: bottoms.length,
      ),

    );
  }
}
