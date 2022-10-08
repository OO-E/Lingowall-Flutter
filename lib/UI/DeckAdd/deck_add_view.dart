import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'deck_add_logic.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DeckAddPage extends StatefulWidget {
  @override
  _DeckAddPageState createState() => _DeckAddPageState();
}

class _DeckAddPageState extends State<DeckAddPage> {
  final logic = Get.put(DeckAddLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create New Deck")),
      body: SafeArea(
          child: VStack([
        "Language you want to learn".text.size(16).semiBold.make().paddingOnly(bottom: 10),
        VxContinuousRectangle(
          backgroundColor: Vx.gray200,
          radius: 10,
          child: HStack([
            Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/lingowall-d854c.appspot.com/o/public_flag%2Fal.png?alt=media&token=be20f6d8-82df-4888-8f58-80a3b5c0a621')
                .w(50)
                .h(50)
                .paddingOnly(left: 10),
            "English".text.size(20).make().paddingOnly(left: 10)
          ]),
        ).w(0.8.sw).h(64).box.make().onTap(() {
        }),

        SizedBox(height: 30.0),

        "Your native language".text.size(16).semiBold.make().paddingOnly(bottom: 10),
        VxContinuousRectangle(
          backgroundColor: Vx.gray200,
          radius: 10,
          child: HStack([
            Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/lingowall-d854c.appspot.com/o/public_flag%2Fal.png?alt=media&token=be20f6d8-82df-4888-8f58-80a3b5c0a621')
                .w(50)
                .h(50)
                .paddingOnly(left: 10),
            "English".text.size(20).make().paddingOnly(left: 10)
          ]),
        ).w(0.8.sw).h(64).box.make(),
      ]).objectTopCenter().paddingOnly(top: 64).box.gray50.make()),
    );
    print("Tapped");
  }

  @override
  void dispose() {
    Get.delete<DeckAddLogic>();
    super.dispose();
  }
}
