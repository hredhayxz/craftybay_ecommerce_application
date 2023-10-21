import 'dart:developer';

import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/data/models/product_details_model.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/add_to_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavCard extends StatelessWidget {
  const BottomNavCard(
      {super.key,
      required this.productDetailsData,
      required this.productColor,
      required this.productSize,
      required this.productQuantity});

  final ProductDetailsData productDetailsData;
  final String productColor;
  final String productSize;
  final int productQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                'Price',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                productDetailsData.product?.price.toString() ?? '0',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              if (addToCartController.addToCartInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ElevatedButton(
                onPressed: () {
                  addToCartController
                      .addToCart(productDetailsData.productId ?? 0,
                          productColor, productSize, productQuantity)
                      .then((result) {
                    log(productSize);
                    if (result) {
                      Get.snackbar('Success', 'Add to cart successful.',
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                          borderRadius: 10,
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      Get.snackbar('Failed', 'Add to cart failed! Try again.',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          borderRadius: 10,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  });
                },
                child: const Text('Add to cart'),
              );
            }),
          )
        ],
      ),
    );
  }
}
