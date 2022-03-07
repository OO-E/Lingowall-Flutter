import 'package:get/get.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Core/service/word_service.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'dart:async';
import 'dart:core';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class ListLogic extends GetxController {

  WordService service = WordService();
  var error = StreamController<String>();
  var wordItems = <WordModel>[].obs;
  var pageCount = 1.obs;

  @override
  void onReady() {

    super.onReady();
    error.stream.listen((event) {
      StaticMethods.instance.showErrorMessage("", event);
    });

    getWords(0);
    getWordsCount();
  }

  @override
  void onClose() {
    error.close();
    super.onClose();
  }


  void getWords(num page) {
    EasyLoading.show(status: 'loading...');

    service.wordList(page).then((value) {
      wordItems.value = value;
      EasyLoading.dismiss();
    }).catchError((error)  {
      EasyLoading.dismiss();
      this.error.add(error);
    });
  }

  void getWordsCount() {

    service.wordCount().then((value) {
      pageCount.value = (value / 25).toInt() +  1;
    }).catchError((error) {
    });

  }
}
