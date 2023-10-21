import 'package:craftybay_ecommerce_application/presentation/state_holders/create_review_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/product_review_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatelessWidget {
  final int productId;

  CreateReviewScreen({super.key, required this.productId});

  final TextEditingController _reviewTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _rating = 0;

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
                    controller: _reviewTEController,
                    maxLines: 8,
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
                    height: 12,
                  ),
                  RatingBar.builder(
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                      _rating = rating; // Update the rating variable
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
                                .createReview(_reviewTEController.text.trim(),
                                    productId, _rating)
                                .then((result) {
                              if (result) {
                                Get.snackbar(
                                    'Success', 'Add review successful.',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    snackPosition: SnackPosition.BOTTOM);
                                Get.find<ProductReviewScreenController>()
                                    .getProductReviews(productId);
                                Navigator.pop(context);
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
