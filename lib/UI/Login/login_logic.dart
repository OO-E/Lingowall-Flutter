import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/service/login_service.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'package:lingowall/UI/DeckAdd/deck_add_view.dart';
import 'dart:async';
import 'package:lingowall/UI/Tabbar/tabbar_view.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../Core/service/deck_service.dart';



class LoginLogic extends GetxController {
  LoginService service = LoginService();
  DeckService deckService = DeckService();

  var error = StreamController<String>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onReady() {
    super.onReady();

    emailController.text = "orhan.oneplus@gmail.com";
    passwordController.text = "123456";

    error.stream.listen((event) {
      StaticMethods.instance.showSnackMessage("LingoCards", event);
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

  void getDeckList() async{
    
    deckService.getDeckList().then((result) {

      EasyLoading.dismiss();
      if (result.length == 0) {
        //Deck yoksa deck ekleme ekranına gidicek.
        Get.off(DeckAddPage(),transition: Transition.fadeIn);
      } else {
        if (UserPreferences.instance.getSelectedDeckId() == "") {
          //Seçilmiş bi deck id yok o zaman ilk deck id kullanılır.
          UserPreferences.instance.setSelectedDeck(result[0].sId!);
        }
        Get.off(TabbarViewWidget(), transition: Transition.fadeIn);
      }
    }).catchError((error) {
      EasyLoading.dismiss();
      Get.off(TabbarViewWidget(), transition: Transition.fadeIn);
    });

  }

  void getOneSignalID()  async {

    if (Platform.isAndroid || Platform.isIOS) {
      var deviceState =  await OneSignal.shared.getDeviceState();

      if (deviceState == null) {
        getDeckList();
      } else {
        var playerId = deviceState!.userId ?? "";


        service.updateOneSignalID(playerId).then((value) {

          getDeckList();


        }).catchError((error) {

          getDeckList();

        });
      }
    } else {
      getDeckList();
    }




  }
}
