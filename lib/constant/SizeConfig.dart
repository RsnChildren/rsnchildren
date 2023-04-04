import 'package:flutter/material.dart';


class SizeConfig{
  static late MediaQueryData _mediaQueryData;

  static late double widthScreen;
  static late double heighScreen;
  static double?defultSize;
  static Orientation? _orientation;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    widthScreen = _mediaQueryData.size.width;
    heighScreen = _mediaQueryData.size.height;
    _orientation = _mediaQueryData.orientation;
  }
}

double getWidthScreen(double inputwidth){
  double widthScreen = SizeConfig.widthScreen;
  return(inputwidth/315.0)*widthScreen;
}
double getHeighScreen(double inpuheigh){

  return(inpuheigh/815.0)*SizeConfig.heighScreen;
}

