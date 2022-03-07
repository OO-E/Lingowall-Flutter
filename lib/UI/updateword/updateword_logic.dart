import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'dart:async';
import 'package:lingowall/Core/service/word_service.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class UpdateWordLogic extends GetxController {
  WordService service = WordService();

  TextEditingController wordController = TextEditingController();
  TextEditingController definationController = TextEditingController();
  TextEditingController exampleController = TextEditingController();
  TextEditingController meanController = TextEditingController();
  var error = StreamController<String>();

  var item =StreamController<WordModel>();
  var isFocus = false.obs;
  var wordId = "".obs;

  @override
  void onReady() {
    super.onReady();

    item.add(Get.arguments["item"]);
    error.stream.listen((event) {
      StaticMethods.instance.showErrorMessage("", event);
    });


    item.stream.listen((event) {
      wordController.text = event.word ?? "";
      definationController.text = event.defination ?? "";
      exampleController.text = event.example ?? "";
      meanController.text = event.meaning ?? "";
      isFocus.value = event.focus == "true" ? true : false;
      wordId.value = event.sId ?? "";

    });
  }

  @override
  void onClose() {
    error.close();
    item.close();
    super.onClose();
  }

  void fetchFocus(bool focus) {
    EasyLoading.show(status: 'loading...');

    service.fetchFocus(focus, wordId.value).then((value) {
      this.isFocus.value = focus;
      EasyLoading.dismiss();

    }).catchError((error) {
      EasyLoading.dismiss();
      this.error.add(error);
    });


  }
}
