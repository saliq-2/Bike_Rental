import 'package:e_commerce_full/constants/constant.dart';
import 'package:e_commerce_full/firebase_helper/firebase_auth/firebase_auth.dart';
import 'package:e_commerce_full/screens/home/homepage.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget
{
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF98aef7),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 20,),
          Center(child: Text(" Welcome back to store",style: TextStyle(fontSize: 20,),)),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),

            width: 350,
            child: Center(
              child: TextField(
                controller: email_controller,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  label: Text("Enter your email"),
                  border: OutlineInputBorder(

                  )
                ),

              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 350,
            child: TextField(
              controller: password_controller,
              obscureText: true,

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  label: Text("Enter your Password"),
                  border: OutlineInputBorder(

                  )
              ),

            ),
          ),


          //Elevated button for login

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
                height: 50,
                child:
                ElevatedButton(
                    onPressed: () async{


                 bool isValid= (loginValidation(email_controller.text, password_controller.text));
                 if(isValid)
                   {


                     bool isLoggedIn= await firebase_auth1.instance.login(email_controller.text, password_controller.text, context);

                    if(isLoggedIn)
                      {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homepage()), (route) => false);
                      }
                   }




                    }, child: Text("Login "),style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade200,
                ),)),
          ),
          SizedBox(
            height: 20,
          ),
          Center(child: Text("Dont have an account")),
          Center(child: TextButton(onPressed: (){}, child: Text("Create Account"))),


        ],
      ) ,
    );

  }
}