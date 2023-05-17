import 'package:e_commerce_full/firebase_helper/firebase_auth/firebase_auth.dart';
import 'package:e_commerce_full/firebase_helper/firebaseoption/firebase_option.dart';
import 'package:e_commerce_full/models/notifier/notifier_cart.dart';
import 'package:e_commerce_full/screens/auth_ui/login/Welcome.dart';
import 'package:e_commerce_full/screens/auth_ui/login/login.dart';
import 'package:e_commerce_full/screens/custom_bt_navbar/custom_bt_nav_bar.dart';
import 'package:e_commerce_full/screens/home/homepage.dart';
import 'package:e_commerce_full/screens/home/productdetails/product_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (context)=>notifier_cart()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
         home:
        StreamBuilder<User?>(
          stream: firebase_auth1.instance.getAuthChange,
          builder: (context,snapshot){
            if(snapshot.hasData)
              {
                return CustomBottomBar();
              }
            else
              {
                return welcome();
              }
          },
        ) ,
      ),
    );
  }
}

