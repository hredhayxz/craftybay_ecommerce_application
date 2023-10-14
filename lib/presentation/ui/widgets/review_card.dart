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
                title:
                    '${productReviewData.profile?.firstName ?? ''} ${productReviewData.profile?.lastName ?? ''}',
                icon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productReviewData.description.toString() ?? '',
                style: const TextStyle(color: Colors.black54, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
