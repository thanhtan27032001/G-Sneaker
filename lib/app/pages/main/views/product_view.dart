import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsneaker/app/components/product_item.dart';
import 'package:gsneaker/app/configs/app_colors.dart';
import 'package:gsneaker/app/configs/app_text_style.dart';
import 'package:gsneaker/app/pages/main/main_controller.dart';
import 'package:gsneaker/domain/shoe.dart';

class ProductView extends GetView<MainController> {
  ProductView({super.key});

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
                "nike.png",
                height: 28,
                fit: BoxFit.fitWidth,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              "Out products",
              style: TextStyle(
                  fontFamily: "Rubik",
                  fontSize: AppTextStyle.fontSizeHeading3,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor()),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.shoeProductList.value != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ProductItem(
                      shoe: controller.shoeProductList.value![index],
                    );
                  },
                  itemCount: controller.shoeProductList.value?.length,
                );
              }
              return const Text("No item");
            }),
          ),
        ],
      ),
    );
  }

}