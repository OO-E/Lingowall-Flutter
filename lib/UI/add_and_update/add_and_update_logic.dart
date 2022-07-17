import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/service/icon_service.dart';
import 'package:lingowall/Core/service/word_service.dart';
import 'package:lingowall/Helper/StaticMethods.dart';

class Add_and_updateLogic extends GetxController {
  TextEditingController wordController = TextEditingController();
  TextEditingController exampleController = TextEditingController();
  TextEditingController meanController = TextEditingController();
  WordService service = WordService();

  var iconUrl = "".obs;
  var wordError = "".obs;
  var exampleError = "".obs;
  var meanError = "".obs;
  bool isWordSelected = false;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void addNewWord() {
    var wordText = wordController.text;
    var exampleText = exampleController.text;
    var meanText = meanController.text;

    var isFetch = true;

    if (wordText == "") {
      wordError.value = "Please set Word";
      isFetch = false;
    } else {
      wordError.value = "";
    }

    if (meanText == "") {
      meanError.value = "Please set Mean";
      isFetch = false;
    } else {
      meanError.value = "";
    }

    if (isFetch == true) {
      service
          .fetchNewWord(wordText, meanText, exampleText, iconUrl.value)
          .then((value) {

            wordController.text = "";
            meanController.text = "";
            exampleController.text = "";

            meanError.value = "";
            wordError.value = "";
            exampleError.value = "";
            iconUrl.value = "";
            StaticMethods.instance.showMessage("", "This word added your list");


      }).catchError((error) {
        print(error);
        StaticMethods.instance.showMessage("", error as String);
      });
    }
  }

  void translateWord() {


    service.translateWord(wordController.text,   "tr", "en").then((value) {

      meanController.text = value;

    }).catchError((error) {
      meanController.text = "";
    });

  }

  void findIcon() {

    IconService.shared.getIcons(wordController.text).then((value) {

      print(value);
      if (value != null && value.length > 0 ) {
        iconUrl.value = value[0].images!.s512!;
      }  else {
        iconUrl.value = "";
      }

    }).catchError((error) {
      iconUrl.value = "";
      print(error);
    });

  }
}
