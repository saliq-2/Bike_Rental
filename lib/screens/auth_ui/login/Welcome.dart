import 'package:e_commerce_full/screens/auth_ui/login/login.dart';
import 'package:e_commerce_full/screens/auth_ui/sign_up/signup.dart';
import 'package:flutter/material.dart';

class welcome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            SizedBox(height: 100,),
            Text("  Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Text("\n  Buy any item from using app"),
            Image.asset("asset/images/rentalcar.jpg",height: 400,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("asset/images/facebook.png"),


                  ),
                ),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("asset/images/instagram.png"),


                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  }, child: Text("Log In"),style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade400,
                  ),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                  }, child: Text("Sign Up"),style: ElevatedButton.styleFrom(
                    primary: Color(0xFF98aef7),

                  ),
                  ),
              ),
            ),


          ],
        ) ,
      ),
    );
  }
}