import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/data/models/product_review_model.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final ProductReviewData productReviewData;

  const ReviewCard({
    super.key,
    required this.productReviewData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title: productReviewData.profile?.cusName ?? '',
                icon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productReviewData.description ?? '',
                style: const TextStyle(color: Colors.black54, fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    productReviewData.rating.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: 30,
                    child: Image.asset(
                      productReviewData.rating.toString() == '5'
                          ? 'assets/images/full_star.png'
                          : 'assets/images/half_star.png',
                      height: 15,
                      width: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
