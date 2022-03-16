import 'package:get/get.dart';
import 'package:lingowall/Helper/UserPreferences.dart';

class SettingLogic extends GetxController {

  var themeTitle = "".obs;

    @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    themeTitle.value = UserPreferences.instance.getTheme();

    }

  void setTheme(ThemeSetting theme) {


    UserPreferences.instance.setTheme(theme);
    themeTitle.value = UserPreferences.instance.getTheme();

  }





}
