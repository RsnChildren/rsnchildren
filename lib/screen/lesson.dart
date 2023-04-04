import 'package:flutter/material.dart';
import 'package:rsnn/constant/SizeConfig.dart';
import 'package:rsnn/screen/home.dart';
import 'package:rsnn/screen/lesson_page.dart';
import 'package:rsnn/screen/my.dart';
import 'package:rsnn/screen/subject.dart';
import '../constant/AllTitels.dart';
import '../constant/DefulltButton.dart';
import '../constant/box.dart';
import '../constant/box_my.dart';
import '../constant/exit.dart';
import '../constant/sectionCard.dart';
import 'SignIn_Page.dart';


class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  State<Lesson> createState() => _Lesson();
}

class _Lesson extends State<Lesson> {

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
                      AllTitles(title: "دروس الرياضيات",),
                      SizedBox(height: 20,),
                      Text('الوحدة الأولى',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 25,)),
                      SizedBox(height: 20,),
                      Box('الدرس الاول',TextStyle( color: Colors.pink,
                        fontSize: 25,fontWeight: FontWeight.bold, ), (){
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return Lesson_Page();
                              })

                          );
                        });
                      }, context),

                      SizedBox(height: 10,),

                      Box('الدرس الثاني',TextStyle( color: Colors.green,
                        fontSize: 25,fontWeight: FontWeight.bold, ),  (){
                        setState(() {
                        });
                      }, context),

                      SizedBox(height: 10,),

                      Box('الدرس الثالث',TextStyle( color: Colors.blue,
                        fontSize: 25,fontWeight: FontWeight.bold, ), (){setState(() {});}, context),

                      SizedBox(height: 50,),
                      DefulltButton("إختبار الوحدة ", ()async{
                        // if(_formKey.currentState!.validate()){
                        //     _formKey.currentState!.save();
                        setState((){
                        });
                        // }
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
