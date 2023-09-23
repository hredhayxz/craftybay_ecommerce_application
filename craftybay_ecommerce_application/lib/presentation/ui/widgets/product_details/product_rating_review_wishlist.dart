import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductRatingReviewWishList extends StatelessWidget {
  const ProductRatingReviewWishList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '4.5',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const ProductReviewScreen());
          },
          child: Text(
            'Reviews',
            style: TextStyle(
                fontSize: 15,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        Card(
          color: AppColors.primaryColor,
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.favorite_border,
              size: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
