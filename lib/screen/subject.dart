import 'package:flutter/material.dart';
import 'package:rsnn/constant/SizeConfig.dart';
import 'package:rsnn/screen/home.dart';
import 'package:rsnn/screen/lesson.dart';
import 'package:rsnn/screen/my.dart';
import '../constant/AllTitels.dart';
import '../constant/box_my.dart';
import '../constant/exit.dart';
import '../constant/sectionCard.dart';
import 'SignIn_Page.dart';


class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  State<Subject> createState() => _Subject();
}

class _Subject extends State<Subject> {


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
                      AllTitles(title: "المواد الدراسية",),
                      SizedBox(height: 40,),
                      box_my('assets/png/quran.png','قران',TextStyle( color: Colors.pink,
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

                      box_my('assets/png/eslam.png','إسلامية',TextStyle( color: Colors.green,
                        fontSize: 25,fontWeight: FontWeight.bold, ),  (){
                        setState(() {
                        });
                      }, context),

                      SizedBox(height: 10,),

                      box_my('assets/png/math.png','رياضيات',TextStyle( color: Colors.blue,
                        fontSize: 25,fontWeight: FontWeight.bold, ), (){
                        setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                              return Lesson();
                            })

                        );
                      });}, context),
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
