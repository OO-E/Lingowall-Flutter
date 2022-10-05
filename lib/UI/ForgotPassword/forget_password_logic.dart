import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../Core/service/login_service.dart';
import '../../Helper/StaticMethods.dart';

class Forget_passwordLogic extends GetxController {
  TextEditingController emailController = TextEditingController();
  LoginService service = LoginService();
  var error = StreamController<String>();

  @override
  void onReady() {
    super.onReady();
    error.stream.listen((event) {
      StaticMethods.instance.showSnackMessage("LingoCards", event);
    });
  }

  @override
  void onClose() {

    error.close();
    super.onClose();
  }

  void resetPassword() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);

    if (emailController.text == "") {
      error.add("Please set email");
      return;
    }

    if (emailValid == false) {
      error.add("Email is not valid");
      return;
    } else {
      EasyLoading.show(status: 'loading...');
      service.forgotPassword(emailController.text).then((value) {
        EasyLoading.showSuccess(
            "We sent an email to " +
                emailController.text +
                " for reset password.",
            dismissOnTap: true);

        emailController.text = "";
      }).catchError((error) {
        this.error.add(error);
        EasyLoading.dismiss();
      });
    }
  }
}
