import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/model/country_list_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Core/service/deck_service.dart';

class CountrylistLogic extends GetxController {

  DeckService service = DeckService();
  var country = <Countries>[].obs;
  List<Widget> list = <Widget>[];

  @override
  void onReady() {
    // TODO: implement onReady

    service.getCountryList().then((value) {
      print("Country " + value.countries!.length.toString());
      country.value = value.countries!;

    });

    super.onReady();
  }



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
