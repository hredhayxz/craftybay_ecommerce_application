import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/create_review_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: 'Reviews', elevation: 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const ReviewCard();
                },
              ),
            ),
          ),
          Container(
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
                const Text(
                  'Reviews (1000)',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black54),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const CreateReviewScreen());
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                      weight: 50,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
