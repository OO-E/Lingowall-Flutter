import 'package:flutter/services.dart';
import 'package:lingowall/Core/model/base_listresponse.dart';
import 'package:lingowall/Core/model/deck_model.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'dart:convert';

import '../http_service.dart';
import '../model/base_response.dart';
import '../model/country_list_model.dart';

class DeckService {
  HttpService service = HttpService().init();


  static late DeckModel? deck;
  static String nativeLanguage = "";
  static  String learnLanguage = "";

  Future<List<DeckModel>> getDeckList() async {
    final result = await service.request(
      url: "/deck",
      method: Method.GET,
      params: {},
    );

    final data = BaseListResponseModel<DeckModel>.fromJson(json.decode(result.toString()), (data) => DeckModel.fromJson(data));
    if (data.success) {

      var countryList = await this.getCountryList();


      if (data.result!.length > 0) {
        var firstModel = data.result!.first;

        var selectedDeckId = UserPreferences.instance.getSelectedDeckId();

        if (selectedDeckId == "") {
          DeckService.deck = firstModel;
        } else {
          //Selected id var o zaman o modeli bulucaz.
          var selectedModel = data.result!.where((element) {
            return element.sId == selectedDeckId;
          });
          DeckService.deck = selectedModel.first;

        }

        var nativeLanguageCountry = countryList.countries!.where((element) {
          return element.code! == DeckService.deck!.native;
        }).first;


        var learnLanguageCountry = countryList.countries!.where((element) {
          return element.code! == DeckService.deck!.wantTo;
        }).first;


        DeckService.nativeLanguage = nativeLanguageCountry.title!;
        DeckService.learnLanguage = learnLanguageCountry.title!;
      } else {
        DeckService.deck = null;
      }

      return data.result!;
    } else {
      throw data.error;
    }
  }


  Future<DeckModel> saveDeck(String wantTo, String native) async {
    final result = await service.request(
      url: "/deck",
      method: Method.POST,
      params: {"want_to": wantTo, "native": native},
    );

    final data = BaseResponseModel<DeckModel>.fromJson(json.decode(result.toString()), (data) => DeckModel.fromJson(data));
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