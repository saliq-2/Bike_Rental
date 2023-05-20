import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
enum choices{cash_on_delivery,online_payment}
class buy_product extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("CheckOut"),
        centerTitle: true,
      ),
      body:SafeArea(
        child: Column(
          children: [
            ListTile(
              // leading: Radio(
              //   groupValue:choices.cash_on_delivery ,
              //   onChanged:(choices value){
              //
              //   } ,
              //   value:choices.cash_on_delivery ,
              // ),
            )
          ],
        ),
      ) ,
    );
  }
}