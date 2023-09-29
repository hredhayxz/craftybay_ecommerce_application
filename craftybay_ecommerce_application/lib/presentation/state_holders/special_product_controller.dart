import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/special_product_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductsInProgress = false;
  SpecialProductModel _specialProductModel = SpecialProductModel();
  String _errorMessage = '';

  bool get getSpecialProductsInProgress => _getSpecialProductsInProgress;

  SpecialProductModel get specialProductModel => _specialProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProducts() async {
    _getSpecialProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getSpecialProducts);
    _getSpecialProductsInProgress = false;
    if (response.isSuccess) {
      _specialProductModel =
          SpecialProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Special product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
