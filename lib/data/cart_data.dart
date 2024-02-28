import 'package:gsneaker/domain/cart_item_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartData {
  static final CartData _instance = CartData._();

  static CartData instance() {
    return _instance;
  }

  CartData._();

  Future<List<CartItemData>> getAllShoeInCart() async {
    List<CartItemData> cartShoeList = [];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> allAddedShoeId = prefs.getKeys();

    for (var shoeId in allAddedShoeId) {
      cartShoeList.add(CartItemData(int.parse(shoeId), prefs.getInt(shoeId) ?? 0));
    }

    return cartShoeList;
  }

  Future<void> updateShoeInCart(CartItemData cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(cartItem.shoeId.toString(), cartItem.amount);
  }

}