import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walmart/controller/homecontroller.dart';
import 'package:walmart/views/fullimgscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    Future.microtask(() {
      homeController.imgList.clear();
      homeController.getAllImg(query: "all", page: 1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: //   GridView.builder(
                    //   shrinkWrap: true,
                    //   physics: ScrollPhysics(),
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 3,
                    //       crossAxisSpacing: 8,
                    //       mainAxisSpacing: 8,
                    //       mainAxisExtent: 250),
                    //   itemCount: homeController.imgList.length,
                    //   itemBuilder: (context, index) {
                    //     return InkWell(
                    //       onTap: () async {
                    //         Get.to(FullImageScreen());
                    //         homeController.singleUrl.value =
                    //         "${homeController.imgList[index]['src']['large']}";
                    //       },
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(20),
                    //         child: Obx(() {
                    //           return Image.network(
                    //               "${homeController.imgList[index]['src']['large']}",
                    //               fit: BoxFit.cover);
                    //         }),
                    //       ),
                    //     );
                    //   },
                    // );
                    Obx(() {
                  return DynamicHeightGridView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController.imgList.length,
                    crossAxisCount: 3,
                    builder: (ctx, index) {
                      homeController.heights.shuffle();
                      return InkWell(
                        onTap: () async {
                          print('${homeController.heights.indexed}');
                          Get.to(FullImageScreen());
                          homeController.singleUrl.value =
                              "${homeController.imgList[index]['src']['large']}";
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Obx(() {
                            homeController.heights.shuffle();
                            return Image.network(
                              height: homeController.heights.first.toDouble(),
                                "${homeController.imgList[index]['src']['large']}",
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
                }),
              ),
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Row(
            children: [
              homeController.counter <= 0
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FloatingActionButton(
                        backgroundColor: Colors.orangeAccent,
                        onPressed: () async {
                          homeController.counterDecreeFun();
                          homeController.getAllImg(
                              query: "all", page: homeController.counter.value);
                          homeController.imgList.clear();
                        },
                        child: Icon(Icons.arrow_left, color: Colors.black, size: 20),
                      ),
                    )
                  : SizedBox(),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FloatingActionButton(
                  heroTag: 2,
                  backgroundColor: Colors.orangeAccent,
                  onPressed: () async {
                    homeController.counterIncreeFun();
                    homeController.getAllImg(
                        query: "all", page: homeController.counter.value);
                    homeController.imgList.clear();
                  },
                  child: Icon(Icons.arrow_right, color: Colors.black, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
