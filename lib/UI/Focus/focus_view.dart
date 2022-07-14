import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/UI/Cell/WordCell.dart';
import 'package:lingowall/UI/Focus/focus_logic.dart';

import '../../Core/model/word_model.dart';
import '../../Helper/Debouncer.dart';
import '../../Helper/StaticMethods.dart';
import '../UpdateWord/updateword_view.dart';

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
                           return WordCell2(logic.wordItems[index], context);
                         // return WordCell(item: logic.wordItems.value[index],delegate: this,);
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

  ListTile WordCell2(WordModel item, BuildContext context) {
    return ListTile(
        title: Text(item.word ?? "-",style: Theme.of(context).textTheme.headline1),
        subtitle: Text(item.meaning ?? "", style: Theme.of(context).textTheme.headline2,),
        enabled: true,
        onTap: () {
          var updateScreen = UpdateWordController();
          updateScreen.trigger(item, this);
          Get.to(updateScreen);

        });
  }

}
