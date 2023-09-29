import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/email_verification_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/otp_verification_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/special_product_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings
{
  @override
  void dependencies() {
    Get.put(OtpVerificationScreenController());
    Get.put(MainBottomNavScreenController());
    Get.put(EmailVerificationScreenController());
    Get.put(HomeSlidersController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
  }

}