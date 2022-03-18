import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/Theme/themeDark.dart';
import 'UI/Tabbar/tabbar_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'Helper/UserPreferences.dart';
import 'UI/Login/login_view.dart';
import 'Theme/themeLight.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  await GetStorage.init();
  runApp(FirstLayer());
}

class FirstLayer extends StatelessWidget {
  String token = UserPreferences.instance.getUserToken();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: UserPreferences.instance.getTheme() == "Dark" ? ThemeMode.dark : ThemeMode.light,
      theme: lightTheme ,
      darkTheme: darkTheme,
      home: token == "" ? LoginController() : TabbarViewWidget(),
      builder: EasyLoading.init(),
    );
  }
}


