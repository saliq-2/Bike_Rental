//import 'dart:html';
import 'dart:io';

import 'package:e_commerce_full/models/notifier/notifier_cart.dart';
import 'package:e_commerce_full/models/user_model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class edit_profile extends StatefulWidget
{

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  File? image1;
  void takePicture() async
  {
    XFile? value=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40);
    // if(value!=null)
    //   {
    //     setState((){
    //       image1=File(value.path);
    //     });
    //   }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    notifier_cart app_provider=Provider.of<notifier_cart>(context);
    return Scaffold(
      body: ListView(
        children: [
        image1==null?
          GestureDetector(
            onTap: (){
              takePicture();
            },
            child: CircleAvatar(
              radius: 70,
              child: Icon(Icons.photo),
            ),
          )
            :CupertinoButton(

            child:CircleAvatar(
              backgroundImage: FileImage(image1!),
              radius: 70,
            ) , onPressed: (){
              takePicture();
            }
            ),

          ElevatedButton(onPressed: () async{
              UserModel userModel=app_provider.getUserInformation!.copyWith(name:"saliq");
              app_provider.updateUserInfoFirebase(context,userModel , image1);
              //print("print"+image1.toString());

          }, child: Text("Update"))
        ],
      ),

    );
  }
}