import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_full/models/product_model/productmodel.dart';
import 'package:e_commerce_full/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../models/categorymodel/category_model.dart';

class FireBaseFireStoreHelper
{
  static FireBaseFireStoreHelper instance=FireBaseFireStoreHelper();
  FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async{
    try
        {
          QuerySnapshot<Map<String,dynamic>> querySnapshot =await _firebaseFirestore.collection("categories").get();
          List<CategoryModel> categoriesList=querySnapshot.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
          print(categoriesList);
          return categoriesList;
        }
        catch(e)
    {
      return [];
    }

  }
  Future<List<ProductsModel>> getBestProducts() async{
    try
    {
      QuerySnapshot<Map<String,dynamic>> querySnapshot =await _firebaseFirestore.collectionGroup("products").get();
      List<ProductsModel> productModellist=querySnapshot.docs.map((e) => ProductsModel.fromJson(e.data())).toList();
       print(productModellist);
       //print(productModellist[0].price);
      return productModellist;
    }
    catch(e)
    {
      return [];
    }

  }
  Future<List<ProductsModel>> getCategoryViewProducts(String id) async{
    try
    {
      QuerySnapshot<Map<String,dynamic>> querySnapshot =await _firebaseFirestore.collection("categories").doc(id).collection("products").get();
      List<ProductsModel> categoryModellist=querySnapshot.docs.map((e) => ProductsModel.fromJson(e.data())).toList();
      print(categoryModellist);
      //print(productModellist[0].price);
      return categoryModellist;
    }
    catch(e)
    {
      return [];
    }
  }
    Future<UserModel> getUserInformation() async{
      DocumentSnapshot<Map<String,dynamic>> querySnapshot =await _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).get();



      return UserModel.fromJson(querySnapshot.data()!);


  }
}