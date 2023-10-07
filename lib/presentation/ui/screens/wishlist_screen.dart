import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavScreenController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            title: 'WishList', elevation: 1,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: const FittedBox(
                  //child: ProductCard(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}