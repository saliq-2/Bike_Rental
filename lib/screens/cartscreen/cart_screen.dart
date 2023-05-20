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


        Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(
            height: 102,


            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color: Colors.red,


              )
            ),
            child: Column(
              children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    ClipRRect(

                        borderRadius: BorderRadius.circular(11),
                        child: Image.network(notifier_model.cartList[index].image,height: 100,)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(notifier_model.cartList[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("\$"+notifier_model.cartList[index].price,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          IconButton(onPressed: (){
                            notifier_model.removeFromCart(notifier_model.cartList[index]);
                          }, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),



                  ],
                  

                ),

              ],
            ),

          ),
        ),
        ),
      ),
    );
  }
}
