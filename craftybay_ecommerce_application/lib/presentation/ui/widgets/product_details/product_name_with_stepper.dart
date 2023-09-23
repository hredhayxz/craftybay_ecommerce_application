import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/custom_stepper.dart';
import 'package:flutter/material.dart';

class ProductNameWithStepper extends StatelessWidget {
  const ProductNameWithStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Text(
          'Addidas Shoe HK23454 - Black Edition',
          style: TextStyle(
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
