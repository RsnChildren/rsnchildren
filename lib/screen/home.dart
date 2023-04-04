import 'package:flutter/material.dart';
import 'package:rsnn/constant/SizeConfig.dart';
import 'package:rsnn/screen/my.dart';
import 'package:rsnn/screen/subject.dart';
import '../constant/AllTitels.dart';
import '../constant/DefulltButton.dart';
import '../constant/exit.dart';
import '../constant/sectionCard.dart';
import 'package:rsnn/constant/DefulltButton.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Scaffold(
        backgroundColor:Colors.white,
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
                      SizedBox(height: 10,),

                  Row(
                    children: [

                        Image.asset('assets/png/boy2.png'),

                      Padding(
                        padding:EdgeInsets.only(left: 5 ),
                        child: CircleAvatar(

                          backgroundColor: Color(0xFFF1A0A0),

                          radius: 60,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                             Padding(padding:EdgeInsets.only(top: 10),
                            child: Text('الاسم',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)), ),
                              Text('نهى',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 33,color: Color(0xFF720D0D),)),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding:EdgeInsets.only(left: 230 ),
                    child: CircleAvatar(

                      backgroundColor: Color(0xFFFFE88B),

                      radius: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding:EdgeInsets.only(top: 10),
                            child: Text('الصف',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)), ),
                          Text('الثاني',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 30,color:Color(0xFF65581A),)),

                        ],
                      ),
                    ),
                  ),
                      Padding(
                        padding:EdgeInsets.only(left: 20 ),
                        child: CircleAvatar(

                          backgroundColor: Color(0xFF8FD7F1),

                          radius: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding:EdgeInsets.only(top: 10),
                                child: Text('المدرسة',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)), ),
                              Text('اليمن',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 33,color:Color(
                                  0xFF112E3B),)),

                            ],
                          ),
                        ),
                      ),
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

                      Text('الدروس التي تم أخذها',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.red),),
                      Column(children: [
                        ViewContainer('الرياضيات','الوحدة الاولى','الدرس الاول','assets/png/math.png',(){
                          setState((){});

                        },context),
                        SizedBox(height: 10,),
                        ViewContainer('الإسلامية','الوحدة الاولى','الدرس الاول','assets/png/eslam.png',(){
                          setState((){});

                        },context),
                       ], ),




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

  Widget ViewContainer(String name,String name2,String name3,String img,Function()press,BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
                          decoration:BoxDecoration(
                              color: Colors.green.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.1),
                                  blurRadius: 24,
                                  offset: const Offset(0,16),
                                )
                              ]
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 150),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                                    Text(name2,style: TextStyle(fontSize: 20,color: Color(
                                        0xFF407A0B)),),
                                    Text(name3,style: TextStyle(fontSize: 15,color: Color(0xFFF1A0A0))),
                                  ],
                                ),
                                Image.asset(img),

                              ],
                            ),
                          ),
                        ),
    );
  }
}
