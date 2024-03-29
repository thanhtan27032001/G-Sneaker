import 'package:flutter/material.dart';

class Shoe {
  int? id;
  String? image;
  String? name;
  String? description;
  double? price;
  String? color;
  bool? isInCart;

  Shoe(
      {this.id,
      this.image,
      this.name,
      this.description,
      this.price,
      this.color,
      this.isInCart});

  Color getShoeColor() {
    return Color(int.parse("0xff${color?.replaceAll("#", "")}"));
  }

  Shoe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    color = json['color'];
    isInCart = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['color'] = this.color;
    return data;
  }
}
