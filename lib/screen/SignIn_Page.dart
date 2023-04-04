 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rsnn/constant/ButtonItem.dart';
import 'package:rsnn/constant/Constant.dart';
import 'package:rsnn/constant/DefulltButton.dart';
import 'package:rsnn/constant/FromError.dart';
import 'package:rsnn/constant/MyInkWell.dart';
import 'package:rsnn/constant/SizeConfig.dart';
import 'package:rsnn/constant/TextForm.dart';
import 'package:rsnn/screen/SignUp.dart';
import '../constant/Auth_Ser.dart';


class SignIn_Page extends StatefulWidget {
  const SignIn_Page({Key? key}) : super(key: key);

  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  final emailControll=TextEditingController();
  final passwordControll=TextEditingController();
  void dispose(){
    emailControll.dispose();
    passwordControll.dispose();
    super.dispose();
  }
  String? email;
  String? password;
  final _formKey=GlobalKey<FormState>();
  final List<String?> errors=[];
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
  signIn()async{
    final vaildet=_formKey.currentState!.validate();
    if(!vaildet) return  ;
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context)=>Center(
          child: CircularProgressIndicator(),
        )
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControll.text.trim(),
          password: passwordControll.text.trim());
    }on FirebaseAuthException catch(e){
      print(e);
    }


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

                    SizedBox(height: 10,),
                Padding(padding: EdgeInsets.only(right: 70,top: 10),
                  child:  Container(
                      width: SizeConfig.widthScreen,
                      height: SizeConfig.heighScreen*0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/png/img_1.png"
                          ),
                        ),
                      ),
                    ),),

                    Text("تسجيل الدخول",style:TextStyle(
                      fontSize: 50,
                      color: Color(0xFFF90930),
                      fontWeight: FontWeight.bold,
                    ),),


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
                        }else if(!emailValidetorRegExp.hasMatch(value)){
                          removeError(errror: kInvalidEmailError);
                        }
                        email=value;
                      },
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

                    SizedBox(height: 25,),
                   FromError(errors: errors),
                    SizedBox(height: 25,),
                    DefulltButton("تسجيل الدخول ", ()async{
                    // if(_formKey.currentState!.validate()){
                    //     _formKey.currentState!.save();
                        setState((){
                          signIn();
                        });
                   // }
                   }),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myInkWell("سجل الان", (){
                          setState((){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context){
                                  return SignUp();
                                })

                            );
                          });
                        }),
                        Text("ليس لديك حساب؟",style: TextStyle(
                         color: Colors.black,
                          fontSize: 20,
                        ),
                        ),


                      ],
                    ),
                    SizedBox(height: 10,),
                    buttonItem('assets/svg/google.svg','Continve with Google', 30, (){
                      setState(() {
                       AuthSev().signInWithGoogle();
                      });
                    }, context),
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
