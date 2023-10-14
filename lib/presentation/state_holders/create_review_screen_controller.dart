import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateReviewScreenController extends GetxController {
  bool _createReviewInProgress = false;
  String _message = '';

  bool get createReviewInProgress => _createReviewInProgress;

  String get message => _message;

  Future<bool> createReview(String description, int productId) async {
    _createReviewInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.createProductReview, {
      "description":description,
      "product_id":productId
    });
    _createReviewInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Create review failed! Try again';
      return false;
    }
  }
}
