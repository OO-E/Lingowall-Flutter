import 'package:get/get.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Core/service/icon_service.dart';
import 'package:lingowall/Core/service/word_service.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'dart:async';
import 'dart:core';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class ListLogic extends GetxController   {

  WordService service = WordService();
  var error = StreamController<String>();
  var wordItems = <WordModel>[].obs;
  var pageCount = 1.obs;

  @override
  void onReady() {

    super.onReady();
    error.stream.listen((event) {
      StaticMethods.instance.showSnackMessage("", event);
    });

    //Access tokenı yenilemek için her uygulama açılışında çalışacak.
    IconService.shared.authService().then((value) {});
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
      pageCount.value = (value / 75).toInt() +  1;
    }).catchError((error) {
    });

  }

  void fetchFocus(bool focus, String wordId, int index) {
    EasyLoading.show(status: 'loading...');

    service.fetchFocus(focus, wordId).then((value) {
      EasyLoading.dismiss();
      wordItems.value[index].focus = focus.toString();
      wordItems.refresh();
    }).catchError((error) {
      EasyLoading.dismiss();
    });


  }

  @override
  void refresh() {
    super.refresh();
    getWords(0);
    getWordsCount();
  }

}
