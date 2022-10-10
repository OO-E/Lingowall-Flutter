import 'dart:ffi';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:lingowall/Core/model/country_list_model.dart';
import 'package:lingowall/Core/service/deck_service.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Helper/StaticMethods.dart';
import '../Tabbar/tabbar_view.dart';

class DeckAddLogic extends GetxController {

  DeckService service = DeckService();
  final wantTo = Countries().obs;
  final native = Countries().obs;


  bool isSendRequest() {

    if (wantTo.value.title != null && native.value.title != null) {
      return true;
    }  else {
      return false;
    }

  }

  Color sendButtonBackgroundColor() {


    if (wantTo.value.title != null && native.value.title != null) {
      return Vx.blue400;
    }  else {
      return Vx.gray400;
    }

  }

  Color sendButtonForegroundColor() {

    print("want to  " + (wantTo.value.title?? "-"));
    if (wantTo.value.title != null && native.value.title != null) {
      return Vx.white;
    }  else {
      return Vx.black;
    }
  }


  void saveRequest() {

    if (this.isSendRequest()) {

      service.saveDeck(wantTo.value.code!, native.value.code!).then((value) {

        UserPreferences.instance.setSelectedDeck(value.sId!);
        Get.off(TabbarViewWidget(), transition: Transition.fadeIn);

      }).catchError((error) {
        StaticMethods.instance.showSnackMessage("LingoCards", error);
      });
      
    } else {
      StaticMethods.instance.showSnackMessage("LingoCards", "Please select languages");
    }

  }


  @override
  void onReady() {
    // TODO: implement onReady


    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
