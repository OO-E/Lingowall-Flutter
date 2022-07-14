import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/UI/add_and_update/add_and_update_view.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:lingowall/UI/List/list_logic.dart';
import 'package:lingowall/UI/Cell/WordCell.dart';

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
        body: SafeArea(
          child: Column(
            children: [

              Flexible(
                  child: Obx(
                () => ListView.builder(
                    itemCount: logic.wordItems.length,
                    itemBuilder: (context, index) {
                      return WordCell(item: logic.wordItems[index],delegate: this,);
                     // return WordCell2(logic.wordItems[index], context);
                    }),
              )),
              Obx(() {
                return Container(
                    height: 50,
                    child: NumberPaginator(

                      buttonUnselectedForegroundColor: Theme.of(context).colorScheme.primaryVariant,
                      buttonSelectedBackgroundColor: Theme.of(context).colorScheme.secondary,
                      buttonSelectedForegroundColor: Theme.of(context).colorScheme.secondaryVariant,
                      height: 50,
                      numberPages: logic.pageCount.value,
                      onPageChange: (int index) {
                        logic.getWords(index);
                        // handle page change...
                      },
                    ));
              }),
            ],
          ),
        ));
  }

  @override
  void onRefreshPage() {
    logic.getWords(0);
    logic.getWordsCount();
  }

  ListTile WordCell2(WordModel item, BuildContext context) {
    return ListTile(
        title: Text(item.word ?? "-"),
        subtitle: Text(item.meaning ?? ""),

        enabled: true,
        onTap: () {
          //logic.showPassword(item);
        });
  }
}

