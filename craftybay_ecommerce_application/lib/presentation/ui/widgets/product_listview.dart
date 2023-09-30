import 'package:craftybay_ecommerce_application/data/models/product_model.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  final List<ProductData> productData;

  const ProductListView({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productData.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductDetailsScreen());
            },
            child: ProductCard(productData: productData[index],),
          );
        },
      ),
    );
  }
}
