
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/service/login_service.dart';

import '../../Helper/StaticMethods.dart';


class RegisterLogic extends GetxController {

  LoginService service = LoginService();
  var error = StreamController<String>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late BuildContext context;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    error.stream.listen((event) {
      StaticMethods.instance.showSnackMessage("LingoCards", event);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    error.close();
    super.onClose();
  }

  void registerAccount() async {
    var emailText = emailController.text;
    var passText = passwordController.text;
    var isFetch = true;

    if (emailText == "") {
      error.add("Please enter your email");
      isFetch = false;
      return;
    }

    if (passText == "") {
      isFetch = false;
      error.add("Please enter your password");
      return;
    }

    if (isFetch == true) {
      EasyLoading.show(status: 'loading...');

      service.register(emailText, passText).then((result) {

        EasyLoading.showSuccess(
            "Thank you for sign up to Lingocard. We sent an email to " +
                emailController.text +
                " for validation.",
            dismissOnTap: true);

        emailController.text = "";
        passwordController.text = "";


      }).catchError((error) {
        EasyLoading.dismiss();
        this.error.add(error);
      });


    }

  }

}
