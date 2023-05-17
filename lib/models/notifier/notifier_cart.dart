import 'package:flutter/material.dart';

import '../product_model/productmodel.dart';

class notifier_cart extends ChangeNotifier
{
  List<ProductsModel> _cart_list=[];
  List<ProductsModel> get cartList=>_cart_list;
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
}