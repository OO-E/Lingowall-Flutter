import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/service/word_service.dart';
import 'package:lingowall/Helper/StaticMethods.dart';

class Add_and_updateLogic extends GetxController {
  TextEditingController wordController = TextEditingController();
  TextEditingController definationController = TextEditingController();
  TextEditingController exampleController = TextEditingController();
  TextEditingController meanController = TextEditingController();
  WordService service = WordService();
  var wordError = "".obs;
  var definationError = "".obs;
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
    var definationText = definationController.text;
    var exampleText = exampleController.text;
    var meanText = meanController.text;

    var isFetch = true;

    if (wordText == "") {
      wordError.value = "Please set Word";
      isFetch = false;
    } else {
      wordError.value = "";
    }

    if (definationText == "") {
      definationError.value = "Please set Defination";
      isFetch = false;
    } else {
      definationError.value = "";
    }

    if (exampleText == "") {
      exampleError.value = "Please set Example";
      isFetch = false;
    } else {
      exampleError.value = "";
    }
    if (meanText == "") {
      meanError.value = "Please set Mean";
      isFetch = false;
    } else {
      meanError.value = "";
    }

    if (isFetch == true) {
      service
          .fetchNewWord(wordText, meanText, definationText, exampleText)
          .then((value) {

            wordController.text = "";
            meanController.text = "";
            exampleController.text = "";
            definationController.text = "";

            meanError.value = "";
            wordError.value = "";
            exampleError.value = "";
            definationError.value = "";

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
}
