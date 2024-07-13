import 'dart:developer';
import 'package:to_let_mobile_app/common/widgets/error_message.dart';
import 'package:to_let_mobile_app/common/widgets/success_message.dart';
import 'package:to_let_mobile_app/models/auth/model/error_model.dart';
import 'package:to_let_mobile_app/network/network_client.dart';
import 'package:to_let_mobile_app/routes/app_pages.dart';
import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:to_let_mobile_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/categories_model.dart';
import '../model/category_filter_model.dart';
import '../model/filter_view_model.dart';
import '../model/popular_products.dart';

class HomeController extends GetxController with StateMixin {
  final isSignInLoading = false.obs;
  final isSignUpLoading = false.obs;
  final isAddToCartLoading = false.obs;
  final isFilterLoading = false.obs;
  final isFilterCategoryLoading = false.obs;
  final isSelectCategory = 0.obs;


  CategoriesModel categoriesModel = CategoriesModel();
  PopularProduct popularProduct = PopularProduct();
  FilterViewModel filterViewModel = FilterViewModel();
  CategoryFilterModel categoryFilterModel = CategoryFilterModel();

  Future getCategory() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.CATEGORY_LIST,
      );
      if (response.hasError) {
        logErrorMessage(logName: "category", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "category", response: response);
        log("Category ==> ${response.body}");
        change(null, status: RxStatus.success());
        categoriesModel = CategoriesModel.fromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }

  Future getProducts() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.POPULAR_PRODUCT,
      );
      if (response.hasError) {
        logErrorMessage(logName: "products", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "");
      } else {
        logSuccessMessage(logName: "products", response: response);
        log("products ==> ${response.body}");
        change(null, status: RxStatus.success());
        popularProduct = PopularProduct.fromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }

  Future getAddToCartList() async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.ADD_TO_CART_LIST,
      );
      if (response.hasError) {
        logErrorMessage(logName: "addToCart List", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "Unauthorized");
      } else {
        logSuccessMessage(logName: "addToCart List", response: response);
        log("addToCart List ==> ${response.body}");
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }


  Future deletedAddToCartList({id}) async {
    change(null, status: RxStatus.loading());

    try {
      Response response = await NetworkClient().getRequest(
        Api.DELETED_TO_CART+id,
      );
      if (response.hasError) {
        logErrorMessage(logName: "deletedAddToCart", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ?? "Unauthorized");
      } else {
        logSuccessMessage(logName: "deletedAddToCart", response: response);
        log("deletedAddToCart ==> ${response.body}");
        change(null, status: RxStatus.success());
        getAddToCartList();
        showSuccessMessage(
            message: ErrorModel.fromJson(response.body).message ??
                AppString.text_cart_deleted_succesful.tr);
      }
    } catch (e) {
      log(e.toString());
      return Future.error(ErrorModel(message: e.toString()));
    }
    change(null, status: RxStatus.success());
  }


  Future<void> addToCart({id, drc, price, qty}) async {
    isAddToCartLoading(true);
    try {
      Response response = await NetworkClient().postRequest(Api.ADD_TO_CART, {
        'product_id': id.toString(),
        'product_specification': drc.toString(),
        'price': price.toString(),
        'qty': qty.toString(),
        'email': GetStorage().read(AppString.USER_EMAIL),
      });

      if (response.hasError) {
        logErrorMessage(logName: "addToCart", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ??
                "Something wong");
      } else {
        logSuccessMessage(logName: "addToCart", response: response);
        showSuccessMessage(
            message: ErrorModel.fromJson(response.body).message ??
                AppString.text_cart_add_succesful.tr);
        Get.back();
        log("addToCart==> ${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
    isAddToCartLoading(false);
  }


  Future<void> filter({value}) async {
    isFilterLoading(true);
    try {
      Response response = await NetworkClient().postRequest(Api.FILTER, {
        'filter': value,

      });

      if (response.hasError) {
        logErrorMessage(logName: "filter", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ??
                "Something wong");
      } else {
        logSuccessMessage(logName: "filter", response: response);
        Get.back();
        filterViewModel = FilterViewModel.fromJson(response.body);
        log("filter==> ${response.body}");
        Get.toNamed(Routes.FILTER_SCREEN_V1);

      }
    } catch (e) {
      log(e.toString());
    }
    isFilterLoading(false);
  }

  Future<void> filterOfCategory({index}) async {
    isFilterCategoryLoading(true);

    try {
      Response response = await NetworkClient().postRequest(Api.FILTER_CATEGORY, {
        'filter': "$index",
      });

      log(response.body.toString(),error: 1);

      if (response.hasError) {
        logErrorMessage(logName: "category-filter", response: response);
        showErrorMessage(
            message: ErrorModel.fromJson(response.body).message ??
                "Something wong");
      } else {
        logSuccessMessage(logName: "category-filter", response: response);
        Get.back();
        categoryFilterModel = CategoryFilterModel.fromJson(response.body);
        log("category-filter==> ${response.body}");
        Get.toNamed(Routes.CATEGORY_VIEW);

      }
    } catch (e) {
      log(e.toString());
    }
    isFilterCategoryLoading(false);
  }


}
