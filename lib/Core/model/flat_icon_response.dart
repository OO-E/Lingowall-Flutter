

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class FlatIconResponse {
  List<IconModel>? data;
  Metadata? metadata;

  FlatIconResponse({this.data, this.metadata});

  FlatIconResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <IconModel>[];
      json['data'].forEach((v) {
        data!.add(new IconModel.fromJson(v));
      });
    }
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class IconModel {
  int? id;
  String? description;
  String? colors;
  String? color;
  String? shape;
  int? familyId;
  String? familyName;
  String? teamName;
  int? added;
  int? packId;
  String? packName;
  int? packItems;
  String? tags;
  int? equivalents;
  Images? images;

  IconModel(
      {this.id,
        this.description,
        this.colors,
        this.color,
        this.shape,
        this.familyId,
        this.familyName,
        this.teamName,
        this.added,
        this.packId,
        this.packName,
        this.packItems,
        this.tags,
        this.equivalents,
        this.images});

  IconModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    colors = json['colors'];
    color = json['color'];
    shape = json['shape'];
    familyId = json['family_id'];
    familyName = json['family_name'];
    teamName = json['team_name'];
    added = json['added'];
    packId = json['pack_id'];
    packName = json['pack_name'];
    packItems = json['pack_items'];
    tags = json['tags'];
    equivalents = json['equivalents'];
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['colors'] = this.colors;
    data['color'] = this.color;
    data['shape'] = this.shape;
    data['family_id'] = this.familyId;
    data['family_name'] = this.familyName;
    data['team_name'] = this.teamName;
    data['added'] = this.added;
    data['pack_id'] = this.packId;
    data['pack_name'] = this.packName;
    data['pack_items'] = this.packItems;
    data['tags'] = this.tags;
    data['equivalents'] = this.equivalents;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }
}

class Images {
  String? s16;
  String? s24;
  String? s32;
  String? s64;
  String? s128;
  String? s256;
  String? s512;

  Images(
      {this.s16,
        this.s24,
        this.s32,
        this.s64,
        this.s128,
        this.s256,
        this.s512});

  Images.fromJson(Map<String, dynamic> json) {
    s16 = json['16'];
    s24 = json['24'];
    s32 = json['32'];
    s64 = json['64'];
    s128 = json['128'];
    s256 = json['256'];
    s512 = json['512'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['16'] = this.s16;
    data['24'] = this.s24;
    data['32'] = this.s32;
    data['64'] = this.s64;
    data['128'] = this.s128;
    data['256'] = this.s256;
    data['512'] = this.s512;
    return data;
  }
}

class Metadata {
  int? page;
  int? count;
  int? total;

  Metadata({this.page, this.count, this.total});

  Metadata.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['count'] = this.count;
    data['total'] = this.total;
    return data;
  }
}