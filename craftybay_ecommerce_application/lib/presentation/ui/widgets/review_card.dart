import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.primaryColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              SectionTitle(
                title: 'Md Alhaz Mondal Hredhay',
                icon: Icons.person,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Afcjfjytttrffffffffffffffffffffffffffffffffffffffffffffffffjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkffccccccccccccccccccccccccccccccccccccccccccccccccccccccccjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjfbmnnnnnnffffffnnnnncn',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
