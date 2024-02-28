import 'package:get/get.dart';
import 'package:gsneaker/data/cart_data_2.dart';
import 'package:gsneaker/data/product_data.dart';
import 'package:gsneaker/domain/cart_item_data.dart';
import 'package:gsneaker/domain/shoe.dart';

class MainController extends GetxController {
  Rxn<List<Shoe>> shoeProductList = Rxn();
  Rxn<List<CartItemData>> shoeCartList = Rxn();
  RxDouble cartTotalPrice = 0.0.obs;

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
    shoeCartList.value = await CartDataFirebase.instance().getAllShoeInCart();
    for(var item in shoeCartList.value!) {
      shoeProductList.value!.firstWhere((element) => element.id == item.shoeId).isInCart = true;
    }
    shoeProductList.refresh();
    sumCartTotalPrice();
  }

  Shoe? searchShoeById(int id) {
    return shoeProductList.value?.firstWhere((element) => element.id == id);
  }

  Future<void> addShoeToCart(Shoe shoe) async {
    CartItemData cartItem = CartItemData(shoe.id!, 1);
    try {
      await CartDataFirebase.instance().addShoeToCart(cartItem);
      shoeCartList.value?.add(cartItem);
      shoeCartList.refresh();
      shoeProductList.value?.firstWhere((element) => element.id == shoe.id).isInCart = true;
      shoeProductList.refresh();
      sumCartTotalPrice();
    }
    catch(e) {
      print("Add shoe to cart failed");
      e.printError();
    }
  }

  Future<void> removeShoeFromCart(CartItemData cartItem) async {
    try {
      await CartDataFirebase.instance().removeShoeFromCart(cartItem);
      shoeCartList.value?.remove(cartItem);
      shoeCartList.refresh();
      shoeProductList.value?.firstWhere((element) => element.id == cartItem.shoeId).isInCart = false;
      shoeProductList.refresh();
      sumCartTotalPrice();
    }
    catch(e) {
      print("Remove shoe from cart failed");
      e.printError();
    }
  }

  Future<void> addShoeInCart(CartItemData cartItem) async {
    try {
      cartItem.amount += 1;
      await CartDataFirebase.instance().updateShoeInCart(cartItem);
      shoeCartList.refresh();
      sumCartTotalPrice();
    }
    catch(e) {
      print("Remove shoe from cart failed");
      e.printError();
    }
  }

  Future<void> minusShoeInCart(CartItemData cartItem) async {
    try {
      cartItem.amount -= 1;
      if (cartItem.amount > 0) {
        await CartDataFirebase.instance().updateShoeInCart(cartItem);
        shoeCartList.refresh();
        sumCartTotalPrice();
      }
      else {
        removeShoeFromCart(cartItem);
      }
    }
    catch(e) {
      print("Remove shoe from cart failed");
      e.printError();
    }
  }

  void sumCartTotalPrice() {
    double sum = 0.0;
    for (var item in shoeCartList.value!) {
      sum += searchShoeById(item.shoeId)!.price!;
    }
    cartTotalPrice.value = sum;
  }
}
