import 'package:craftybay_ecommerce_application/data/models/product_model.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_product_list_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/screens/product_details_screen.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/product_card.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductListScreen extends StatefulWidget {
  final int categoryId;
  final String remarkName;

  const CategoryProductListScreen(
      {super.key, required this.categoryId, required this.remarkName});

  @override
  State<CategoryProductListScreen> createState() =>
      _CategoryProductListScreenState();
}

class _CategoryProductListScreenState extends State<CategoryProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<CategoryProductListController>()
          .getProductsByCategory(widget.categoryId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: widget.remarkName ?? '',
          elevation: 1,
        ),
      ),
      body: GetBuilder<CategoryProductListController>(
          builder: (categoryProductListController) {
        List<ProductData> productData =
            categoryProductListController.productModel.data ?? [];
        if (categoryProductListController.getCategoryProductsListInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return productData.isEmpty
            ? const Center(
                child: Text('No data available!'),
              )
            : Padding(
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
                        Get.to(() => ProductDetailsScreen(
                              productId: productData[index].id!,
                            ));
                      },
                      child: FittedBox(
                        child: ProductCard(
                          productData: productData[index],
                        ),
                      ),
                    );
                  },
                ),
              );
      }),
    );
  }
}
