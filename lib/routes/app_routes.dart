part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const OTP = _Paths.OTP;
  static const ONBOARD_SCREEN = _Paths.ONBOARD_SCREEN;
  static const HOME = _Paths.HOME;
  static const MAIN = _Paths.MAIN;
  static const CART = _Paths.CART;
  static const FAVORITE = _Paths.FAVORITE;
  static const PROFILE = _Paths.PROFILE;
  static const ORDER = _Paths.ORDER;
  static const PRODUCT_DEATAILS = _Paths.PRODUCT_DEATAILS;
  static const VIEW_ALL = _Paths.VIEW_ALL;
  static const SEARCH_SCREEN = _Paths.SEARCH_SCREEN;
  static const NOTIFICATION_SCREEN = _Paths.NOTIFICATION_SCREEN;
  static const MY_CART_SCREEN = _Paths.MY_CART_SCREEN;
  static const PAYMENT_METHOD_SCREEN = _Paths.PAYMENT_METHOD_SCREEN;
  static const ADD_PAYMENT_METHOD = _Paths.ADD_PAYMENT_METHOD;
  static const ADD_SHPPING_ADDRESS = _Paths.ADD_SHPPING_ADDRESS;
  static const MY_REVIEW = _Paths.MY_REVIEW;
  static const SETTING_SCREEN = _Paths.SETTING_SCREEN;
  static const FILTER_SCREEN = _Paths.FILTER_SCREEN;
  static const PRODUCT_REVIEW_SCREEN = _Paths.PRODUCT_REVIEW_SCREEN;
  static const WRITE_REVIEW_SCREEN = _Paths.WRITE_REVIEW_SCREEN;
  static const SHIPPING_ADDRESS = _Paths.SHIPPING_ADDRESS;
  static const EDIT_SHIPPING_ADDRESS = _Paths.EDIT_SHIPPING_ADDRESS;
  static const MY_PRIFILE = _Paths.MY_PRIFILE;
  static const CAHANGE_PASSWORD = _Paths.CAHANGE_PASSWORD;
  static const EDIT_PROFILE_SCREEN = _Paths.EDIT_PROFILE_SCREEN;
  static const FILTER_SCREEN_V1 = _Paths.FILTER_SCREEN_V1;
  static const CATEGORY_VIEW = _Paths.CATEGORY_VIEW;
  static const ADMIN_SCREEN = _Paths.ADMIN_SCREEN;
  static const ADMIN_ALL_CATEGORY_VIEW = _Paths.ADMIN_ALL_CATEGORY_VIEW;
  static const ADMIN_ALL_PRODUCTS_VIEW = _Paths.ADMIN_ALL_PRODUCTS_VIEW;
  static const VIEW_DETAILS = _Paths.VIEW_DETAILS;
  static const MY_POSTS = _Paths.MY_POSTS;


}

abstract class _Paths {
  _Paths._();

  static const SPLASH_SCREEN = '/splash-screen';
  static const SIGN_IN = '/signIn-screen';
  static const SIGN_UP = '/signUp-screen';
  static const FORGOT_PASSWORD = "/forgot-screen";
  static const OTP = "/otp-screen";
  static const ADMIN_SCREEN = "/admin-screen";
  static const PRODUCT_DEATAILS = "/product_details-screen";
  static const ONBOARD_SCREEN = "/onboard-screen";
  static const HOME = "/home_screen";
  static const MAIN = "/main_screen";
  static const CART = "/cart_screen";
  static const FAVORITE = "/favorite_screen";
  static const VIEW_DETAILS = "/view_details_screen";
  static const MY_POSTS = "/my_posts_details_screen";
  static const PROFILE = "/profile_screen";
  static const ORDER = "/order_screen";
  static const CATEGORY_VIEW = "/category_view_screen";
  static const VIEW_ALL = "/view_all_screen";   ///View all it's properties screen
  static const SEARCH_SCREEN = "/search_screen";
  static const NOTIFICATION_SCREEN = "/notification_screen";
  static const MY_CART_SCREEN = "/my_cart_screen";
  static const PAYMENT_METHOD_SCREEN= "/payment_method_screen_v";
  static const ADD_PAYMENT_METHOD= "/add_payment_method_screen";
  static const ADD_SHPPING_ADDRESS= "/add_shopping_screen";
  static const MY_REVIEW= "/my_review_screen";
  static const SETTING_SCREEN= "/setting_screen";
  static const FILTER_SCREEN= "/filter_screen";
  static const PRODUCT_REVIEW_SCREEN= "/product_screen";
  static const WRITE_REVIEW_SCREEN= "/write_review_screen";
  static const FILTER_SCREEN_V1= "/filter_v1_screen";
  static const SHIPPING_ADDRESS= "/shipping_screen";
  static const EDIT_SHIPPING_ADDRESS= "/edit_shipping_screen";
  static const MY_PRIFILE= "/my_profile_screen";
  static const CAHANGE_PASSWORD= "/change_pass_screen";
  static const EDIT_PROFILE_SCREEN= "/edit_profile_screen";
  static const ADMIN_ALL_CATEGORY_VIEW= "/admin_Category_view_all_screen";
  static const ADMIN_ALL_PRODUCTS_VIEW= "/admin_Products_view_all_screen";

}
