import 'package:craftybay_ecommerce_application/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_product_list_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/special_product_controller.dart';
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
              GetBuilder<HomeSlidersController>(
                  builder: (homeSliderController) {
                if (homeSliderController.getHomeSlidersInProgress) {
                  return const SizedBox(
                    height: 180.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: homeSliderController.sliderModel.data ?? [],
                );
              }),
              SectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavScreenController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 90,
                child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                  if (categoryController.getCategoriesInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount:
                          categoryController.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await Get.find<CategoryProductListController>()
                                .getProductsByCategory(index + 1);
                            Get.to(() => ProductListScreen(
                                productData:
                                    Get.find<CategoryProductListController>()
                                            .productModel
                                            .data ??
                                        [],
                                remarkName: categoryController.categoryModel
                                        .data![index].categoryName ??
                                    ''));
                          },
                          child: CategoryCard(
                            categoryData:
                                categoryController.categoryModel.data![index],
                          ),
                        );
                      });
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to(() => ProductListScreen(
                        productData: Get.find<PopularProductController>()
                                .popularProductModel
                                .data ??
                            [],
                        remarkName: 'Popular',
                      ));
                },
              ),
              GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                if (popularProductController.getPopularProductsInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ProductListView(
                    productData:
                        popularProductController.popularProductModel.data ??
                            []);
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(() => ProductListScreen(
                        productData: Get.find<SpecialProductController>()
                                .specialProductModel
                                .data ??
                            [],
                        remarkName: 'Special',
                      ));
                },
              ),
              GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                if (specialProductController.getSpecialProductsInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ProductListView(
                    productData:
                        specialProductController.specialProductModel.data ??
                            []);
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to(() => ProductListScreen(
                        productData: Get.find<NewProductController>()
                                .newProductModel
                                .data ??
                            [],
                        remarkName: 'New',
                      ));
                },
              ),
              GetBuilder<NewProductController>(builder: (newProductController) {
                if (newProductController.getNewProductsInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ProductListView(
                    productData:
                        newProductController.newProductModel.data ?? []);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
