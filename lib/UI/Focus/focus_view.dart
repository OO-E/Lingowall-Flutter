import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/UI/Cell/WordCell.dart';
import 'package:lingowall/UI/Focus/focus_logic.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Core/model/word_model.dart';
import '../../Core/service/deck_service.dart';
import '../../Helper/Debouncer.dart';
import '../../Helper/StaticMethods.dart';
import '../List/list_logic.dart';
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
          child: Obx(() {
            return ViewFactory(context);
          }),
        ));
  }

  Column MainView() {
    return Column(
      children: [
        Flexible(
            child: Obx(
                  () =>
                  ListView.builder(
                      itemCount: logic.wordItems.length,
                      itemBuilder: (context, index) {
                        return WordCell2(
                            logic.wordItems[index], context, index);
                        // return WordCell(item: logic.wordItems.value[index],delegate: this,);
                      }),
            )),
      ],
    );
  }

  Widget ViewFactory(BuildContext context) {
    if (logic.viewShowType.value == ViewShowType.dataView) {
      return MainView();
    } else if (logic.viewShowType.value == ViewShowType.emptyView) {
      return EmptyView(context);
    } else {
      return Container();
    }
  }


  Widget EmptyView(BuildContext context) {
    return VStack([
      SizedBox(
        height: 0.25.sh,
      ),
      Icon(
        Icons.language,
        size: 100,
        color: Theme
            .of(context)
            .primaryColor,
      )
          .w(100)
          .h(100)
          .centered()
          .box
          .make(),
      const SizedBox(
        height: 32,
      ),
      Text(
        "You don't have any focus word in \nyour ${DeckService.learnLanguage} deck",
        style: Theme
            .of(context)
            .textTheme
            .headline1,
        textAlign: TextAlign.center,
      ).centered(),
    ])
        .w(1.0.sw)
        .h(1.0.sh)
        .box
        .make();
  }


  @override
  void onRefreshPage() {
    logic.getFocusList();
  }

  ListTile WordCell2(WordModel item, BuildContext context, int index) {
    ImageProvider image;

    if (item.image_url != "" && item.image_url != null) {
      image = NetworkImage(item.image_url!);
    } else {
      image = AssetImage("assets/photos.png");
    }

    return ListTile(
        dense: true,
        visualDensity: VisualDensity(vertical: 2),
        title: Text(item.word ?? "-", style: Theme
            .of(context)
            .textTheme
            .headline1),
        subtitle: Text(item.meaning ?? "", style: Theme
            .of(context)
            .textTheme
            .headline2,),
        enabled: true,
        leading: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image(image: image,)),
        trailing: IconButton(
          icon: item.focus == "true"
              ? const Icon(Icons.star, color: Colors.yellow)
              : const Icon(Icons.star_border, color: Colors.yellow),
          onPressed: () {
            var value = item.focus == "true" ? true : false;
            logic.fetchFocus(!value, item.sId!, index);
          },
        ),
        onTap: () {
          var updateScreen = UpdateWordController();
          updateScreen.trigger(item, this);
          Get.to(updateScreen);
        });
  }
}
