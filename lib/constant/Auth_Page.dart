
import 'package:flutter/material.dart';
import 'package:rsnn/screen/SignIn_Page.dart';


import '../Screen/SignUp.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin=true;
  @override
  Widget build(BuildContext context) =>isLogin?
 SignIn_Page():SignUp();
  void toggle()=>setState(()=>isLogin=!isLogin);
}
