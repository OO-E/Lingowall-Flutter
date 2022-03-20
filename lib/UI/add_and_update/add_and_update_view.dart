import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_and_update_logic.dart';
import 'package:velocity_x/velocity_x.dart';

class AddAndUpdateController extends StatelessWidget {
  AddAndUpdateController({Key? key}) : super(key: key);

  final logic = Get.put(Add_and_updateLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LINGOWALL")),
      body: SafeArea(
        child: buildSingleChildScrollView(context),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(() {
                      return Column(
                        children: <Widget>[
                          wordTextField(context),
                          definationTextField(context),
                          exampleTextField(context),
                          meanTextField(context)
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  updateButton(context),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container updateButton(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: Text('Add'.tr),
          onPressed: () {
            logic.addNewWord();
          },
        ));
  }

  Container definationTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        style: Theme.of(context).textTheme.headline3,
        controller: logic.definationController,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          border: InputBorder.none,
          labelText: "Defination",
          errorText: logic.definationError.value,
        ),
      ),
    );
  }

  Container exampleTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        style: Theme.of(context).textTheme.headline3,
        controller: logic.exampleController,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          border: InputBorder.none,
          labelText: "Example",
          errorText: logic.exampleError.value,
        ),
      ),
    );
  }

  Container meanTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        style: Theme.of(context).textTheme.headline3,
        controller: logic.meanController,
        decoration: InputDecoration(
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            border: InputBorder.none,
            labelText: "Mean",
            errorText: logic.meanError.value),
      ),
    );
  }

  Container wordTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: logic.wordController,
        style: Theme.of(context).textTheme.headline3,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          border: InputBorder.none,
          labelText: "Word",
          errorText: logic.wordError.value,
        ),
      ),
    );
  }
}
