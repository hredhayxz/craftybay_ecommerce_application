import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/cart_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/special_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/cart_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/category_list_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/home_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    WishListScreen(),
    CartScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<HomeSlidersController>().getHomeSliders();
      await Get.find<CategoryController>().getCategories();
      await Get.find<PopularProductController>().getPopularProducts();
      await Get.find<SpecialProductController>().getSpecialProducts();
      await Get.find<NewProductController>().getNewProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavScreenController>(
        builder: (mainBottomNavScreenController) {
      return Scaffold(
        body: _screens[mainBottomNavScreenController.currentSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainBottomNavScreenController.currentSelectedIndex,
          onTap: mainBottomNavScreenController.changeScreen,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart'),
          ],
        ),
      );
    });
  }
}
