import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gsneaker/domain/cart_item.dart';

class CartDataFirebase {
  static final CartDataFirebase _instance = CartDataFirebase();
  static final dbRef = FirebaseFirestore.instance.collection("userCart");

  static CartDataFirebase instance() {
    return _instance;
  }

  Future<List<CartItem>> getAllShoeInCart() async {
    final List<CartItem> result = [];
    await dbRef.get().then(
      (value) async {
        for (var doc in value.docs) {
          var cartItem = CartItem(doc["shoeId"], doc["amount"]);
          cartItem.id = doc.id;
          result.add(cartItem);
        }
      },
    ).onError((error, stackTrace) {
      printError(info: 'noooo \n ${error.toString()}');
    });
    return result;
  }

  Future<String> addShoeToCart(CartItem cartItem) async {
    var docRef = await dbRef.add({
      "shoeId": cartItem.shoeId,
      "amount": cartItem.amount
    });
    return docRef.id;
  }

  Future<void> updateShoeInCart(CartItem cartItem) async {
    await dbRef.doc("userCart/${cartItem.id}").set({"amount": cartItem.amount});
  }

  Future<void> removeShoeFromCart(CartItem cartItem) async {
    await dbRef.doc("userCart/${cartItem.id}").delete();
  }
}
