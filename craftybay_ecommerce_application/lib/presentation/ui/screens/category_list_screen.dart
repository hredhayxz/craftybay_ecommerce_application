import 'package:craftybay_ecommerce_application/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_product_list_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/category_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

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
            title: 'Categories',
            elevation: 1,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Get.find<CategoryController>().getCategories();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                GetBuilder<CategoryController>(builder: (categoryController) {
              if (categoryController.getCategoriesInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                itemCount: categoryController.categoryModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
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
                    child: FittedBox(
                      child: CategoryCard(
                        categoryData:
                            categoryController.categoryModel.data![index],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
