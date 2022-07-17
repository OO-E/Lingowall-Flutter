import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/service/login_service.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'dart:async';
import 'package:lingowall/UI/Tabbar/tabbar_view.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';



class LoginLogic extends GetxController {
  LoginService service = LoginService();
  var error = StreamController<String>();

  @override
  void onReady() {
    super.onReady();
    error.stream.listen((event) {
      StaticMethods.instance.showSnackMessage("", event);
    });
  }

  @override
  void onClose() {
    error.close();
    super.onClose();
  }

  void authentication(String email, String password) {
    print("Handle Login Authentication");
    EasyLoading.show(status: 'loading...');
    service.login(email, password).then((value)  {

      UserPreferences.instance.setUserToken(value.token!);
      getOneSignalID();


    }).catchError((error) {
      EasyLoading.dismiss();
      print(error);
      this.error.add(error);
    });
  }


  void getOneSignalID()  async {
    var deviceState =  await OneSignal.shared.getDeviceState();
    var playerId = deviceState!.userId!;

    service.updateOneSignalID(playerId).then((value) {
       EasyLoading.dismiss();
       Get.off(TabbarViewWidget());

     }).catchError((error) {

         EasyLoading.dismiss();
         Get.off(TabbarViewWidget());
     });

  }
}
