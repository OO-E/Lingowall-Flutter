
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BaseResponseModel<T> {
  final bool success;
  final String error;
  T? result;


  BaseResponseModel({
    this.success = false,
    this.error = "",
    required this.result
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json,T Function(Map<String, dynamic>) fromJson) {
    if (json['success'] == false) {

      return BaseResponseModel(
        success: json["success"],
        error: json['error'],
        result: null);
    } else {
      return BaseResponseModel(
        success: json["success"],
        error: json['error'],
        result: fromJson(json['result']),
      );
    }
  }

  factory BaseResponseModel.onlyJsonParse(Map<String, dynamic> json) {
    if (json['success'] == false) {

      return BaseResponseModel(
          success: json["success"],
          error: json['error'],
          result: null);
    } else {
      return BaseResponseModel(
        success: json["success"],
        error: json['error'],
        result: json['result'],
      );
    }
  }
}

