import 'package:e_commerce_full/models/categorymodel/category_model.dart';
import 'package:e_commerce_full/models/product_model/productmodel.dart';
import 'package:flutter/material.dart';

import '../../firebase_helper/firebase_firestore/firebase_firestore/firebase_firestore1.dart';

class category_view extends StatefulWidget
{
  late final CategoryModel categoryproduct;
  category_view({super.key,required this.categoryproduct});
  @override
  State<category_view> createState() => _category_viewState();
}

class _category_viewState extends State<category_view> {


  @override
  void initState() {

    getCategoryView();
    super.initState();
  }
  bool isLoading=false;
  List<ProductsModel> categoriesViewList=[];

  void getCategoryView() async
  {
    setState((){
      isLoading=true;
    });
    categoriesViewList=await FireBaseFireStoreHelper.instance.getCategoryViewProducts(widget.categoryproduct.id);

    categoriesViewList.shuffle();
    setState((){
      isLoading=false;
    });
  }
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(),
      body: isLoading?Center(
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child:CircularProgressIndicator() ,
        ),
      ):Container(
        child: GridView.builder(
          //scrollDirection: Axis.vertical,
          //shrinkWrap: true,

            itemCount: categoriesViewList.length,

            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount:2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),

            itemBuilder: (context,index) {
              ProductsModel myproduct=categoriesViewList[index];

              return Padding(
                padding:  EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),

                      shape: BoxShape.rectangle,
                      border: Border(
                        left: BorderSide(color: Colors.black),
                        right:BorderSide(color: Colors.black),
                        bottom:BorderSide(color: Colors.black) ,
                        top:BorderSide(color: Colors.black),

                      )

                  ) ,

                  child: Column(
                    children: [




                      Image.network(myproduct.image,fit: BoxFit.cover,),

                      OutlinedButton(onPressed: (){

                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>category_view(categoryproduct: )));

                      }, child: Text("Buy"),style: OutlinedButton.styleFrom(
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


    );
  }
}