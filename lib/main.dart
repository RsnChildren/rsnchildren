
import 'package:flutter/material.dart';
import 'package:rsnn/screen/home.dart';
import 'package:rsnn/screen/lesson.dart';
 import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:rsn/screen/home.dart';
// import 'package:rsn/screen/lesson.dart';
// import 'package:rsn/screen/subject.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constant/Auth_Page.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:mainSinUpPage());//Subject()); //My()   ); //SignUp()  ); //SignIn_Page()  );
  }
}
class mainSinUpPage extends StatefulWidget{
  @override
  State<mainSinUpPage> createState() => _mainSinUpPageState();
}

class _mainSinUpPageState extends State<mainSinUpPage> {
  void initState() {
    super.initState();
    permissionRequest();
  }
  void permissionRequest()async
  {
    var status =await Permission.storage.status;
    if(!status.isGranted){
      await Permission.storage.request();
    }
    var status1 =await Permission.manageExternalStorage.status;
    if(!status1.isGranted) {
      await Permission.manageExternalStorage.request();
    }

  }
  @override
  Widget build(BuildContext context)=>Scaffold(
    body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
          {  return Center(child: CircularProgressIndicator(),);}
          else
          if (snapshot.hasError)
          { return Center(child: Text("error"));}
          else  if(snapshot.hasData){
            return Home();
          }
          else{
            return AuthPage();
          }
        }),
  );
}
