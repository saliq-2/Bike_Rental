import 'package:e_commerce_full/constants/constant.dart';
import 'package:e_commerce_full/firebase_helper/firebase_auth/firebase_auth.dart';
import 'package:e_commerce_full/screens/home/homepage.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget
{
  TextEditingController email_controller_signup=TextEditingController();
  TextEditingController password_controller_signup=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(" Sign Up\n",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(" Welcome  to store",style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: SizedBox(
                width: 350,
                child: TextField(

                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text("Name"),
                      border: OutlineInputBorder(

                      )
                  ),

                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: email_controller_signup,
                  keyboardType: TextInputType.emailAddress,


                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      label: Text("Email"),
                      border: OutlineInputBorder(

                      ),
                  ),

                ),
              ),
            ),


            //Phone number
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: SizedBox(
                width: 350,
                child: TextField(

                  keyboardType: TextInputType.phone,
                  

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    label: Text("Phone"),
                    border: OutlineInputBorder(

                    ),
                  ),

                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: password_controller_signup,
                  obscureText: true,

                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.password),
                    label: Text("Create Password"),

                    border: OutlineInputBorder(
                    // borderSide: BorderSide(
                    //   color: Colors.blue,
                    //   width: 10
                    // )
                    ),
                  ),

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


                      bool isValid=SignUpValidation(email_controller_signup.text,password_controller_signup.text );
                      if(isValid)
                        {

                          bool signedUp= await firebase_auth1.instance.SignUp(email_controller_signup.text, password_controller_signup.text, context);
                       if(signedUp)
                         {
                           //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homepage()));
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homepage()), (route) => false);
                         }
                        }




                    }, child: Text("Create Account"),style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade400,
                  ),)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Text("Already have an Account"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170),
              child: TextButton(onPressed: (){}, child: Text("     Log In")),
            ),




          ],
        ),
      ) ,
    );

  }
}