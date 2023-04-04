import 'package:flutter/material.dart';
import 'package:rsnn/constant/Constant.dart';
import 'package:rsnn/constant/DefulltButton.dart';
import 'package:rsnn/constant/FromError.dart';
import 'package:rsnn/constant/MyInkWell.dart';
import 'package:rsnn/constant/SizeConfig.dart';
import 'package:rsnn/constant/TextForm.dart';
import 'package:rsnn/screen/SignIn_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rsnn/screen/my.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailControll=TextEditingController();
  final passwordControll=TextEditingController();
  void dispose()
  {
    emailControll.dispose();
    passwordControll.dispose();
    super.dispose();
  }
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  var dbControll;
  void initState() {
    super.initState();

  }

  void addError({String? errror}){
    if(!errors.contains(errror))
      setState((){
        errors.add(errror);
      });
  }
  void removeError({String? errror}){
    if(errors.contains(errror))
      setState((){
        errors.remove(errror);
      });
  }
  sigUp()async{
    final vaildet=_formKey.currentState!.validate();
    if (!vaildet) return ;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder:(context)=>Center(
          child: CircularProgressIndicator(),

        ));
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailControll.text.trim(),
          password:passwordControll.text.trim());
    }on FirebaseAuthException catch(e)
    {
      //print(e);
    }


//navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor:Color(0xFFFFFFFF),
        body: SafeArea(
          child:Stack(
            children: [
              Padding(padding: const EdgeInsets.only(left: 16,right: 16,bottom: 60),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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

                      Text("التسجيل",style:TextStyle(
                        fontSize: 50,
                        color: Color(0xFFF90930),
                        fontWeight: FontWeight.bold,
                      ),),

                      SizedBox(height: 10,),
                      TextForm(
                        obscureText: false,
                        labelText: "الاسم الاول",
                        validation: (value){},
                        press: (value){},
                      ),
                      SizedBox(height: 10,),
                      TextForm(
                        obscureText:false,
                        labelText: "الاسم الاخير",
                        validation: (value){},
                        press: (value){},
                      ),
                      SizedBox(height: 10,),
                      TextForm(
                        obscureText: false,
                        controller: emailControll,
                        mykey: TextInputType.emailAddress,
                        labelText: "البريد الالكتروني",
                        validation: (value){
                          if(value!.isEmpty){
                            addError(errror: kEmailNullError);
                            return "";
                          }else if(!emailValidetorRegExp.hasMatch(value)){
                            addError(errror: kInvalidEmailError);
                            return "";
                          }
                          return null;
                        },
                        press: (value){
                          if(value.isNotEmpty){
                            removeError(errror: kEmailNullError);
                          }else if(emailValidetorRegExp.hasMatch(value)){
                            removeError(errror: kInvalidEmailError);
                          }
                          email=value;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextForm(
                        obscureText: false,
                        labelText: "الصف",
                        validation: (value){},
                        press: (value){},
                      ),
                      SizedBox(height: 10,),
                      TextForm(
                        obscureText: false,
                        labelText: "اسم ولي الأمر",
                        validation: (value){},
                        press: (value){},
                      ),
                      SizedBox(height: 10,),
                      TextForm(
                        obscureText: false,
                        labelText: "الرقم الأكاديمي",
                        validation: (value){},
                        press: (value){},
                      ),
                      SizedBox(height: 10,),
                      TextForm(
                        obscureText:true,
                        controller: passwordControll,
                        mykey: TextInputType.text,
                        labelText: "كلمة السر",
                        validation: (value) {
                          if (value!.isEmpty) {
                            addError(errror: kPassNullError);
                            return "";
                          } else if (value.length< 8) {
                            addError(errror: kShortPassError);
                            return "";
                          }
                          return null;
                        },
                        press: (value) {
                          if (value.isNotEmpty) {
                            removeError(errror: kPassNullError);
                          }  if (value.length >= 8) {
                            removeError(errror: kShortPassError);
                          }
                          password=value;
                          //  return null;
                          //
                        },
                      ),
                      SizedBox(height: 10,),
                      TextForm(
                        obscureText: true,
                        controller: passwordControll,
                        mykey: TextInputType.text,
                        labelText: "تأكيد كلمة السر",
                        validation: (value) {
                          if (value!.isEmpty) {
                            addError(errror: kPassNullError);
                            return "";
                          } else if (value.length< 8) {
                            addError(errror: kShortPassError);
                            return "";
                          }
                          return null;
                        },
                        press: (value) {
                          if (value.isNotEmpty) {
                            removeError(errror: kPassNullError);
                          }  if (value.length >= 8) {
                            removeError(errror: kShortPassError);
                          }
                          //  return null;
                          //
                        },
                      ),
                      SizedBox(height: 25,),
                      FromError(errors: errors),
                      SizedBox(height: 25,),
                      DefulltButton("تسجيل", ()async{
                        // if(_formKey.currentState!.validate()){
                        //     _formKey.currentState!.save();
                        setState((){
                          sigUp();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context){
                          //       return Home();
                          //     })

                          // );
                        });
                        // }
                      }),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myInkWell("الحفظ", ()async{
                            setState((){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context){
                                    return My();
                                  })
                              );
                            });
                          }),

                          Text(":تذكر ان تقوم ب",style: TextStyle(
                            color: Color(0x99063373),
                            fontSize: 18,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myInkWell("تسجيل دخول", (){
                            setState((){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context){
                                    return SignIn_Page();
                                  })
                              );
                            });
                          }),

                          Text(":هل لديك حساب",style: TextStyle(
                            color: Color(0x99063373),
                            fontSize: 18,
                          ),
                          ),
                        ],
                      ),
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
