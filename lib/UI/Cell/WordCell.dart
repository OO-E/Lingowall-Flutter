import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lingowall/UI/updateword/updateword_view.dart';
import 'package:lingowall/Helper/StaticMethods.dart';
import 'package:lingowall/UI/updateword/updateword_logic.dart';

class WordCell extends StatelessWidget {
  final WordModel item;

  const WordCell({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GestureDetector(
          onDoubleTap: () {
            Get.to(UpdateWordController(), arguments: {"item": item});
          },
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 0,
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    item.word ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.defination ?? "",
                    maxLines: 3,
                    style: const TextStyle(color: Colors.teal, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.example ?? "",
                    maxLines: 3,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          onTap: () {
            StaticMethods.instance
                .showWordMean(item.word ?? "", item.meaning ?? "");
          },
        ),
      ),
    );
  }
}
