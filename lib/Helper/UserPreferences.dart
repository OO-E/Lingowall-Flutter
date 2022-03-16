
import 'package:get_storage/get_storage.dart';

class UserPreferancesTitle {
  static String TOKEN = "TOKEN";
  static String INFO = "INFO";
  static String THEME = "THEME";
}

enum ThemeSetting {
  Light,
  Dark
}

class UserPreferences {

  static UserPreferences _instance = UserPreferences._();

  final getStorage = GetStorage();

  UserPreferences._();

  static UserPreferences get instance => _instance;


  void setTheme(ThemeSetting theme) {
    var title = theme == ThemeSetting.Dark ? "Dark" : "Light";
    this.getStorage.write(UserPreferancesTitle.THEME, title);
  }

  String getTheme() {
    var theme = this.getStorage.read(UserPreferancesTitle.THEME) ?? "";
    if (theme == "") {
      theme = "Light";
    }

    return theme;
  }

  void setUserToken(String token) {
    this.getStorage.write(UserPreferancesTitle.TOKEN, token);
  }
  String getUserToken() {
    var token = this.getStorage.read(UserPreferancesTitle.TOKEN) ?? "";
    return  token;
  }

}