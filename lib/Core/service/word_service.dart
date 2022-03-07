import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Core/model/base_response.dart';
import 'package:lingowall/Core/model/base_listresponse.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'package:lingowall/Core/http_service.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:async';

class WordService {
  HttpService service = HttpService().init();

  Future<List<WordModel>> wordFocusList() async {
    final result =
        await service.request(url: "/word/focus", method: Method.GET);
    final data = BaseListResponseModel<WordModel>.fromJson(
        json.decode(result.toString()), (data) => WordModel.fromJson(data));
    if (data.success) {
      return data.result!;
    } else {
      throw data.error;
    }
  }

  Future<List<WordModel>> wordList(num page) async {
    final result = await service.request(
        url: "/word/myword/" + page.toString() + "/25", method: Method.GET);
    final data = BaseListResponseModel<WordModel>.fromJson(
        json.decode(result.toString()), (data) => WordModel.fromJson(data));
    if (data.success) {
      return data.result!;
    } else {
      throw data.error;
    }
  }

  Future<String> fetchFocus(bool focus, String wordId) async {
    print("ozgun" + wordId);
    final result = await service.request(
        url: "/word/focus",
        method: Method.PUT,
        params: {"id": wordId, "focus": focus});

    final data = BaseResponseModel<String>.onlyJsonParse(
        json.decode(result.toString()));
    print("ooeee");
    if (data.success) {
      return data.result ?? "ok";
    } else {
      throw data.error;
    }
  }

  Future<int> wordCount() async {
    final result =
        await service.request(url: "/word/count", method: Method.GET);

    final data =
        BaseResponseModel<int>.onlyJsonParse(json.decode(result.toString()));

    if (data.success) {
      return data.result!;
    } else {
      throw data.error;
    }
  }
}
