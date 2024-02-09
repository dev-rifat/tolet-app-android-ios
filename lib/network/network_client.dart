import 'package:to_let_mobile_app/utils/api_endpoints.dart';
import 'package:to_let_mobile_app/utils/app_string.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

String _getRequestUrl(String apiEndPoint) => Api.BASE_URL + apiEndPoint;

class NetworkClient extends GetConnect {
  Future<Response> getRequest(String apiEndPoint) async {
    return await get(_getRequestUrl(apiEndPoint), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": GetStorage().read(AppString.ACCESS_TOKEN) != null
          ? "Bearer ${GetStorage().read(AppString.ACCESS_TOKEN)}"
          : ""
    }).timeout(const Duration(seconds: 15));
  }

  Future<Response> postRequest(String apiEndPoint, dynamic body) async {
    Response response = await post(_getRequestUrl(apiEndPoint), body, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": GetStorage().read(AppString.ACCESS_TOKEN) != null
          ? "Bearer ${GetStorage().read(AppString.ACCESS_TOKEN)}"
          : ""
    }).timeout(const Duration(seconds: 15));
    return response;
  }

}
