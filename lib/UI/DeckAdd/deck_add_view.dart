import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingowall/Core/model/country_list_model.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:lingowall/UI/CountryList/countrylist_view.dart';
import 'deck_add_logic.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DeckAddPage extends StatefulWidget {
  @override
  _DeckAddPageState createState() => _DeckAddPageState();
}

class _DeckAddPageState extends State<DeckAddPage> with CountryDelegate {
  final logic = Get.put(DeckAddLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create New Deck")),
      body: SafeArea(
        child: Obx(() {
          return VStack([
            "Language you want to learn"
                .text
                .size(16)
                .semiBold
                .make()
                .paddingOnly(bottom: 10),
            VxContinuousRectangle(
              backgroundColor: Vx.gray200,
              radius: 10,
              child: HStack([
                icon(logic.wantTo.value.image ?? "")
                    .w(50)
                    .h(50)
                    .paddingOnly(left: 10),
                (logic.wantTo.value.title ?? "Select You Want To Language")
                    .text
                    .size(16)
                    .make()
                    .paddingOnly(left: 10)
              ]),
            ).w(0.8.sw).h(64).box.make().onTap(() {
              var countryList = CountrylistPage();
              countryList.delegate = this;
              countryList.type = "WANT_TO";
              Get.to(countryList);
            }),
            SizedBox(height: 30.0),
            "Your native language"
                .text
                .size(16)
                .semiBold
                .make()
                .paddingOnly(bottom: 10),
            VxContinuousRectangle(
              backgroundColor: Vx.gray200,
              radius: 10,
              child: HStack([
                icon(logic.native.value.image ?? "")
                    .w(50)
                    .h(50)
                    .paddingOnly(left: 10),
                (logic.native.value.title ?? "Select Your Native Language")
                    .text
                    .size(16)
                    .make()
                    .paddingOnly(left: 10)
              ]),
            ).w(0.8.sw).h(64).box.make().onTap(() {
              var countryList = CountrylistPage();
              countryList.delegate = this;
              countryList.type = "NATIVE";
              Get.to(countryList);
            }),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    logic.sendButtonBackgroundColor()),
                foregroundColor: MaterialStateProperty.all<Color>(
                    logic.sendButtonForegroundColor()),

              ),
              child: Text("SAVE", style: TextStyle(fontSize: 16)),
              onPressed: () {
                logic.saveRequest();
              },
            ).w(0.8.sw).h(56).paddingOnly(top: 30)
          ]);
        }).objectTopCenter().paddingOnly(top: 64).box.gray50.make(),
      ),
    );
    print("Tapped");
  }

  Image icon(String url) {
    ImageProvider image;

    if (url != "") {
      image = NetworkImage(url);
    } else {
      image = AssetImage("assets/photos.png");
    }

    return Image(
      image: image,
    );
  }

  @override
  void dispose() {
    Get.delete<DeckAddLogic>();
    super.dispose();
  }

  @override
  void selectedCountry(String type, Countries country) {
    if (type == "WANT_TO") {
      logic.wantTo.value = country;
    } else if (type == "NATIVE") {
      logic.native.value = country;
    }
  }
}
