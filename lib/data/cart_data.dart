import 'package:gsneaker/domain/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartData {
  static final CartData _instance = CartData._();

  static CartData instance() {
    return _instance;
  }

  CartData._();

  Future<List<CartItem>> getAllShoeInCart() async {
    List<CartItem> cartShoeList = [];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> allAddedShoeId = prefs.getKeys();

    for (var shoeId in allAddedShoeId) {
      cartShoeList.add(CartItem(int.parse(shoeId), prefs.getInt(shoeId) ?? 0));
    }

    return cartShoeList;
  }

  Future<void> updateShoeInCart(CartItem cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(cartItem.id.toString(), cartItem.amount);
  }

}