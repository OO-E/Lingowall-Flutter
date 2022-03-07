import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lingowall/UI/add_and_update/add_and_update_view.dart';
import 'package:lingowall/model/MockModel.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:lingowall/UI/login/login_view.dart';
import 'list_logic.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'package:lingowall/UI/Cell/WordCell.dart';

class ListViewWidget extends StatelessWidget {
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
                Get.to(AddAndUpdateController(ViewType.add));
              },
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Obx(() {
                return Container(
                    height: 50,
                    child: NumberPaginator(
                      buttonUnselectedForegroundColor: Colors.black,
                      buttonSelectedBackgroundColor: Colors.blue,
                      buttonSelectedForegroundColor: Colors.white,
                      height: 50,
                      numberPages: logic.pageCount.value,
                      onPageChange: (int index) {
                        logic.getWords(index);
                        // handle page change...
                      },
                    ));
              }),
              Flexible(
                  child: Obx(
                () => ListView.builder(
                    itemCount: logic.wordItems.length,
                    itemBuilder: (context, index) {
                      return WordCell(item: logic.wordItems.value[index]);
                    }),
              )),
            ],
          ),
        ));
  }
}

