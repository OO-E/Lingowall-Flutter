
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BaseListResponseModel<T> {
  final bool success;
  final String error;
  final List<T>? result;


  BaseListResponseModel({
    this.success = false,
    this.error = "",
    required this.result
  });

  factory BaseListResponseModel.fromJson(Map<String, dynamic> json,T Function(Map<String, dynamic>) fromJson) {
    if (json['success'] == false) {
      print("list0"+ json.toString());
      return BaseListResponseModel(
          success: json["success"],
          error: json['error'],
          result: null);
    } else {
      print("list1" );
      List<T> list = List<T>.from(json['result'].map((model) => fromJson(model)));

      return BaseListResponseModel(
        success: json["success"],
        error: json['error'],
        result: list,
      );
    }
  }
}

