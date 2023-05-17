import 'package:e_commerce_full/models/notifier/notifier_cart.dart';
import 'package:e_commerce_full/models/product_model/productmodel.dart';
import 'package:e_commerce_full/screens/cartscreen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class product_details extends StatelessWidget {
  final ProductsModel singleProduct;
  const  product_details({super.key,required this.singleProduct});
  @override
  Widget build(BuildContext context) {

  return Consumer<notifier_cart>(
    builder: (context,notifier_model,child)=>
     Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>cart_screen()));
            }, icon: Icon(Icons.shopping_cart)),
          ],

        ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(singleProduct.image),
          Text(singleProduct.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(singleProduct.description,style: TextStyle(fontSize: 20,height: 1.5,letterSpacing: 0),),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(onPressed: (){



                 Provider.of<notifier_cart>(context,listen: false).addToCart(singleProduct);






                }, child: Text("Add to Cart",style: TextStyle(color: Colors.blue),),
                  style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.deepOrange
                  )
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(onPressed: (){




                }, child: Text("Buy Now")),

              ),

            ],
          ),
          SizedBox(height:60,),
        ],
        ),
      ),
    ),
  );
  }
}