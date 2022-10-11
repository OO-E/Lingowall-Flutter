import 'package:get/get.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Core/service/word_service.dart';
import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lingowall/Helper/StaticMethods.dart';

import '../List/list_logic.dart';

class FocusLogic extends GetxController {

  WordService service = WordService();
  var error = StreamController<String>();
  var wordItems = <WordModel>[].obs;
  var viewShowType = ViewShowType.firstLoading.obs;


  @override
  void onReady() {
    super.onReady();

    error.stream.listen((event) {
      StaticMethods.instance.showSnackMessage("", event);
    });

    getFocusList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    error.close();
    super.onClose();
  }

  void getFocusList() {
    EasyLoading.show(status: 'loading...');

    service.wordFocusList().then((value) {
      wordItems.value = value.reversed.toList();
      if (wordItems.value.length == 0) {
        viewShowType.value = ViewShowType.emptyView;
      } else {
        viewShowType.value = ViewShowType.dataView;
      }
      EasyLoading.dismiss();
    }).catchError((error)  {
      EasyLoading.dismiss();
      this.error.add(error);
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

}
