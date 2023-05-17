import 'package:e_commerce_full/constants/constant.dart';
import 'package:e_commerce_full/screens/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class firebase_auth1
{
  static firebase_auth1 instance=firebase_auth1();
  FirebaseAuth _auth=FirebaseAuth.instance;
  Stream <User?> get getAuthChange=>_auth.authStateChanges();
  Future<bool> login(String email,String password,BuildContext context) async
  {
    try{
      ShowLoaderDialog(context);
     await _auth.signInWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pop();
     return true;
    }
  on FirebaseAuthException catch (e){
    Navigator.of(context).pop();
      showMessage(e.code.toString());

      return false;
  }

    }
  Future<bool> SignUp(String email,String password,BuildContext context) async
  {
    try{
      ShowLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }
    on FirebaseAuthException catch (e){
      Navigator.of(context).pop();
      showMessage(e.code.toString());

      return false;
    }

  }
  void logout(user) async
  {
    await _auth.signOut();
  }
}