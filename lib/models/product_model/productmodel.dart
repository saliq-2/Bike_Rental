// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  String description;
  String id;
  String price;

  String  name;
  String  image;

  String status;
  //bool isFavt;

  ProductsModel({
    required this.price,
    required this.id,
    required this.description,
    required this.name,
    required this.image,
    required this.status,
   // required this.isFavt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    price: json["price"],
    status: json["status"],
    //isFavt:false ,

  );

  Map<String, dynamic> toJson() => {
    "price":price,
    "id": id,
    "name": name,
    "image":image,
    "description":description,
    "status":status,
    //"isFavt":isFavt,

  };
}
