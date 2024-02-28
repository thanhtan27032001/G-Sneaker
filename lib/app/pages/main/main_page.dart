import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsneaker/app/pages/main/main_controller.dart';
import 'package:gsneaker/app/pages/main/views/cart_view.dart';
import 'package:gsneaker/app/pages/main/views/product_view.dart';

class MainPage extends GetView<MainController> {
  MainPage({super.key});

  @override
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductView(),
            const SizedBox(
              width: 50,
            ),
            CartView(),
          ],
        ),
      ),
    );
  }
}
