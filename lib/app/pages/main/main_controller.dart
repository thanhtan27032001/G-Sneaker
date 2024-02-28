import 'package:get/get.dart';
import 'package:gsneaker/data/product_data.dart';
import 'package:gsneaker/domain/shoe.dart';

class MainController extends GetxController {
  Rxn<List<Shoe>> shoeProductList = Rxn();
  Rxn<List<Shoe>> shoeCartList = Rxn();

  @override
  void onInit() {
    super.onInit();
    getAllProductItem();
    getAllCartItem();
  }

  Future<void> getAllProductItem() async {
    shoeProductList.value = await ProductData.instance().readShoeList();
  }

  void getAllCartItem() {
    shoeCartList.value = [];
    for (int i=0; i<3; i++) {
      shoeCartList.value?.add(
        Shoe(
            name: "Nike Air Zoom Pegasus 36",
            description:
            "The iconic Nike Air Zoom Pegasus 36 offers more cooling "
                "and mesh that targets breathability across high-heat areas. "
                "A slimmer heel collar and tongue reduce bulk, "
                "while exposed cables give you a snug fit at higher speeds.",
            image:
            "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/air-zoom-pegasus-36-mens-running-shoe-wide-D24Mcz-removebg-preview.png",
            color: "#e1e7ed"),
      );
    }
  }
}
