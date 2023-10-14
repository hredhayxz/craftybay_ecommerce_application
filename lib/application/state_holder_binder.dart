import 'package:craftybay_ecommerce_application/presentation/state_holders/add_to_cart_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/create_profile_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/email_verification_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/otp_verification_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/auth/read_profile_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/cart_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/category_product_list_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/create_review_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/create_wishlist_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/delete_cart_list_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/main_bottom_nav_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/product_details_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/product_review_screen_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/special_product_controller.dart';
import 'package:craftybay_ecommerce_application/presentation/state_holders/wishlist_screen_controller.dart';
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
    Get.put(ProductDetailsScreenController());
    Get.put(AddToCartController());
    Get.put(CategoryProductListController());
    Get.put(CartScreenController());
    Get.put(CreateProfileScreenController());
    Get.put(ReadProfileController());
    Get.put(DeleteCartListProductController());
    Get.put(WishListScreenController());
    Get.put(CreateWishListController());
    Get.put(ProductReviewScreenController());
    Get.put(CreateReviewScreenController());
  }

}