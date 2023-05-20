import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_full/constants/constant.dart';
import 'package:e_commerce_full/models/user_model/user_model.dart';
import 'package:e_commerce_full/screens/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class firebase_auth1
{
  static firebase_auth1 instance=firebase_auth1();

  FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
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
    //   showMessage(e.code.toString());

      return false;
  }

    }
  Future<bool> SignUp(String name,String email,String password,BuildContext context) async
  {
    try{
      ShowLoaderDialog(context);
     UserCredential userCredential= await _auth.createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel=UserModel(id: userCredential.user!.uid, name: name, email: email,image: null);
      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context).pop();
      return true;
    }
    on FirebaseAuthException catch (e){
      Navigator.of(context).pop();
      showMessage(e.code.toString());

      return false;
    }

  }
  void logout(BuildContext context)
  {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);

  }
  Future<bool>  change_password1(String password,BuildContext context)
  async {
    try{
    _auth.currentUser!.updatePassword(password);
    Navigator.of(context).pop();


    return true;
    }
    catch(e){
      return false;
    }
  }
}