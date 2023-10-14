import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/data/models/product_model.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/create_wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductData productData;

  const ProductCard({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 130,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(productData.image ?? ''))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    productData.title ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${productData.price ?? 0}',
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.amber,
                          ),
                          Text(
                            '${productData.star ?? 0}',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      GetBuilder<CreateWishListController>(
                          builder: (createWishListController) {
                        return Card(
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () async {
                                await setThisProductInWishlist(
                                    createWishListController);
                              },
                              child: const Icon(
                                Icons.favorite_border,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setThisProductInWishlist(
      CreateWishListController createWishListController) async {
    final response =
        await createWishListController.setProductInWishList(productData.id!);
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
