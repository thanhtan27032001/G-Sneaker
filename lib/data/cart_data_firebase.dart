import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gsneaker/data/constant.dart';
import 'package:gsneaker/domain/cart_item_data.dart';

class CartDataFirebase {
  static final CartDataFirebase _instance = CartDataFirebase._();
  static final dbRef = FirebaseFirestore.instance.collection(UserCartCollection.collectionName);

  static CartDataFirebase instance() {
    return _instance;
  }

  CartDataFirebase._();

  Future<List<CartItemData>> getAllShoeInCart() async {
    final List<CartItemData> result = [];
    await dbRef.get().then(
      (value) async {
        for (var doc in value.docs) {
          var cartItem = CartItemData(doc[UserCartCollection.fieldShoeId], doc[UserCartCollection.fieldAmount]);
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
      UserCartCollection.fieldShoeId: cartItem.shoeId,
      UserCartCollection.fieldAmount: cartItem.amount,
    });
    return docRef.id;
  }

  Future<void> updateShoeInCart(CartItemData cartItem) async {
    await dbRef.doc("${cartItem.id}").update({
      UserCartCollection.fieldAmount: cartItem.amount,
    });
  }

  Future<void> removeShoeFromCart(CartItemData cartItem) async {
    await dbRef.doc("${cartItem.id}").delete();
  }
}
