import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/UI/Cell/WordCell.dart';
import 'package:lingowall/UI/Focus/focus_logic.dart';

class FocusViewWidget extends StatelessWidget with UIDelegate {
  FocusViewWidget({Key? key}) : super(key: key);

  final logic = Get.put(FocusLogic());


  @override
  Widget build(BuildContext context) {
    //Get.off(LoginController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Focus")
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  child: Obx(
                        () => ListView.builder(
                        itemCount: logic.wordItems.length,
                        itemBuilder: (context, index) {
                          return WordCell(item: logic.wordItems.value[index],delegate: this,);
                        }),
                  )),
            ],
          ),
        ));
  }

  @override
  void onRefreshPage() {
    logic.getFocusList();
  }

}
