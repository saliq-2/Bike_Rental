import 'package:e_commerce_full/firebase_helper/firebase_auth/firebase_auth.dart';
import 'package:e_commerce_full/firebase_helper/firebase_firestore/firebase_firestore/firebase_firestore1.dart';
import 'package:e_commerce_full/models/notifier/notifier_cart.dart';
import 'package:e_commerce_full/screens/categoryview/category_view.dart';
import 'package:e_commerce_full/screens/home/productdetails/product_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/categorymodel/category_model.dart';
import '../../models/product_model/productmodel.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override

  void initState() {
    // TODO: implement initState
    getCategoryList();
   // print(productsList[0]);
    notifier_cart app_provider=Provider.of<notifier_cart>(context,listen: false);
    app_provider.getUserInfoFirebase();

    super.initState();

  }
  List<CategoryModel> categoriesList=[];
  List<ProductsModel> productsList=[];

  bool isLoading=false;
  void getCategoryList() async
  {
    setState((){
      isLoading=true;
    });
    categoriesList=await FireBaseFireStoreHelper.instance.getCategories();
    productsList=await FireBaseFireStoreHelper.instance.getBestProducts();
    productsList.shuffle();

    setState((){
      isLoading=false;
    });
  }


  final user=FirebaseAuth.instance.currentUser;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width*0.6,
        child: ListView(
            children: [
              DrawerHeader(child:CircleAvatar(
                backgroundColor: Colors.yellow,
              ) ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.yellow.withOpacity(0.5),
                  leading: Text("${user!.email}"),
                ),
              ),
              SizedBox(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Past Orders"),
                  )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("About Us"),
              )
      ],
    ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF98aef7),
        title:Text("Rentals",
          style: TextStyle( fontSize: 50,fontFamily:"Tangerine-Regular"),
        ) ,
        actions: [
          IconButton(onPressed: (){
            // FirebaseAuth.instance.signOut();



            //firebase_auth1.instance.logout();



          }, icon: Icon(Icons.logout))
        ],
      ),
      body:isLoading?Center(
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child:CircularProgressIndicator() ,
        ),
      ):

      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 450,
                      color: Colors.deepOrangeAccent,),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 400,
                      color: Colors.blue,)
                  ],
                ),
              ) ,
              // Placeholder(
              //   fallbackHeight: 50,
              // ),
              ),

            SizedBox(height: 1,),
            Center(
              child: SizedBox(
                height: 10,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                // child: TextFormField(
                //   decoration: InputDecoration(
                //       hintText: "Search",
                //       prefix: Icon(Icons.search),
                //       border: OutlineInputBorder(
                //
                //       )
                //   ),
                // ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children:
              categoriesList.map((e) =>

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Container(
                      // color: Colors.blue,


                      width: 150,
                      height: 100,
                      child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>category_view(categoryproduct: e)));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(e.image,fit: BoxFit.fill,))),

                        ),

                    ),
                  )
              ).toList(),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Hot Selling Items",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Container(

              child: Expanded(
                child: GridView.builder(
                  //scrollDirection: Axis.vertical,
                  //shrinkWrap: true,

                    itemCount: productsList.length,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                        crossAxisCount:2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),

                    itemBuilder: (context,index) {
                      ProductsModel myproduct=productsList[index];

                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(


                         decoration: BoxDecoration(
                             color: Colors.grey.shade300.withOpacity(0.3),

                           shape: BoxShape.rectangle,
                           borderRadius: BorderRadius.circular(11),

                          //  border: Border(
                          // left: BorderSide(color: Colors.red),
                          //    right:BorderSide(color: Colors.red),
                          //    bottom:BorderSide(color: Colors.red) ,
                          //    top:BorderSide(color: Colors.red),
                          //
                          //  )

                         ) ,

                         child: Column(
                           children: [




                             ClipRRect(

                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11)),
                                 child: Image.network(myproduct.image,width: 200,height: 150,fit: BoxFit.fitHeight,)),
                             SizedBox(height: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,

                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 4),
                                   child: Text("Price per hour: ",style: TextStyle(fontWeight: FontWeight.bold),),
                                 ),
                                 Text("\$"+myproduct.price,style: TextStyle(color: Colors.red),)
                               ],
                             ),
                             //Text(myproduct.image),
                             OutlinedButton(onPressed: (){

                               Navigator.push(context, MaterialPageRoute(builder: (context)=>product_details(singleProduct: myproduct)));

                             }, child: Text("Rent Out"),style: OutlinedButton.styleFrom(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(11),
                                 side: BorderSide(
                                   color: Colors.white,
                                 )
                               )
                             ),
                             )
                           ],
                         ),
                       ),
                     );
                    }

                ),
              ),
            ),
            SizedBox(height: 50,),


          ],

        ),
      ),
    );
  }
}
