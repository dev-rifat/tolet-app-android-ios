import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:get_storage/get_storage.dart';

class Api {
  Api._();
  static String baseUrl = "https://to-let.property.nexgen-labs.xyz/api";
  static String imagePublicKey = "https://to-let.property.nexgen-labs.xyz/public/property/";
  static String logIn = "/login";
  static String signUp = "/register";

  static String divisionList = "/division/list";
  static String cityList = "/city/list";
  static String districtList = "/district/list";

  static String categoryList = "/category/list";
  static String propertiesList = "/category-property/list";
  static String searchPostList = "/property/search?query=";
  static String propertyDetails = "/property/show/";
  static String createPost = "/property/add";
  static String myPost = "/my-property-list";
  static String userChangeProfileImg = "/change-image";
  static String nearByPostList = "/property/list";
  static String bestForYou = "/property/bestforyou";





















  static String FORGOT = "/forget-password";
  static String PROFLE = "/profile/show?id=";
  static String EDIT_ROFIEL = "/user/profile/";
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
