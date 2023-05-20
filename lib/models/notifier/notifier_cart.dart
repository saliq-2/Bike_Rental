import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_full/firebase_helper/firebase_firestore/firebase_firestore/firebase_firestore1.dart';
import 'package:e_commerce_full/firebase_helper/firebase_storage/firebase_storage.dart';
import 'package:e_commerce_full/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

import '../product_model/productmodel.dart';

class notifier_cart extends ChangeNotifier
{
  List<ProductsModel> _cart_list=[];
  List<ProductsModel> get cartList=>_cart_list;
  UserModel? _userModel;
  UserModel? get getUserInformation=>_userModel;
  void addToCart(ProductsModel myproduct)
  {
    cartList.add(myproduct);
    notifyListeners();
  }
  void removeFromCart(ProductsModel myproduct)
  {
    cartList.remove(myproduct);
    notifyListeners();
  }
  void getUserInfoFirebase() async
  {
    _userModel=await FireBaseFireStoreHelper.instance.getUserInformation();
    notifyListeners();
  }
  void updateUserInfoFirebase(
      BuildContext context, UserModel userModel, File? file) async {
    if (file == null) {
      //showLoaderDialog(context);

      _userModel = userModel;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      // Navigator.of(context, rootNavigator: true).pop();
      // Navigator.of(context).pop();
    } else {
     // showLoaderDialog(context);

      String imageUrl =
      await firebase_storage.instance.uploadUserImage(file);
      _userModel = userModel.copyWith(image: imageUrl);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      // Navigator.of(context, rootNavigator: true).pop();
      // Navigator.of(context).pop();
    }
  //  showMessage("Successfully updated profile");

    notifyListeners();
  }

}