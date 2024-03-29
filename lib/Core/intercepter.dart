import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'package:get/get.dart' as Get;
import 'package:lingowall/UI/Login/login_widget.dart';
import 'package:lingowall/UI/login/login_view.dart';

class Intercepter {

  static dynamic requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) {
    String token = UserPreferences.instance.getUserToken();
    options.headers.addAll({"token":token});
    print(options.data);
    return handler.next(options);
  }

  static responseInterceptor(Response response,  ResponseInterceptorHandler handler) async {

    print(response.realUri);
    print(response.data);
    if (response.statusCode == 401) {
      EasyLoading.dismiss();
      UserPreferences.instance.setUserToken("");
      Get.Get.offAll(LoginWidget());
    }
    return handler.next(response);
  }

  static errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) async {
    print(dioError.error);
    return handler.next(dioError);
  }


}