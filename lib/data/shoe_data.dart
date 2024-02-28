import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gsneaker/domain/shoe.dart';

class ShoeData {
  static final ShoeData _instance = ShoeData._();

  static ShoeData instance() {
    return _instance;
  }

  ShoeData._();

  Future<List<Shoe>> readShoeList() async {
    List<Shoe> list = [];

    final String response = await rootBundle.loadString('data/shoes.json');
    final data = await json.decode(response);
    print(data);

    return list;
  }
}