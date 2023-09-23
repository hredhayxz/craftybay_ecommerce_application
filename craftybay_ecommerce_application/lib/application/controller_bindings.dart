import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/otp_verification_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put(OtpVerificationScreenController());
    Get.put(MainBottomNavScreenController());
  }

}