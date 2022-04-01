import 'package:lingowall/Core/model/auth_model.dart';
import 'package:lingowall/Core/model/base_response.dart';
import 'package:lingowall/Core/http_service.dart';
import 'dart:convert';

class LoginService {
  HttpService service = HttpService().init();

  Future<AuthModel> login(String email, String password) async {
    final result = await service.request(
      url: "/user/authentication",
      method: Method.POST,
      params: {"email": email, "password": password},
    );

    final data = BaseResponseModel<AuthModel>.fromJson(json.decode(result.toString()), (data) => AuthModel.fromJson(data));
    if (data.success) {
      return data.result!;
    } else {
      throw data.error;
    }
  }


  Future<String> updateOneSignalID(String oneSignalID) async {
    final result = await service.request(
      url: "/user",
      method: Method.PUT,
      params: {"onesignal_id": oneSignalID},
    );

    final data = BaseResponseModel<String>.onlyJsonParse(json.decode(result.toString()));
    if (data.success) {
      return data.result!;
    } else {
      throw data.error;
    }
  }
}
