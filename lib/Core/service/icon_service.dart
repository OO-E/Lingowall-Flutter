
import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:lingowall/Core/model/flat_icon_response.dart';
import 'package:lingowall/Helper/UserPreferences.dart';

class IconService {

  static final IconService shared = IconService._internal();

  factory IconService() {
    return shared;
  }

  IconService._internal();

  Future<String> authService() async {

    var response = await Dio().post('https://api.flaticon.com/v3/app/authentication', data: {'apikey': "8c71d2b6eb0ec6e665b18c7abb58e46e6689a52b" });
    if (response.statusCode == 200) {
      var token = response.data["data"]["token"];
      UserPreferences.instance.setFlatIconAccessToken(token);
      return token;
    } else {
      throw Exception('Failed to load post');
    }
  }


  Future<List<IconModel>?> getIcons(String iconName) async {

    print("GET ICONS");
    var flatIconToken = UserPreferences.instance.getFlatIconAccessToken();
    if (flatIconToken != "") {
      //Access token var iconları listeleyelim.
      print("GET ICONS-1");
      var response = await Dio().get('https://api.flaticon.com/v3/search/icons/added?q=' + iconName + '&styleColor=color', options: Options(headers: {
        "Authorization": "Bearer " + flatIconToken
      }));


      if (response.statusCode == 200) {
        //Convert method;
        print("GET ICONS-2");
        var iconsModel = FlatIconResponse.fromJson(response.data);
        return iconsModel.data;
      } else {
        print("GET ICONS-3");
        UserPreferences.instance.removeFlatIconAccessToken();
        return await fetchIcons(iconName);
      }
    } else {
      print("GET ICONS-4");
      //Access token yoksa oluşturup kaydetmeliyiz.
      return await fetchIcons(iconName);
    }
  }

  Future<List<IconModel>?> fetchIcons(String iconName) async {
    var token = await authService();
    var response = await Dio().get('https://api.flaticon.com/v3/search/icons/added?q=' + iconName + '&styleColor=color', options: Options(headers: {
      "Authorization": "Bearer " + token
    }));
    print("GET ICONS-5");
    if (response.statusCode == 200) {
      print("GET ICONS-6");
      Map<String, dynamic> jsonMap = jsonDecode(response.data.toString());
      var iconsModel = FlatIconResponse.fromJson(jsonMap);
      return iconsModel.data;

    } else {
      print("GET ICONS-7");
      UserPreferences.instance.removeFlatIconAccessToken();
      return null;
    }
  }

}