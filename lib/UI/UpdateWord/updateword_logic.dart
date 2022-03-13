import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'dart:async';
import 'package:lingowall/Core/service/word_service.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class UpdateWordLogic extends GetxController {
  WordService service = WordService();

  TextEditingController wordController = TextEditingController();
  TextEditingController definationController = TextEditingController();
  TextEditingController exampleController = TextEditingController();
  TextEditingController meanController = TextEditingController();

  UIDelegate? delegate;

  var wordError = "".obs;
  var definationError = "".obs;
  var exampleError = "".obs;
  var meanError = "".obs;

  var error = StreamController<String>();
  var item =StreamController<WordModel>();
  var isFocus = false.obs;
  var wordId = "".obs;

  @override
  void onReady() {
    super.onReady();


    error.stream.listen((event) {
      StaticMethods.instance.showSnackMessage("", event);
    });


    item.stream.listen((event) {
      print("itemss ${event.word}");
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
      delegate?.onRefreshPage();
      EasyLoading.dismiss();

    }).catchError((error) {
      EasyLoading.dismiss();
      this.error.add(error);
    });


  }

  void fetchUpdate() {

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
          .fetchUpdateWord(wordId.value, wordText, meanText, definationText, exampleText)
          .then((value) {

        wordController.text = "";
        meanController.text = "";
        exampleController.text = "";
        definationController.text = "";

        meanError.value = "";
        wordError.value = "";
        exampleError.value = "";
        definationError.value = "";

        StaticMethods.instance.showMessage("", "This word updated");
        delegate?.onRefreshPage();

      }).catchError((error) {
        print(error);
        StaticMethods.instance.showMessage("", error as String);
      });
    }


  }

  void fetchDelete() {
    service
        .fetchDeleteWord(wordId.value)
        .then((value) {

      wordController.text = "";
      meanController.text = "";
      exampleController.text = "";
      definationController.text = "";

      meanError.value = "";
      wordError.value = "";
      exampleError.value = "";
      definationError.value = "";

      delegate?.onRefreshPage();
      Get.back();


    }).catchError((error) {
      print(error);
      StaticMethods.instance.showMessage("", error as String);
    });
  }
}
