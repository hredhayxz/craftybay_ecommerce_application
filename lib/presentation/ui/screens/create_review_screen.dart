import 'package:craftybay_ecommerce_application/presentation/state_holders/create_review_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/product_review_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatelessWidget {
  final int productId;

  CreateReviewScreen({super.key, required this.productId});

  final TextEditingController _fNameTEController = TextEditingController();
  final TextEditingController _lNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: 'Create Review', elevation: 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _fNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      labelText: 'First Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _lNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _reviewTEController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      hintText: 'Write Review',
                      labelText: 'Write Review',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Please write your review';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CreateReviewScreenController>(
                        builder: (createReviewScreenController) {
                      if (createReviewScreenController.createReviewInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            createReviewScreenController
                                .createReview(
                                    _reviewTEController.text.trim(), productId)
                                .then((result) {
                              if (result) {
                                _fNameTEController.clear();
                                _lNameTEController.clear();
                                _reviewTEController.clear();
                                Get.snackbar(
                                    'Success', 'Add review successful.',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    snackPosition: SnackPosition.BOTTOM);
                                Navigator.pop(context);
                                Get.find<ProductReviewScreenController>()
                                    .getProductReviews(productId);
                              } else {
                                Get.snackbar(
                                    'Failed', 'Add review failed! Try again.',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            });
                          }
                        },
                        child: const Text('Submit'),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
