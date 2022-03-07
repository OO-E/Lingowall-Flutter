import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'updateword_logic.dart';
import 'package:lingowall/Core/model/word_model.dart';

class UpdateWordController extends GetView<UpdateWordLogic> {
  final logic = Get.put(UpdateWordLogic());

  UpdateWordController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.black12))),
                              child: TextField(
                                controller: logic.wordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Word",
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.black12))),
                              child: TextField(
                                controller: logic.definationController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Defination",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.black12))),
                              child: TextField(
                                controller: logic.exampleController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Example",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: logic.meanController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mean",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.deepOrangeAccent),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white)),
                            child: Text('Update'.tr),
                            onPressed: () {},
                          )),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
