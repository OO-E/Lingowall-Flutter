import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingowall/Delegate/UIDelegate.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Core/model/country_list_model.dart';
import 'countrylist_logic.dart';

class CountrylistPage extends StatefulWidget {

  CountryDelegate? delegate;
  String type = "";

  @override
  _CountrylistPageState createState() => _CountrylistPageState();
}

class _CountrylistPageState extends State<CountrylistPage> {
  final logic = Get.put(CountrylistLogic());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("language list")),
      body: SafeArea(child: Obx(() {
        return ListView.builder(

            itemCount: logic.country.length,
            itemBuilder: (context, index) {
              var item = logic.country[index];
              return CountryItem(item).paddingOnly(left: 12,right: 12, top: 8);
              // return WordCell2(logic.wordItems[index], context);
            });
      }),
      ),
    );
  }

  Image icon(String url) {
    ImageProvider image;

    if (url != "") {
      image = NetworkImage(url);
    } else {
      image = AssetImage("assets/photos.png");
    }

    return  Image(
      image: image,
    );
  }
  
  @override
  void dispose() {
    Get.delete<CountrylistLogic>();
    super.dispose();
  }

  Widget CountryItem(Countries element) {
    return HStack([
          icon(element.image ?? "")
          .w(50)
          .h(50)
          .paddingOnly(left: 10),
      element.title!.text.size(20).make().paddingOnly(left: 10)
    ])
        .p4()
        .h(64)
        .box
        .gray50
        .make()
        .onTap(() {

          widget.delegate?.selectedCountry(widget.type, element);
          Get.back();
    });
  }
}
