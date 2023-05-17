import 'package:e_commerce_full/models/notifier/notifier_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cart_screen extends StatefulWidget
{
  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<notifier_cart>(
      builder: (context,notifier_model,child)=>
       Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF98aef7),

        ),
        body: ListView.builder(
          itemCount: notifier_model.cartList.length,
          itemBuilder: (context,index)=>


        Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListTile(
                  tileColor: Colors.greenAccent,
                  leading: Image.network(notifier_model.cartList[index].image,height: 100,),
                   trailing: IconButton(onPressed: (){

                     notifier_model.removeFromCart(notifier_model.cartList[index]);

                   }, icon: Icon(Icons.delete)),
                  // title:Text("Laptop"),
                  // subtitle: Text("Macbook pro"),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
