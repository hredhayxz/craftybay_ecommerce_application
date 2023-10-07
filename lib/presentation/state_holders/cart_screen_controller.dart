import 'package:craftybay_ecommerce_application/data/models/cart_list_model.dart';
import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  bool _getCartProductsInProgress = false;
  CartListModel _cartListModel = CartListModel();
  String _message = '';

  CartListModel get cartListModel => _cartListModel;

  bool get getCartProductsInProgress => _getCartProductsInProgress;

  String get message => _message;

  Future<bool> getCartProducts() async {
    _getCartProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getCartProducts);
    _getCartProductsInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Cart list data fetch failed!';
      update();
      return false;
    }
  }
}
