import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateProfileScreenController extends GetxController {
  bool _completeProfileInProgress = false;
  String _message = '';

  bool get completeProfileInProgress => _completeProfileInProgress;

  String get message => _message;

  Future<bool> createProfile(String firstName, String lastName, String mobile,
      String city, String shippingAddress) async {
    _completeProfileInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createProfile, {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "city": city,
      "shippingAddress": shippingAddress
    });
    _completeProfileInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Complete profile failed! Try again';
      return false;
    }
  }
}
