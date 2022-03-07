import 'package:lingowall/Core/model/auth_model.dart';
import 'package:lingowall/Core/model/base_response.dart';
import 'package:lingowall/Core/http_service.dart' as HTTP;
import 'dart:convert';

class LoginService {
  HTTP.HttpService service = HTTP.HttpService();

  Future<AuthModel> login(String email, String password) async {
    final result = await service.request(
      url: "/user/authentication",
      method: HTTP.Method.POST,
      params: {"email": email, "password": password},
    );

    final data = BaseResponseModel<AuthModel>.fromJson(json.decode(result.toString()), (data) => AuthModel.fromJson(data));
    if (data.success) {
      return data.result!;
    } else {
      throw data.error;
    }
  }
}
