// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class SkimModel {
  static final items = [
    Item(
        id: 1,
        name: "3D objects",
        desc: "3D objects of all subjects and vast category of concepts",
        price: 30,
        color: "#33505a",
        image: "assets/images/3D_image.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
