import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'updateword_logic.dart';
import 'package:lingowall/Core/model/word_model.dart';
import 'package:lingowall/Helper/Debouncer.dart';
import 'package:velocity_x/velocity_x.dart';

class UpdateWordController extends StatelessWidget {
  final logic = Get.put(UpdateWordLogic());
  FocusNode _focusNode = FocusNode();
  final _debouncer = Debouncer();

  UpdateWordController({Key? key}) : super(key: key);

  void trigger(WordModel item, UIDelegate? delegate) {
    logic.item.add(item);
    logic.delegate = delegate;
  }

  @override
  Widget build(BuildContext context) {
    _debouncer.duration = Duration(milliseconds: 750);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Update"),
          actions: [
            Obx(() {
              return IconButton(
                icon: logic.isFocus == true
                    ? Icon(Icons.star, color: Colors.yellow)
                    : Icon(Icons.star_border, color: Colors.yellow),
                onPressed: () {
                  var value = !logic.isFocus.value;
                  logic.fetchFocus(value);
                },
              );
            })
          ],
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: Obx(() {
            return Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              icon(context),
                              wordTextField(context),
                              meanTextField(context),
                              exampleTextField(context),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        updateButton(context),
                        const SizedBox(
                          height: 10,
                        ),
                        deleteButton(context)
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        )));
  }

  Container deleteButton(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.error),
            foregroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
          child: Text('Delete'.tr),
          onPressed: () {
            Get.defaultDialog(
                title: "",
                content: Text("Do you want to delete this word"),
                radius: 5,
                textConfirm: "Confirm",
                textCancel: "Cancel",
                onConfirm: () {
                  logic.fetchDelete();
                  Get.back();
                },
                onCancel: () {},
                confirmTextColor:
                    Theme.of(context).colorScheme.secondaryVariant);
          },
        ));
  }

  Container updateButton(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
            foregroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
          child: Text('Update'.tr),
          onPressed: () {
            logic.fetchUpdate();
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
            labelText: "Mean",
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
            labelText: "Word",
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

}
