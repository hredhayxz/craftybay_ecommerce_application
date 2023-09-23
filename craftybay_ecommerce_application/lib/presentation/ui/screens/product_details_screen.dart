import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/product_image_slider.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/product_name_with_stepper.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/product_rating_review_wishlist.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/select_product_color.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/section_title.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/select_product_size.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_details/bottom_nav_card.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];

  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  ProductImageSlider(),
                  const CustomAppBar(
                    title: 'Product Details',
                    elevation: 0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductNameWithStepper(),
                    const ProductRatingReviewWishList(),
                    SelectProductColor(
                        colors: colors,
                        onSelected: (int selectedColor) {
                          _selectedColorIndex = selectedColor;
                        },
                        initialSelected: 0),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectProductSize(
                        sizes: sizes,
                        onSelected: (int selectedSize) {
                          _selectedSizeIndex = selectedSize;
                        },
                        initialSelected: 0),
                    const SizedBox(
                      height: 16,
                    ),
                    const SectionTitle(title: 'Description'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                              '''),
                  ],
                ),
              ),
            ),
            const BottomNavCard(
              price: '\$1000',
            ),
          ],
        ),
      ),
    );
  }
}
