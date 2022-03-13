import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_and_update_logic.dart';


class AddAndUpdateController extends StatelessWidget {

  AddAndUpdateController({Key? key}) : super(key: key);

  final logic = Get.put(Add_and_updateLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("LINGOWALL")),
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
                            child: Obx(() {
                              return Column(
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
                                          errorText: logic.wordError.value,
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
                                        errorText: logic.definationError.value,
                                        border: InputBorder.none,
                                        labelText: "Defination",),
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
                                        errorText: logic.exampleError.value,
                                        border: InputBorder.none,
                                        labelText: "Example",),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: logic.meanController,
                                      decoration: InputDecoration(
                                        errorText: logic.meanError.value,
                                        border: InputBorder.none,
                                        labelText: "Mean",),
                                    ),
                                  )
                                ],
                              );
                            }),
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
                                child: Text('Add'.tr),
                                onPressed: () {
                                  logic.addNewWord();
                                },
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
