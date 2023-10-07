import 'dart:developer';

import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/cart_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/cart_product_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<CartScreenController>().getCartProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavScreenController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: 'Cart',
            elevation: 1,
          ),
        ),
        body: Column(
          children: [
            GetBuilder<CartScreenController>(builder: (cartScreenController) {
              if (cartScreenController.getCartProductsInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount:
                      cartScreenController.cartListModel.data!.length ?? 0,
                  itemBuilder: (context, index) {
                    return CartProductCard(
                      cartListData:
                          cartScreenController.cartListModel.data![index],
                    );
                  },
                ),
              );
            }),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$1000',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
