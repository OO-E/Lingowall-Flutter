import 'package:flutter/services.dart';
import 'package:lingowall/Core/model/base_listresponse.dart';
import 'package:lingowall/Core/model/deck_model.dart';
import 'dart:convert';

import '../http_service.dart';
import '../model/base_response.dart';
import '../model/country_list_model.dart';

class DeckService {
  HttpService service = HttpService().init();



  Future<List<DeckModel>> getDeckList() async {
    final result = await service.request(
      url: "/deck",
      method: Method.GET,
      params: {},
    );

    final data = BaseListResponseModel<DeckModel>.fromJson(json.decode(result.toString()), (data) => DeckModel.fromJson(data));
    if (data.success) {

      return data.result!;
    } else {
      throw data.error;
    }
  }


  Future<CountryListModel> getCountryList() async {

    final String response =
    await rootBundle.loadString('assets/country.json');
    final data = await json.decode(response);
    final model = CountryListModel.fromJson(data);
    return model;

  }



}