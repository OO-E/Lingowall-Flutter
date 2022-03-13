import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:get/get.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/UI/UpdateWord/updateword_view.dart';
import 'package:lingowall/Helper/StaticMethods.dart';

class WordCell extends StatelessWidget {
  final WordModel item;
  final UIDelegate? delegate;

  const WordCell({Key? key, required this.item, required this.delegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: GestureDetector(
          onDoubleTap: () {
            print(item.word);
            var updateScreen = UpdateWordController();
            updateScreen.trigger(item, delegate);
            Get.to(updateScreen);
          },
          child: Card(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    item.word ?? "",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.defination ?? "",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.example ?? "",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.headline3,
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
                .showMessage(item.word ?? "", item.meaning ?? "");
          },
        ),
      ),
    );
  }
}
