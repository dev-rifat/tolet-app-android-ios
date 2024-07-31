import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:get_storage/get_storage.dart';

class Api {
  Api._();
  static String BASE_URL = "https://to-let.property.nexgen-labs.xyz/api";
  static String LOG_IN = "/login";
  static String DIVISION_LIST = "/division/list";









  static String RESISTER = "/register";
  static String FORGOT = "/forget-password";
  static String PROFLE = "/user/profile/";
  static String EDIT_ROFIEL = "/user/profile/";
  static String CATEGORY_LIST = "/categories";
  static String POPULAR_PRODUCT = "/products";
  static String WISH_LIST = "/user/wishlist/";
  static String ADD_tO_WISH_LIST = "/user/wishlist";
  static String ADD_TO_CART = "/user/carts";
  static String FILTER_CATEGORY = "/filter-category";
  static String DELETED_TO_CART = "/user/delete-carts/";

  static String ADD_TO_CART_LIST =
      "/user/carts/${GetStorage().read(AppString.USER_EMAIL)}";
  static String FILTER = "/filter";

  static String ADD_CATEGORY_ADMIN = "/admin/add-category?";
  static String DELETED_CATEGORY_ADMIN = "/admin/delete-category/";
  static String UPDATE_CATEGORY_ADMIN = "/admin/update-category/";
  static String ADD_PRODUCT_ADMIN = "/admin/add-product";
  static String DELETED_PRODUCT_ADMIN = "/admin/delete-product/";



}
