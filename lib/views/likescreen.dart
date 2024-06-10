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
                    // Container(
                    // height: homeController.heights.first.toDouble(),
                    // color: homeController.colors.first,
                    // );
                  },
                );
                // return GridView.builder(
                //   shrinkWrap: true,
                //   physics: ScrollPhysics(),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 3,
                //       crossAxisSpacing: 8,
                //       mainAxisSpacing: 8,
                //       mainAxisExtent: 250),
                //   itemCount: homeController.searchImgList.length,
                //   itemBuilder: (context, index) {
                //     return InkWell(
                //       onTap: () async {
                //         Get.to(FullImageScreen());
                //         homeController.singleUrl.value =
                //             "${homeController.searchImgList[index]['src']['large']}";
                //       },
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //         child: Obx(() {
                //           return Image.network(
                //               "${homeController.searchImgList[index]['src']['large']}",
                //               fit: BoxFit.cover);
                //         }),
                //       ),
                //     );
                //   },
                // );
              }),
            ),
          ]),
        ],
      ),
    );
    // return Placeholder();
    // return GridView.builder(
    //   shrinkWrap: true,
    //   physics: ScrollPhysics(),
    //   scrollDirection: Axis.vertical,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       crossAxisSpacing: 8,
    //       mainAxisSpacing: 8,
    //       mainAxisExtent: 250),
    //   itemCount: homeController.storeUrlList.length,
    //   itemBuilder: (context, index) {
    //     return Stack(
    //       alignment: Alignment.topRight,
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             color: Colors.grey,
    //           ),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(20),
    //             child: Obx(() {
    //               return
    //                 Image.network("${homeController.storeUrlList[index]}",
    //                   fit: BoxFit.cover);
    //             }),
    //           ),
    //         ),
    //         Container(color: Colors.black, child: Icon(Icons.menu)),
    //       ],
    //     );
    //   },
    // );
  }
}
