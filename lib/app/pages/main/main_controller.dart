import 'package:get/get.dart';
import 'package:gsneaker/data/cart_data_2.dart';
import 'package:gsneaker/data/product_data.dart';
import 'package:gsneaker/domain/cart_item.dart';
import 'package:gsneaker/domain/shoe.dart';

class MainController extends GetxController {
  Rxn<List<Shoe>> shoeProductList = Rxn();
  Rxn<List<CartItem>> shoeCartList = Rxn();
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
    // shoeCartList.value = await CartData.instance().getAllShoeInCart();
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
    CartItem cartItem = CartItem(shoe.id!, 1);
    // try {
    //   CartData.instance().updateShoeInCart(cartItem);
    //   shoeCartList.value?.add(cartItem);
    //   shoeCartList.refresh();
    // }
    // catch(e) {
    //   print("Add shoe to cart failed");
    //   e.printError();
    // }

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

    // if (cartItem.amount > 1) {
    //   CartDataFirebase.instance().updateShoeInCart(cartItem);
    // }
    // else {
    //   cartItem.id = await CartDataFirebase.instance().addShoeToCart(cartItem);
    //   shoeCartList.value?.add(cartItem);
    //   shoeCartList.refresh();
    // }
  }

  updateCartStatus(){

  }

  void sumCartTotalPrice() {
    double sum = 0.0;
    for (var item in shoeCartList.value!) {
      sum += searchShoeById(item.shoeId)!.price!;
    }
    cartTotalPrice.value = sum;
  }
}
