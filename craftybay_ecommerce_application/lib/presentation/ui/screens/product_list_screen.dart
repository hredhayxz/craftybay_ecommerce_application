import 'package:craftybay_ecommerce_application/data/models/product_data.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  final List<ProductData> productData;
  final String remarkName;

  const ProductListScreen(
      {super.key, required this.productData, required this.remarkName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: remarkName ?? '',
          elevation: 1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          itemCount: productData.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailsScreen());
              },
              child: FittedBox(
                child: ProductCard(
                  productData: productData[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
