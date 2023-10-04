import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/custom_stepper.dart';
import 'package:flutter/material.dart';

class ProductNameWithStepper extends StatelessWidget {
  final String productTitle;

  const ProductNameWithStepper({
    super.key,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          productTitle ?? '',
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.5),
        )),
        CustomStepper(
            lowerLimit: 1,
            upperLimit: 10,
            stepValue: 1,
            value: 1,
            onChange: (newValue) {
              print(newValue);
            })
      ],
    );
  }
}
