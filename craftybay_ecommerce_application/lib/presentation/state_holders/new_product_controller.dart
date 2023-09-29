import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/new_product_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  bool _getNewProductsInProgress = false;
  NewProductModel _newProductModel = NewProductModel();
  String _errorMessage = '';

  bool get getNewProductsInProgress => _getNewProductsInProgress;

  NewProductModel get newProductModel => _newProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getNewProducts() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getNewProducts);
    _getNewProductsInProgress = false;
    if (response.isSuccess) {
      _newProductModel =
          NewProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'New product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
