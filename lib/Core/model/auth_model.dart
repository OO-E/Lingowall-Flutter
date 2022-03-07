import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AuthModel {

  final String? token;

  AuthModel({
    this.token
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        token: json["token"]
    );
  }
}