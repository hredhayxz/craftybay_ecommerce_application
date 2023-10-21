import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/auth_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/product_review_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/create_review_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatefulWidget {
  final int productId;

  const ProductReviewScreen({super.key, required this.productId});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ProductReviewScreenController>()
          .getProductReviews(widget.productId);
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: 'Reviews', elevation: 1),
      ),
      body: GetBuilder<ProductReviewScreenController>(
          builder: (productReviewScreenController) {
        if (productReviewScreenController.getProductReviewInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: productReviewScreenController
                          .productReviewModel.data?.length ??
                      0,
                  itemBuilder: (BuildContext context, int index) {
                    return ReviewCard(
                      productReviewData: productReviewScreenController
                          .productReviewModel.data![index],
                    );
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
                  Text(
                    'Reviews (${productReviewScreenController.productReviewModel.data?.length ?? 0})',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                  InkWell(
                    onTap: () async {
                      await Get.find<ReadProfileController>().readProfileData();
                      if (AuthController.isLoggedIn) {
                        Get.to(() => CreateReviewScreen(
                              productId: widget.productId,
                            ));
                      } else {
                        Get.offAll(() => EmailVerificationScreen());
                      }
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
        );
      }),
    );
  }
}
