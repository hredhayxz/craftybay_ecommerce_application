import 'package:craftybay_ecommerce_application/data/models/cart_list_model.dart';
import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  bool _getCartProductsInProgress = false;
  CartListModel _cartListModel = CartListModel();
  String _message = '';
  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  CartListModel get cartListModel => _cartListModel;

  bool get getCartProductsInProgress => _getCartProductsInProgress;

  String get message => _message;

  Future<bool> getCartProducts() async {
    _getCartProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getCartProducts, isLogin: true);
    _getCartProductsInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseJson ?? {});
      _calculateTotalPrice();
      update();
      return true;
    } else {
      _message = 'Cart list data fetch failed!';
      update();
      return false;
    }
  }

  void changeItem(int cartProductId, int noOfItems) {
    _cartListModel.data
        ?.firstWhere((cartData) => cartData.productId == cartProductId)
        .qty = noOfItems.toString();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (CartListData data in _cartListModel.data ?? []) {
      _totalPrice += (int.parse(data.qty!) *
          (double.tryParse(data.product?.price ?? '0') ?? 0));
    }
    update();
  }
}

// Future<bool> removeFromCart(int id) async {
//   _getCartListInProgress = true;
//   update();
//   final NetworkResponse response = await NetworkCaller.getRequest(Urls.removeFromCart(id));
//   _getCartListInProgress = false;
//   if (response.isSuccess) {
//     _cartListModel.data?.removeWhere((element) => element.productId == id);
//     _calculateTotalPrice();
//     update();
//     return true;
//   } else {
//     _message = 'get cart list failed! Try again';
//     return false;
//   }
// }
