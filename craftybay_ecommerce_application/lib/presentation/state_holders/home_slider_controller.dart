import 'package:craftybay_ecommerce_application/data/models/network_response.dart';
import 'package:craftybay_ecommerce_application/data/models/slider_model.dart';
import 'package:craftybay_ecommerce_application/data/services/network_caller.dart';
import 'package:craftybay_ecommerce_application/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSlidersController extends GetxController {
  bool _getHomeSlidersInProgress = false;
  SliderModel _sliderModel = SliderModel();
  String _message = '';

  SliderModel get sliderModel => _sliderModel;

  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;

  String get message => _message;

  Future<bool> getHomeSliders() async {
    _getHomeSlidersInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getHomeSliders);
    _getHomeSlidersInProgress = false;
    if (response.isSuccess) {
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Sliders data fetch failed!';
      update();
      return false;
    }
  }
}