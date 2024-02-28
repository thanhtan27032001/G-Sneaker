import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gsneaker/domain/shoe.dart';

class ProductData {
  static final ProductData _instance = ProductData._();

  static ProductData instance() {
    return _instance;
  }

  ProductData._();

  Future<List<Shoe>> readShoeList() async {
    List<Shoe> shoeList = [];

    final String response = await rootBundle.loadString('data/shoes.json');
    final data = await json.decode(response);
    // print(data);

    var listData = data["shoes"] as List<dynamic>;
    for(var shoeData in listData) {
      shoeList.add(Shoe.fromJson(shoeData));
    }
    print(listData);

    return shoeList;
  }
}