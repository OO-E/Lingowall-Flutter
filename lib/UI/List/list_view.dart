import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Core/service/deck_service.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/Extension/Color.dart';
import 'package:lingowall/UI/add_and_update/add_and_update_view.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:lingowall/UI/List/list_logic.dart';
import 'package:lingowall/UI/Cell/WordCell.dart';
import 'package:velocity_x/velocity_x.dart';

import '../UpdateWord/updateword_view.dart';

class ListViewWidget extends StatelessWidget with UIDelegate {
  ListViewWidget({Key? key}) : super(key: key);

  final logic = Get.put(ListLogic());

  @override
  Widget build(BuildContext context) {
    //Get.off(LoginController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Words"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Get.to(AddAndUpdateController());
              },
            )
          ],
        ),
        body: SafeArea(child: Obx(() {
          return ViewFactory(context);
        })));
  }

  Widget ViewFactory(BuildContext context) {
    if (logic.viewShowType.value == ViewShowType.dataView) {
      return MainView(context);
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
        color: Theme.of(context).primaryColor,
      ).w(100).h(100).centered().box.make(),
      const SizedBox(
        height: 32,
      ),
      Text(
        "You don't have any word in \nyour ${DeckService.learnLanguage} deck",
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ).centered(),
    ]).w(1.0.sw).h(1.0.sh).box.make();
  }

  Column MainView(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Obx(
          () => ListView.builder(
              itemCount: logic.wordItems.length,
              itemBuilder: (context, index) {
                return WordCell2(logic.wordItems[index], context, index);
                // return WordCell2(logic.wordItems[index], context);
              }),
        )),
        Obx(() {
          return Container(
              height: 50,
              child: NumberPaginator(
                config: NumberPaginatorUIConfig(
                  buttonUnselectedForegroundColor:
                      Theme.of(context).colorScheme.primaryVariant,
                  buttonSelectedBackgroundColor:
                      Theme.of(context).colorScheme.secondary,
                  buttonSelectedForegroundColor:
                      Theme.of(context).colorScheme.secondaryVariant,
                ),
                numberPages: logic.pageCount.value,
                onPageChange: (int index) {
                  logic.getWords(index);
                  // handle page change...
                },
              ));
        }),
      ],
    );
  }

  @override
  void onRefreshPage() {
    logic.getWords(0);
    logic.getWordsCount();
  }

  void tabbarRefresh() {
    if (logic.wordItems.value.length == 0) {
      logic.getWords(0);
      logic.getWordsCount();
    }
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
        title: Text(item.word ?? "-",
            style: Theme.of(context).textTheme.headline1),
        subtitle: Text(
          item.meaning ?? "",
          style: Theme.of(context).textTheme.headline2,
        ),
        enabled: true,
        leading: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image(
              image: image,
            )),
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
