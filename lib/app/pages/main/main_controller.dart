import 'package:get/get.dart';
import 'package:gsneaker/data/cart_data.dart';
import 'package:gsneaker/data/product_data.dart';
import 'package:gsneaker/domain/cart_item.dart';
import 'package:gsneaker/domain/shoe.dart';

class MainController extends GetxController {
  Rxn<List<Shoe>> shoeProductList = Rxn();
  Rxn<List<CartItem>> shoeCartList = Rxn();

  @override
  void onInit() {
    super.onInit();
    getAllProductItem();
  }

  Future<void> getAllProductItem() async {
    shoeProductList.value = await ProductData.instance().readShoeList();
    getAllCartItem();
  }

  Future<void> getAllCartItem() async {
    shoeCartList.value = await CartData.instance().getAllShoeInCart();
  }

  Shoe? getShoeById(int id) {
    return shoeProductList.value?.firstWhere((element) => element.id == id);
  }

  void addShoeToCart(Shoe shoe) {
    CartItem cartItem = CartItem(shoe.id!, 1);
    try {
      CartData.instance().updateShoeInCart(cartItem);
      shoeCartList.value?.add(cartItem);
      shoeCartList.refresh();
    }
    catch(e) {
      print("Add shoe to cart failed");
      e.printError();
    }
  }
}
