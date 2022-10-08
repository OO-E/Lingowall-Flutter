import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingowall/Theme/themeDark.dart';
import 'package:lingowall/UI/Login/login_widget.dart';
import 'UI/Tabbar/tabbar_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'Helper/UserPreferences.dart';
import 'Theme/themeLight.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await ScreenUtil.ensureScreenSize();


  await initOneSignal();

  await GetStorage.init();

  runApp(FirstLayer());
}

initOneSignal() async {
  print("init oneSignal");

  await OneSignal.shared.setRequiresUserPrivacyConsent(true);
  await OneSignal.shared.consentGranted(true);

  await OneSignal.shared.setAppId("ceb3cf3e-988c-41ff-a31e-66697949e1f2");

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  //var playerId = deviceState.userId!;

  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
  });

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in iOS)
  });

  OneSignal.shared
      .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
  });

  OneSignal.shared.setEmailSubscriptionObserver(
      (OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
    // (ie. OneSignal.setEmail(email) is called and the user gets registered
  });
}

class FirstLayer extends StatelessWidget {
  String selected_deck = UserPreferences.instance.getSelectedDeckId();
  String token = UserPreferences.instance.getUserToken();


  @override
  Widget build(BuildContext context) {

    if (selected_deck == "") {
      token = "";
      UserPreferences.instance.signOut();
    }

    return ScreenUtilInit(
      //  designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_) {
        return GetMaterialApp(
          themeMode: UserPreferences.instance.getTheme() == "Dark"
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: token == "" ? LoginWidget() : TabbarViewWidget(),
          builder: EasyLoading.init(),
        );
      },
    );


  }
}
