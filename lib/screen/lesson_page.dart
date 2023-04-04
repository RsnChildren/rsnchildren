import 'package:flutter/material.dart';
import 'package:rsnn/constant/SizeConfig.dart';
import 'package:rsnn/screen/home.dart';
import 'package:rsnn/screen/my.dart';
import 'package:rsnn/screen/subject.dart';
import '../constant/DefulltButton.dart';
import '../constant/exit.dart';
import '../constant/sectionCard.dart';
import 'package:rsnn/constant/DefulltButton.dart';


class Lesson_Page extends StatefulWidget {
  const Lesson_Page({Key? key}) : super(key: key);

  @override
  State<Lesson_Page> createState() => _Lesson_Page();
}

class _Lesson_Page extends State<Lesson_Page> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Scaffold(
        backgroundColor:Color(0xFFFFFFFF),
        body: SafeArea(
          child:Stack(
            children: [
              Padding(padding: const EdgeInsets.only(left: 16,right:16,bottom: 60),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Exit("خروج ", ()async{
                            // if(_formKey.currentState!.validate()){
                            //     _formKey.currentState!.save();
                            setState((){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context){
                                    return My();
                                  })

                              );
                            });
                            // }
                          }),

                          Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: Container(
                              width: SizeConfig.widthScreen*0.4,
                              height: SizeConfig.heighScreen*0.1,

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/png/rsn.png"
                                  ),
                                ),
                              ),
                            ),),],),
                      SizedBox(height: 40,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            sectionCard("ولي الامر",'assets/png/parent.png',(){
                              setState((){});

                            },context),
                            sectionCard("المواد الدراسية",'assets/png/book.png',(){
                              setState((){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context){
                                      return Subject();
                                    })

                                );
                              });

                            },context),

                            sectionCard("الصفحة الرئيسيه",'assets/png/house.png',(){
                              setState((){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context){
                                      return Home();
                                    })

                                );
                              });

                            },context),
                            sectionCard("الملف الشخصي",'assets/png/boy.png',(){
                              setState((){
                              });
                            },context),

                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                     Text('الدرس الاول',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.brown),),
                      SizedBox(height: 20,),
                      Image.asset('assets/png/vido.png'),
                      SizedBox(height: 20,),
                      DefulltButton("فيديو تعليمي ", ()async{

                        setState((){});

                      }),
                      SizedBox(height: 40,),
                      Image.asset('assets/png/book2.png'),
                      SizedBox(height: 20,),
                      DefulltButton("شرح مدرسي", ()async{

                        setState((){});

                      }),

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
