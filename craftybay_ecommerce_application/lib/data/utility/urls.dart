class Urls {
  Urls._();

  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getHomeSliders = '$_baseUrl/ListProductSlider';

  static String getCategories = '$_baseUrl/CategoryList';
  static String getPopularProducts = '$_baseUrl/ListProductByRemark/popular';
  static String getSpecialProducts = '$_baseUrl/ListProductByRemark/special';
  static String getNewProducts = '$_baseUrl/ListProductByRemark/new';

// static String getProductsByRemarks(String remarks) =>
//     '$_baseUrl/ListProductByRemark/$remarks';
}
