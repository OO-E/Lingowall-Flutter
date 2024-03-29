import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/service/deck_service.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Delegate/UIDelegate.dart';
import '../../Helper/Debouncer.dart';
import 'add_and_update_logic.dart';

class AddAndUpdateController extends StatelessWidget with UIDelegate {
  AddAndUpdateController({Key? key}) : super(key: key);

  final logic = Get.put(Add_and_updateLogic());
  final _debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    _debouncer.duration = Duration(milliseconds: 750);
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
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(() {
                      return Column(
                        children: <Widget>[
                          Obx(() {
                            return icon(context);
                          }),
                          wordTextField(context),
                          meanTextField(context),
                          exampleTextField(context)
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 15,
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
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          child: Text('Add'.tr, style: TextStyle(fontSize: 18)),
          onPressed: () {
            logic.addNewWord();
          },
        ));
  }

  Container icon(BuildContext context) {
    ImageProvider image;

    if (logic.iconUrl.value != "") {
      image = NetworkImage(logic.iconUrl.value);
    } else {
      image = AssetImage("assets/photos.png");
    }



    return Container(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Image(
          image: image,

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
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            border: InputBorder.none,
            labelText: "Example",
            errorText: logic.exampleError.value,
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            )),
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
            labelText: DeckService.nativeLanguage,
            errorText: logic.meanError.value,
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            )
        ),

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
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            border: InputBorder.none,
            labelText: DeckService.learnLanguage,
            errorText: logic.wordError.value,
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Vx.blue500),
            )
        ),
        onChanged: (value) {
          _debouncer.run(() {
            logic.translateWord();
            logic.findIcon();
          });
        },

      ),
    );
  }



  @override
  void onRefreshPage() {
    // TODO: implement onRefreshPage
    logic.exampleController.text = "";
    logic.meanController.text = "";
    logic.wordController.text = "";
  }


}
