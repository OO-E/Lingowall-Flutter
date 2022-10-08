import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DeckModel {
  String? sId;
  String? user;
  String? wantTo;
  String? native;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DeckModel(
      {this.sId,
        this.user,
        this.wantTo,
        this.native,
        this.createdAt,
        this.updatedAt,
        this.iV});

  factory DeckModel.fromJson(Map<String, dynamic> json) {

    return DeckModel(
        sId: json['_id'],
        user: json['user'],
        wantTo: json['want_to'],
        native: json['native'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        iV: json['__v']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['want_to'] = this.wantTo;
    data['native'] = this.native;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

