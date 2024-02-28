import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gsneaker/domain/cart_item_data.dart';

class CartDataFirebase {
  static final CartDataFirebase _instance = CartDataFirebase();
  static final dbRef = FirebaseFirestore.instance.collection("userCart");

  static CartDataFirebase instance() {
    return _instance;
  }

  Future<List<CartItemData>> getAllShoeInCart() async {
    final List<CartItemData> result = [];
    await dbRef.get().then(
      (value) async {
        for (var doc in value.docs) {
          var cartItem = CartItemData(doc["shoeId"], doc["amount"]);
          cartItem.id = doc.id;
          result.add(cartItem);
        }
      },
    ).onError((error, stackTrace) {
      printError(info: 'noooo \n ${error.toString()}');
    });
    return result;
  }

  Future<String> addShoeToCart(CartItemData cartItem) async {
    var docRef = await dbRef.add({
      "shoeId": cartItem.shoeId,
      "amount": cartItem.amount,
    });
    return docRef.id;
  }

  Future<void> updateShoeInCart(CartItemData cartItem) async {
    await dbRef.doc("${cartItem.id}").update({
      "amount": cartItem.amount,
    });
  }

  Future<void> removeShoeFromCart(CartItemData cartItem) async {
    await dbRef.doc("${cartItem.id}").delete();
  }
}
