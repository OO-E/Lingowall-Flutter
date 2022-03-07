import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class WordModel {

  String? sId;
  String? word;
  String? defination;
  String? example;
  String? meaning;
  String? focus;
  String? user;
  bool? notification;
  String? createdAt;
  String? updatedAt;

  WordModel(
      {this.sId,
        this.word,
        this.defination,
        this.example,
        this.meaning,
        this.focus,
        this.user,
        this.notification,
        this.createdAt,
        this.updatedAt});

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
    sId: json['_id'],
    word: json['word'],
    defination: json['defination'],
    example: json['example'],
    meaning: json['meaning'],
    focus: json['focus'],
    user: json['user'],
    notification: json['notification'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at']
    );
  }

}