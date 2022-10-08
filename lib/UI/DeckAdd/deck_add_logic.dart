import 'package:get/get.dart';
import 'package:lingowall/Core/model/country_list_model.dart';
import 'package:lingowall/Core/service/deck_service.dart';

class DeckAddLogic extends GetxController {

  DeckService service = DeckService();

  @override
  void onReady() {
    // TODO: implement onReady

   service.getCountryList().then((value) {
     print("Country " + value.countries!.length.toString());
   });
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
