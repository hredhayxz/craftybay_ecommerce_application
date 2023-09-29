import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/popular_product_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductsInProgress = false;
  PopularProductModel _popularProductModel = PopularProductModel();
  String _errorMessage = '';

  bool get getPopularProductsInProgress => _getPopularProductsInProgress;

  PopularProductModel get popularProductModel => _popularProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getPopularProducts() async {
    _getPopularProductsInProgress = true;
    update();
    // final NetworkResponse response =
    // await NetworkCaller().getRequest(Urls.getProductsByRemarks('popular'));
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getPopularProducts);
    _getPopularProductsInProgress = false;
    if (response.isSuccess) {
      _popularProductModel = PopularProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetch failed! Try again.';
      update();
      return false;
    }
  }
}