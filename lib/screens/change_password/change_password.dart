import 'package:e_commerce_full/firebase_helper/firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class change_password extends StatelessWidget
{
  TextEditingController password=TextEditingController();
  TextEditingController confirm_password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(

                  label: Text("Enter new password"),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(11),
                  ),

                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: confirm_password,
                  decoration: InputDecoration(

                  label: Text("Confirem password  again"),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(11),
                  ),

                ),
                ),
              ),
            ),



            ElevatedButton(onPressed: () async{

             bool snack_value=await firebase_auth1.instance.change_password1(password.text,context);
              print(snack_value.toString());
              if(snack_value==true)
                {
                  print(snack_value);
                    final snack=SnackBar (content: Text("Password Changed Successfully"),);
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              else
                {
                  final snack=SnackBar(content: Text("Password update failed"));
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
            }, child: Text("Update Password"))



          ],
        ),
      ),
    );
  }
}