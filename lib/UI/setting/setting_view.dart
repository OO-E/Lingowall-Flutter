import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/Helper/UserPreferences.dart';
import 'package:lingowall/Theme/themeLight.dart';
import 'package:lingowall/UI/List/list_view.dart';
import 'package:lingowall/UI/Login/login_view.dart';
import 'package:settings_ui/settings_ui.dart';

import 'setting_logic.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({Key? key}) : super(key: key);

  final logic = Get.put(SettingLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Obx(() {
        return SettingsList(
          shrinkWrap: false,
          lightTheme: SettingsThemeData(
            settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
            settingsSectionBackground: Theme.of(context).cardTheme.color,
            settingsTileTextColor: Theme.of(context).colorScheme.primaryVariant,
            inactiveSubtitleColor: Theme.of(context).colorScheme.secondary,
            tileDescriptionTextColor: Theme.of(context).colorScheme.secondary,
            dividerColor: Colors.transparent,
            tileHighlightColor: Theme.of(context).cardTheme.color,
          ),
          sections: [
            SettingsSection(
              title: Text('Common'),
              tiles: <SettingsTile>[themeNavigation(), signOut()],
            ),
          ],
        );
      }),
    );
  }

  SettingsTile signOut() {
    return SettingsTile.navigation(
      onPressed: (BuildContext context) {
        UserPreferences.instance.signOut();
        Get.offAll(LoginController());
      },
      leading: const Icon(Icons.logout, color: Colors.blue),
      title: const Text('Sign Out'),
    );
  }

  SettingsTile themeNavigation() {
    return SettingsTile.navigation(
      onPressed: (BuildContext context) {
        showAdaptiveActionSheet(
          context: context,
          title: const Text('Theme'),
          androidBorderRadius: 10,
          actions: <BottomSheetAction>[
            darkThemeButton(),
            lightThemeButton(),
          ],
          cancelAction: CancelAction(
              title: const Text(
                  'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
        );
      },
      leading: const Icon(Icons.beach_access, color: Colors.blue),
      title: const Text('Theme'),
      value: logic.themeTitle.value.text.make(),
    );
  }

  BottomSheetAction darkThemeButton() {
    return BottomSheetAction(
        title: const Text('Dark', style: TextStyle(color: Colors.blue)),
        onPressed: () {
          logic.setTheme(ThemeSetting.Dark);
          Get.changeThemeMode(ThemeMode.dark);
          Get.back();
        });
  }

  BottomSheetAction lightThemeButton() {
    return BottomSheetAction(
        title: const Text('Light', style: TextStyle(color: Colors.blue)),
        onPressed: () {
          logic.setTheme(ThemeSetting.Light);
          Get.changeThemeMode(ThemeMode.light);
          Get.back();
        });
  }

  VxBlock buildVxBlock() {
    return VxBlock(
      children: [
        "VelocityX is Super".text.make().box.height(90).yellow500.make(),
        "VelocityX increase productivity".text.make().box.red500.make(),
        buildZStack()
      ],
      verticalDirection: VerticalDirection.up,
    );
  }

  ZStack buildZStack() {
    return ZStack(
      [
        VxBox().blue500.height(110.0).width(110.0).make(),
        VxBox().green500.height(90.0).width(90.0).make(),
        VxBox().red500.height(70.0).width(70.0).make(),
      ],
      alignment: Alignment.center,
    );
  }
}
