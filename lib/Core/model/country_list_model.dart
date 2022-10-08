import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class CountryListModel {
  List<Countries>? countries;

  CountryListModel({this.countries});

  CountryListModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? title;
  String? code;
  String? image;

  Countries({this.title, this.code, this.image});

  Countries.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['code'] = this.code;
    data['image'] = this.image;
    return data;
  }
}