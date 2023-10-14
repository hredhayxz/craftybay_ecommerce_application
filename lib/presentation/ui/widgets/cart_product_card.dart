import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/data/models/cart_list_model.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/cart_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/delete_cart_list_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final CartListData cartListData;
  const CartProductCard({
    super.key, required this.cartListData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80'))),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             const Text(
                               'Nike vswyhetdjhjnfcj Yeah...',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12),
                                children: [
                                  TextSpan(text: 'Color: ${cartListData.color} '),
                                  TextSpan(text: 'Size: ${cartListData.size}'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await deleteCartProduct(cartListData.productId!);
                          },
                          icon: const Icon(Icons.delete_outline))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$100',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 85,
                        child: FittedBox(
                          child: CustomStepper(
                            lowerLimit: 1,
                            upperLimit: 20,
                            stepValue: 1,
                            value: 1,
                            onChange: (int value) {},
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> deleteCartProduct(int productId) async {
    final response = await Get.find<DeleteCartListProductController>().deleteCartProduct(productId);
    if (response) {
      Get.snackbar('Success', 'Product delete successful.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      Get.find<CartScreenController>().getCartProducts();
    } else {
      Get.snackbar('Failed', 'Product delete failed! Try again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
