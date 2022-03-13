import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:lingowall/Extension/Color.dart';

class StaticMethods {
  static StaticMethods _instance = StaticMethods._();

  StaticMethods._();

  static StaticMethods get instance => _instance;

  void showSnackMessage(String title, String content) {
    Get.snackbar(title, content,snackPosition: SnackPosition.TOP,colorText:  HexColor.fromHex(("#000000")));
  }

  void showMessage(String title, String content) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      radius: 5
    );
    Future.delayed(Duration(seconds: 1));
    Get.back();
  }

}
