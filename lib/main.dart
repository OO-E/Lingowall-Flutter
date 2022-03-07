import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/UI/add_and_update/add_and_update_view.dart';
import 'package:lingowall/UI/list/list_view.dart';
import 'package:lingowall/UI/login/login_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lingowall/Helper/UserPreferances.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:lingowall/UI/add_and_update/add_and_update_view.dart';
import 'package:lingowall/UI/focus/focus_view.dart';

void main() async {
  await GetStorage.init();
  runApp(FirstLayer());
}

class FirstLayer extends StatelessWidget {
  String token = UserPreferences.instance.getUserToken();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(


      home: this.token == "" ? LoginController() : MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  Widget getScreen(int index) {

    if (_currentIndex == 0) {
      return ListController();
    }else if (_currentIndex == 1) {
      return AddAndUpdateController(ViewType.add);
    } else if (_currentIndex == 2) {
      return FocusController();
    }else {
      return ListController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(_currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Words'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text('Add'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.center_focus_strong),
            title: Text(
              'Focus',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
