import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String ?labelText;
  final TextInputType ?mykey;
  late final bool obscureText;
  //final IconData ?icon;
  final TextEditingController ?controller;
  final Function ?validation;
  final Function ?press;
  final String ?hint;
  TextForm({Key? key, this.labelText, this.mykey, required this.obscureText,
   // this.icon,
    this.controller, this.validation, this.press, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: validation as String ?Function(String?),
      onChanged: press as void Function(String?),
      keyboardType: mykey,
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 20,
        color: Color(0x99021734),
      ),
      decoration: InputDecoration(
        hintText: hint,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 18,
          color: Color(0x99021734),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 3,
            color: Color(0xC5000000),
          ),
        ),
        enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
    width: 2,
    color: Color(0xC5000000),
    ),
        ),
       // suffixIcon: Icon(icon,color: Color(0x99012544),)
      ),
    );
  }
}
