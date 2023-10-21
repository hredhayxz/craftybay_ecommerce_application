import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class DeleteWishListProductController extends GetxController {
  String _message = '';

  String get message => _message;

  Future<bool> deleteWishlistProduct(int productId) async {
    final NetworkResponse response = await NetworkCaller()
        .getRequest(Urls.deleteWishlistProduct(productId), isLogin: true);
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Delete wish list product failed!';
      return false;
    }
  }
}
