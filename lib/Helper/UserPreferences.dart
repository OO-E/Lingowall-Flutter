
import 'package:get_storage/get_storage.dart';

class UserPreferancesTitle {
  static String TOKEN = "TOKEN";
  static String INFO = "INFO";
}

class UserPreferences {

  static UserPreferences _instance = UserPreferences._();

  final getStorage = GetStorage();

  UserPreferences._();

  static UserPreferences get instance => _instance;


  void setUserToken(String token) {
    this.getStorage.write(UserPreferancesTitle.TOKEN, token);
  }
  String getUserToken() {
    var token = this.getStorage.read(UserPreferancesTitle.TOKEN) ?? "";
    return  token;
  }

}