import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:walmart/controller/homecontroller.dart';
import 'package:walmart/views/fullimgscreen.dart';

class like_Screen extends StatefulWidget {
  const like_Screen({super.key});

  @override
  State<like_Screen> createState() => _like_ScreenState();
}

class _like_ScreenState extends State<like_Screen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [

          Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Obx(() {
                return DynamicHeightGridView(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.storeUrlList.length,
                  crossAxisCount: 3,
                  builder: (ctx, index) {
                    homeController.heights.shuffle();
                    return InkWell(
                      onTap: () async {
                        print('${homeController.heights.indexed}');
                        Get.to(FullImageScreen());
                        homeController.singleUrl.value =
                        "${homeController.storeUrlList[index]}";
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Obx(() {
                          homeController.heights.shuffle();
                          return Image.network(
                              height: homeController.heights.first.toDouble(),
                              "${homeController.storeUrlList[index]}",
                              fit: BoxFit.cover);
                        }),
                      ),
                    );
                  },
                );
              }),
            ),
          ]),
        ],
      ),
    );
  }
}
