import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class StaticMethods {
  static StaticMethods _instance = StaticMethods._();

  StaticMethods._();

  static StaticMethods get instance => _instance;

  void showErrorMessage(String title, String content) {
/*    Get.defaultDialog(
      title: title,
      content: Text(content),
       radius: 5
    );
    */

    Get.snackbar(title, content,snackPosition: SnackPosition.TOP,colorText:  HexColor("#000000"));

  }

  void showWordMean(String title, String content) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      radius: 5
    );

  }
}
