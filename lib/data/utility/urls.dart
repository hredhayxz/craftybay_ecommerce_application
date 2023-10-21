class Urls {
  Urls._();

  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String getHomeSliders = '$_baseUrl/ListProductSlider';

  static String getCategories = '$_baseUrl/CategoryList';
  static String getPopularProducts = '$_baseUrl/ListProductByRemark/popular';
  static String getSpecialProducts = '$_baseUrl/ListProductByRemark/special';
  static String getNewProducts = '$_baseUrl/ListProductByRemark/new';
  static String getCartProducts = '$_baseUrl/CartList';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String readProfile = '$_baseUrl/ReadProfile';
  static String productWishList = '$_baseUrl/ProductWishList';
  static String createProductReview = '$_baseUrl/CreateProductReview';
  static String createInvoice = '$_baseUrl/InvoiceCreate';

// static String getProductsByRemarks(String remarks) =>
//     '$_baseUrl/ListProductByRemark/$remarks';
  static String getProductDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';

  static String getProductListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String deleteCartProduct(int productId) =>
      '$_baseUrl/DeleteCartList/$productId';

  static String deleteWishlistProduct(int productId) =>
      '$_baseUrl/RemoveWishList/$productId';

  static String setProductInWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';

  static String getReviews(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';
}
