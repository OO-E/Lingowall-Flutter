import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:lingowall/UI/Focus/focus_view.dart';
import 'package:lingowall/UI/List/list_view.dart';
import 'package:get/get.dart';
import 'package:lingowall/UI/add_and_update/add_and_update_view.dart';
import 'package:flutter/material.dart';
import 'package:lingowall/UI/setting/setting_view.dart';

class TabbarViewWidget extends StatelessWidget {

  
  var _currentIndex = 0.obs;
  var firstScreen = ListViewWidget();
  var secondScreen = AddAndUpdateController();
  var thirdScreen = FocusViewWidget();
  var fourthScreen = SettingWidget();

  Widget getScreen(int index) {
    if (index == 0) {

      return firstScreen;
    } else if (index == 1) {
      return secondScreen;
    } else if (index == 2) {
      return thirdScreen;
    } else {
      return fourthScreen;
    }
  }

  void refreshPage(int index) {
    if (index == 0) {
       firstScreen;
    } else if (index == 1) {
       secondScreen;
    } else if (index == 2) {
       thirdScreen.onRefreshPage();
    } else {
       firstScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return getScreen(_currentIndex.value);
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavyBar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          selectedIndex: _currentIndex.value,
          showElevation: false,
          itemCornerRadius: 5,
          curve: Curves.ease,
          onItemSelected: (index) {
            _currentIndex.value = index;
            refreshPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Words'),
              activeColor: Theme.of(context).colorScheme.secondary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.add_circle_outline),
              title: const Text('Add'),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.center_focus_strong),
              title: const Text(
                'Focus',
              ),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
          ],
        );
      }),
    );
  }
}