import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:lingowall/Extension/Color.dart';

class StaticMethods {
  static StaticMethods _instance = StaticMethods._();

  StaticMethods._();

  static StaticMethods get instance => _instance;

  void showSnackMessage(String title, String content) {
    Get.snackbar(title, content,
        snackPosition: SnackPosition.TOP,
        colorText: HexColor.fromHex(("#ffffff")),backgroundColor: Color(0xFF262335));
  }

  void showMessage(String title, String content) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      radius: 5,
    );
    Future.delayed(Duration(seconds: 1));
    Get.back();
  }

  void showMessageWithOutDelay(
      String title, String content, BuildContext context) {
    Get.defaultDialog(
      title: title,
      content: Text(
        content,
        style: Theme.of(context).textTheme.headline1,
      ),
      radius: 5,
      backgroundColor: Theme.of(context).cardTheme.color,
      titleStyle: Theme.of(context).textTheme.headline2,
    );
  }
}
