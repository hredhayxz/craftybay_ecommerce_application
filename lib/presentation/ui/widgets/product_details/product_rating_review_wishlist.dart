import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/data/models/product_details_model.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/create_wishlist_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRatingReviewWishList extends StatelessWidget {
  final ProductDetailsData productDetailsData;

  const ProductRatingReviewWishList(
      {super.key, required this.productDetailsData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '${productDetailsData.product?.star ?? 0}',
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(() => ProductReviewScreen(productId: productDetailsData.productId!,));
          },
          child: Text(
            'Reviews',
            style: TextStyle(
                fontSize: 15,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        GetBuilder<CreateWishListController>(
            builder: (createWishListController) {
          return Card(
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () async {
                  await setThisProductInWishlist(createWishListController);
                },
                child: const Icon(
                  Icons.favorite_border,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  Future<void> setThisProductInWishlist(
      CreateWishListController createWishListController) async {
    final response = await createWishListController
        .setProductInWishList(productDetailsData.productId!);
    if (response) {
      Get.snackbar('Success', 'Add wishlist successfully.',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Failed', 'Add wishlist failed! Try again',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
