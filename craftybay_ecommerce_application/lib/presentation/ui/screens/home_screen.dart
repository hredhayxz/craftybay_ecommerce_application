import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/category_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/home/home_slider.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/home/home_screen_appbar_title.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_listview.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/home/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const HomeScreenAppbarTitle(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HomeSlider(),
              SectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavScreenController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const ProductListScreen());
                        },
                        child: const CategoryCard(),
                      );
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              const ProductListView(),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              const ProductListView(),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'New',
                onTap: () {},
              ),
              const ProductListView(),
            ],
          ),
        ),
      ),
    );
  }
}
