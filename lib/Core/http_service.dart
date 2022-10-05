import 'dart:io';
import 'package:dio/dio.dart';
import 'intercepter.dart';
enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = "https://gaeush4jpg.execute-api.us-east-1.amazonaws.com";

class HttpService {
  Dio _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: header(),
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      }));

  static header() => {"Content-Type": "application/json"};

  HttpService init() {
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
          onRequest: ( options,  handler) => Intercepter.requestInterceptor(options, handler),
          onResponse: ( response,  handler) => Intercepter.responseInterceptor(response, handler),
          onError: (dioError,  handler) => Intercepter.errorInterceptor(dioError, handler)),
    );
  }

  void setToken(String token) {
    _dio.options.headers["token"] = token;
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    if (method == Method.POST) {
      response = await _dio.post(url, data: params);
    } else if (method == Method.DELETE) {
      response = await _dio.delete(url, data: params);
    }else if (method == Method.PUT) {
      response = await _dio.put(url, data: params);
    } else if (method == Method.PATCH) {
      response = await _dio.patch(url, data: params);
    } else {
      response = await _dio.get(url, queryParameters: params);
    }

    if (response.statusCode == 200) {
      return response;
    }

  }
}
