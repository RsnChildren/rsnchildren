
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rsnn/constant/SizeConfig.dart';

class FromError extends StatelessWidget {
  final List<String?> errors;
  FromError({Key? key, required this.errors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => from1ErrorText(error:errors[index]!)),
    );
  }
  Row from1ErrorText({required String error}){
    return Row(
      children: [
        SizedBox(
        width: getHeighScreen(14),
        ),
SvgPicture.asset("assets/svg/error.svg",
  height: getHeighScreen(14),
  width: getWidthScreen(14),
 ),
        SizedBox(
          width: getHeighScreen(14),
        ),
        Text(error,style:TextStyle(
          color:Colors.redAccent,
          fontSize: 12,
        ),)

      ],

    );
  }
}
