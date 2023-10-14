import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/wishlist_product_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListScreenController extends GetxController {
  bool _getWishListProductsInProgress = false;
  WishListProductModel _wishListProductModel = WishListProductModel();
  String _errorMessage = '';

  bool get getWishListProductsInProgress => _getWishListProductsInProgress;

  WishListProductModel get wishListProductModel => _wishListProductModel;

  String get errorMessage => _errorMessage;

  Future<bool> getWishlistProducts() async {
    _getWishListProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.productWishList, isLogin: true);
    _getWishListProductsInProgress = false;
    if (response.isSuccess) {
      _wishListProductModel =
          WishListProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'WishList product fetch failed! Try again.';
      update();
      return false;
    }
  }
}
