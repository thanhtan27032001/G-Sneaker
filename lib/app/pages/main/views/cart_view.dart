import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsneaker/app/components/cart_item.dart';
import 'package:gsneaker/app/configs/app_colors.dart';
import 'package:gsneaker/app/configs/app_text_style.dart';
import 'package:gsneaker/app/pages/main/main_controller.dart';
import 'package:gsneaker/domain/cart_item_data.dart';

class CartView extends GetView {
  CartView({super.key});

  @override
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.whiteColor(),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 16, bottom: 8),
              child: Image.asset(
                "/images/nike.png",
                height: 28,
                fit: BoxFit.fitWidth,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Text(
                  "Your cart",
                  style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: AppTextStyle.fontSizeHeading3,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor()),
                ),
                const Spacer(),
                Obx(() {
                  return Text(
                    "\$${controller.cartTotalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontFamily: "Rubik",
                        fontSize: AppTextStyle.fontSizeHeading3,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor()),
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.shoeCartList.value == null || controller.shoeCartList.value!.isEmpty) {
                return const Text("Your cart is empty");
              }
              else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    CartItemData cartItemData = controller.shoeCartList.value![index];
                    return CartItem(
                      shoe: controller.searchShoeById(controller.shoeCartList.value![index].shoeId)!,
                      cartItem: cartItemData,
                      onRemoveItemButtonClick: () => controller.removeShoeFromCart(cartItemData),
                      onAddItemButtonClick: () => controller.addShoeInCart(cartItemData),
                      onMinusItemButtonClick: () => controller.minusShoeInCart(cartItemData),
                    );
                  },
                  itemCount: controller.shoeCartList.value?.length,
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
