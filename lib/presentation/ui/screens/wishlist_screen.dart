import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/wishlist_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/wishlist_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<WishListScreenController>().getWishlistProducts();
    });
    super.initState();
  }

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
            title: 'WishList',
            elevation: 1,
          ),
        ),
        body: GetBuilder<WishListScreenController>(
            builder: (wishListScreenController) {
          if (wishListScreenController.getWishListProductsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (wishListScreenController.wishListProductModel.data != null &&
              wishListScreenController.wishListProductModel.data!.isEmpty) {
            return const Center(
              child: Text('WishList is empty!'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              itemCount:
                  wishListScreenController.wishListProductModel.data?.length ??
                      0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                          productId: wishListScreenController
                              .wishListProductModel.data![index].productId!,
                        ));
                  },
                  child: FittedBox(
                    child: WishListProductCard(
                      productData: wishListScreenController
                          .wishListProductModel.data![index],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
