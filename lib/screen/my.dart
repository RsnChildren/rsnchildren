import 'package:flutter/material.dart';
import 'package:rsnn/constant/SizeConfig.dart';
import 'package:rsnn/screen/SignIn_Page.dart';
import '../constant/box_my.dart';



class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _My();
}

class _My extends State<My> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Scaffold(
        backgroundColor:Color(0xFFFFFFFF),
        body: SafeArea(
          child:Stack(
            children: [
              Padding(padding: const EdgeInsets.only(left: 16,right: 16,bottom: 60),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: 10,),
                      Container(
                          width: SizeConfig.widthScreen,
                          height: SizeConfig.heighScreen*0.1,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/png/img.png"
                              ),
                            ),
                          ),
                        ),

                      Padding(padding: EdgeInsets.only(left: 10),
                        child:  Container(
                          width: SizeConfig.widthScreen,
                          height: SizeConfig.heighScreen*0.20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/png/my.png"
                              ),
                            ),
                          ),
                        ),),


                      box_my('assets/png/student.png','الطالب',TextStyle( color: Colors.pink,
                          fontSize: 25,fontWeight: FontWeight.bold, ), (){
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return SignIn_Page();
                              })

                          );
                        });
                      }, context),

                      SizedBox(height: 10,),

                      box_my('assets/png/teacher.png','مدرس خصوصي',TextStyle( color: Colors.green,
                        fontSize: 25,fontWeight: FontWeight.bold, ),  (){
                        setState(() {
                        });
                      }, context),

                      SizedBox(height: 10,),

                      box_my('assets/png/user.png','مستخدم عادي',TextStyle( color: Colors.blue,
                        fontSize: 25,fontWeight: FontWeight.bold, ), (){setState(() {});}, context),
                    ],

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
