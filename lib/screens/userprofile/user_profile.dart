import 'package:e_commerce_full/firebase_helper/firebase_auth/firebase_auth.dart';
import 'package:e_commerce_full/models/notifier/notifier_cart.dart';
import 'package:e_commerce_full/screens/change_password/change_password.dart';
import 'package:e_commerce_full/screens/edit_profile/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../order_screen/order_screen.dart';

class user_profile extends StatefulWidget
{
  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  FirebaseAuth user=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    notifier_cart app_provider=Provider.of<notifier_cart>(context);
    // TODO: implement build
    return Scaffold(

      body: SafeArea(
        child: Container(
          child: Column(

            children: [
              Center(child: Text("Account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              Icon(Icons.person_outline_outlined,size: 150,),
              Text("${app_provider.getUserInformation?.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("${FirebaseAuth.instance.currentUser?.email}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              SizedBox(
                  width: 200,

                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>edit_profile()));
                  }, child: Text("Edit Profile"),style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent.shade200,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),


                    )
                  ),
                  )
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>order_screen()));
                },
                leading: Icon(Icons.shopping_bag_outlined),
                title: Text("Your Orders",style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>change_password()));
                },
                leading:Icon(Icons.change_circle_outlined),
                    title: Text("Change Password"),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.keyboard_return),
                title: Text("Refunds",style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.message),
                title: Text("Message Us",style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.support_agent),
                title: Text("Support",style: TextStyle(fontSize: 15),),
              ),
              ListTile(
                onTap: () async{

                  firebase_auth1.instance.logout(context);


                  await  user.signOut();





                },
                leading: Icon(Icons.logout),
                title: Text("Log Out",style: TextStyle(fontSize: 15),),
              ),

            ],
          ),
        ),
      ),

    );
  }
}