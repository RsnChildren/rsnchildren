import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthSev{
  signInWithGoogle()async{
    final GoogleSignInAccount ?googleUser= await GoogleSignIn(
      scopes: <String>["email"]

    ).signIn();
    final GoogleSignInAuthentication googleAth= await googleUser!.authentication;
    final credential=GoogleAuthProvider.credential(
      accessToken: googleAth.accessToken,
      idToken: googleAth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
  signOutWithGoogle(){
    FirebaseAuth.instance.signOut();
  }

  }
